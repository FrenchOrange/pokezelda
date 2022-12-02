#define PROGRAM_NAME "stadium"
#define USAGE_OPTS "[-h|--help] [-b|--base us|eu|dbg] pokecrystal.gbc"

#include "common.h"

enum Base { BASE_NONE, BASE_US, BASE_EU, BASE_DEBUG };

void parse_args(int argc, char *argv[], enum Base *base) {
	struct option long_options[] = {
		{"base", required_argument, 0, 'b'},
		{"help", no_argument, 0, 'h'},
		{0}
	};
	for (int opt; (opt = getopt_long(argc, argv, "b:h", long_options)) != -1;) {
		switch (opt) {
		case 'b':
			*base = !strcmp(optarg, "us") ? BASE_US :
				!strcmp(optarg, "eu") ? BASE_EU :
				!strcmp(optarg, "dbg") ? BASE_DEBUG :
				BASE_NONE;
			break;
		case 'h':
			usage_exit(0);
			break;
		default:
			usage_exit(1);
		}
	}
}

// The Game Boy cartridge header stores a global checksum at 0x014E-0x014F
#define GLOBALOFF 0x014E
// "base" data; Crystal-only
#define BASESIZE 24
// ASCII "N64PS3" header
#define N64PS3SIZE 6
// N64PS3 + CRC
#define HEADERSIZE (N64PS3SIZE + 2)
// Checksum every half-bank
#define CHECKSIZE 0x2000
// The CRC polynomial value
#define CRC_POLY 0xC387
// The CRC initial value (also used for checksums)
#define CRC_INIT 0xFEFE
// The CRC initial value for Crystal base data
#define CRC_INIT_BASE 0xACDE

// Base data format: "base", 1, version byte, CRC (big-endian),
// 16 bytes = a 128-bit mask of which banks Stadium can skip comparing

uint8_t us_base[BASESIZE] = {'b', 'a', 's', 'e', 1, 0, 0, 0,
	0x40, 0x11, 0x00, 0x22, 0x00, 0x3A, 0xF3, 0x38,
	0x18, 0xFF, 0xFF, 0x0F, 0x07, 0x10, 0x68, 0x07};

uint8_t eu_base[BASESIZE] = {'b', 'a', 's', 'e', 1, 1, 0, 0,
	0x00, 0x10, 0x00, 0x00, 0x00, 0x0C, 0xA3, 0x38,
	0x00, 0xFF, 0xFF, 0x07, 0x00, 0x00, 0x00, 0x14};

uint8_t dbg_base[BASESIZE] = {'b', 'a', 's', 'e', 1, 0, 0, 0,
	0x40, 0x10, 0x00, 0x22, 0x00, 0x3A, 0xE3, 0x38,
	0x00, 0xFF, 0xFF, 0x07, 0x07, 0x10, 0x68, 0x06};

uint8_t n64ps3[N64PS3SIZE] = {'N', '6', '4', 'P', 'S', '3'};

#define SET_U16BE(file, off, v) do { \
	file[(off) + 0] = (uint8_t)(((v) & 0xFF00) >> 8); \
	file[(off) + 1] = (uint8_t)(((v) & 0x00FF) >> 0); \
} while (0)

void calculate_checksums(uint8_t *file, int filesize, enum Base base) {
	int NUMCHECKS = filesize / CHECKSIZE;
	int DATASIZE = HEADERSIZE + NUMCHECKS * 2; // 2 bytes per checksum
	int ORIGIN = filesize - DATASIZE; // Stadium data goes at the end of the file

	// Initialize the CRC table
	uint16_t crc_table[256];
	for (int i = 0; i < 256; i++) {
		uint16_t c = i;
		uint16_t rem = 0;
		for (int y = 0; y < 8; y++) {
			rem = (rem >> 1) ^ ((rem ^ c) & 1 ? CRC_POLY : 0);
			c >>= 1;
		}
		crc_table[i] = rem;
	}

	// Clear the global checksum
	SET_U16BE(file, GLOBALOFF, 0);

	// Write the appropriate base data, or none
	int BASEOFF = ORIGIN - BASESIZE;
	if (base == BASE_US) {
		memcpy(file + BASEOFF, us_base, BASESIZE);
	} else if (base == BASE_EU) {
		memcpy(file + BASEOFF, eu_base, BASESIZE);
	} else if (base == BASE_DEBUG) {
		memcpy(file + BASEOFF, dbg_base, BASESIZE);
	}

	// Calculate the CRC of the base data, or none
	if (base) {
		uint16_t crc = CRC_INIT_BASE;
		for (int i = BASEOFF; i < BASEOFF + BASESIZE; i++) {
			crc = (crc >> 8) ^ crc_table[(crc & 0xFF) ^ file[i]];
		}
		SET_U16BE(file, BASEOFF + 6, crc);
	}

	// Initialize the Stadium data (this should be free space anyway)
	memset(file + ORIGIN, 0, DATASIZE);
	memcpy(file + ORIGIN, n64ps3, N64PS3SIZE);

	// Calculate the half-bank checksums
	for (int i = 0; i < NUMCHECKS; i++) {
		uint16_t checksum = CRC_INIT;
		for (int j = 0; j < CHECKSIZE; j++) {
			checksum += file[i * CHECKSIZE + j];
		}
		SET_U16BE(file, ORIGIN + HEADERSIZE + i * 2, checksum);
	}

	// Calculate the CRC of the half-bank checksums
	uint16_t crc = CRC_INIT;
	for (int i = ORIGIN + HEADERSIZE; i < ORIGIN + DATASIZE; i++) {
		crc = (crc >> 8) ^ crc_table[(crc & 0xFF) ^ file[i]];
	}
	SET_U16BE(file, ORIGIN + HEADERSIZE - 2, crc);

	// Calculate the global checksum
	uint16_t globalsum = 0;
	for (int i = 0; i < filesize; i++) {
		globalsum += file[i];
	}
	SET_U16BE(file, GLOBALOFF, globalsum);
}

int main(int argc, char *argv[]) {
	enum Base base = BASE_NONE;
	parse_args(argc, argv, &base);

	argc -= optind;
	argv += optind;
	if (argc < 1) {
		usage_exit(1);
	}

	char *filename = argv[0];
	long filesize;
	uint8_t *file = read_u8(filename, &filesize);
	calculate_checksums(file, filesize, base);
	write_u8(filename, file, filesize);
	return 0;
}

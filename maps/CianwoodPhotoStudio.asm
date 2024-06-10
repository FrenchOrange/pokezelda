	object_const_def
	const CIANWOODPHOTOSTUDIO_FISHING_GURU
	const CIANWOODPHOTOSTUDIO_TEACHER

CianwoodPhotoStudio_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodPhotoStudioFishingGuruScript:
	faceplayer
	opentext
	writetext CianwoodPhotoStudioFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext CianwoodPhotoStudioFishingGuruText_Yes
	waitbutton
	special PhotoStudio
	waitbutton
	closetext
	end

.Refused:
	writetext CianwoodPhotoStudioFishingGuruText_No
	waitbutton
	closetext
	end

CianwoodPhotoStudioPosterShopScript:
	opentext
	writetext CianwoodPhotoStudioTeacherMannersText
	waitbutton
CianwoodPhotoStudioTeacher_LoopScript:
	writetext CianwoodPhotoStudioTeacher_AskWhichPosterText
	special PlaceMoneyTopRight
	loadmenu CianwoodPhotoStudioTeacherMenu
	verticalmenu
	closewindow
	ifequal 1, .Poster1
	ifequal 2, .Poster2
	ifequal 3, .Poster3
	jump CianwoodPhotoStudioTeacher_Cancel
	
.Poster1
	checkmoney YOUR_MONEY, 4000
	ifequal HAVE_LESS, CianwoodPhotoStudioTeacherNotEnoughMoney
	writetext CianwoodPhotoStudioTeacher_AreYouSureText
	yesorno
	iffalse CianwoodPhotoStudioTeacher_Cancel
	checkevent EVENT_DECO_POSTER_2
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_POSTER_2
	takemoney YOUR_MONEY, 4000
	jump CianwoodPhotoStudioTeacher_FinishScript
	end
	
.Poster2
	checkmoney YOUR_MONEY, 2000
	ifequal HAVE_LESS, CianwoodPhotoStudioTeacherNotEnoughMoney
	writetext CianwoodPhotoStudioTeacher_AreYouSureText
	yesorno
	iffalse CianwoodPhotoStudioTeacher_Cancel
	checkevent EVENT_DECO_POSTER_3
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_POSTER_3
	takemoney YOUR_MONEY, 2000
	jump CianwoodPhotoStudioTeacher_FinishScript
	end
	
.Poster3
	checkmoney YOUR_MONEY, 1500
	ifequal HAVE_LESS, CianwoodPhotoStudioTeacherNotEnoughMoney
	writetext CianwoodPhotoStudioTeacher_AreYouSureText
	yesorno
	iffalse CianwoodPhotoStudioTeacher_Cancel
	checkevent EVENT_DECO_POSTER_4
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_POSTER_4
	takemoney YOUR_MONEY, 1500
	jump CianwoodPhotoStudioTeacher_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext CianwoodPhotoStudioTeacher_AlreadyHaveDecoText
	waitbutton
	jump CianwoodPhotoStudioTeacher_LoopScript

	
CianwoodPhotoStudioTeacherMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "PIKACHU     ¥4000@"
	db "CLEFAIRY    ¥2000@"
	db "JIGGLYPUFF  ¥1500@"
	
CianwoodPhotoStudioTeacher_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext CianwoodPhotoStudioTeacher_HereYouGoText
	waitbutton
	jump CianwoodPhotoStudioTeacher_LoopScript

CianwoodPhotoStudioTeacher_Cancel:
	writetext CianwoodPhotoStudioTeacherTakeCare
	waitbutton
	closetext
	end
	
CianwoodPhotoStudioTeacherNotEnoughMoney:
	writetext CianwoodPhotoStudioTeacherNotEnoughMoneyText
	waitbutton
	closetext
	end

CianwoodPhotoStudioFishingGuruText_Question:
	text "You have magnifi-"
	line "cent #MON with"
	cont "you."

	para "How about a photo"
	line "for a souvenir?"
	done

CianwoodPhotoStudioFishingGuruText_Yes:
	text "OK! Big smile now!"
	done

CianwoodPhotoStudioFishingGuruText_No:
	text "Oh, that's too"
	line "bad. I thought it"

	para "would be a great"
	line "memento…"
	done

CianwoodPhotoStudioTeacherMannersText:
	text "My husband loves"
	line "taking pictures of"
	cont "#MON."

	para "He's quite good"
	line "at it too! I have"
	cont "even taken to turn"
	para "some of his best"
	line "work into POSTERS."
	done

CianwoodPhotoStudioTeacher_AskWhichPosterText:
	text "Which POSTER looks"
	line "best to you?"
	done
	
CianwoodPhotoStudioTeacher_AreYouSureText:
	text "Are you sure?"
	done

CianwoodPhotoStudioTeacher_AlreadyHaveDecoText:
	text "You already have"
	line "this POSTER!"
	done

CianwoodPhotoStudioTeacher_HereYouGoText:
	text "Here you go! We"
	line "will deliver this"
	cont "item to your home"
	cont "without delay!"
	done

CianwoodPhotoStudioTeacherNotEnoughMoneyText:
	text "I'm sorry, but it"
	line "seems you don't"
	cont "have enough money."
	done
	
CianwoodPhotoStudioTeacherTakeCare:
	text "It was a pleasure."
	line "Take care!"
	done

CianwoodPhotoStudio_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, CIANWOOD_CITY, 5
	warp_event  5,  7, CIANWOOD_CITY, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodPhotoStudioFishingGuruScript, -1
	object_event  7,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodPhotoStudioPosterShopScript, -1

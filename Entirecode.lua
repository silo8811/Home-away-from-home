version = '0.29.1A' --note: uses stormworks API
score = 0
etimer = 0
timet = 0
event = false
event2 = 0
accepted = false
eventpopup = false
timer500t = 0
hp = 100 --max 100 lv1, 300 lv2, 500 lv3
reactorlv = 1 --max 5
reactorpoints = 1 --max 1k
fame = 1 --max 1000
size = 1 --max 3
research = 1 --max 1000
firex = 0
firey = 0
firer = 0
fireg = 0
firet = 0
repairs = 10
repairst = false
perevent = false
scanning = 25
menu = false
menu2 = -1
menutoggletitle = false
menutoggle = false
menutoggle2 = false
menutoggle3 = false
menutoggle4 = false
e3b1 = false
e3b2 = false
attack1 = 25
attack2 = 30
attacktimer = 0
destroyed1 = false
destroyed2 = false
eventrandom = 0
titlescreen = true
animation = false
animationstep = 0
redtoggle = false
greentoggle = false
bluetoggle = false
red = 1
green = 1
blue = 1
red2 = .5
green2 = .5
blue2 = .5
settings = false
randomstation = 0
eventbutton1 = false
accident = 0
tutorial = false
tutorialstep = 1
tutorialbutton = false
readtimer = 0
tutorialbutton2 = 20
buttontoggle = false
npchealth = 100
npcdead = false
npcship = 100
npcbutton = false
showertable = {}
function onTick()
	if animation then
		animationstep = animationstep + 1
	end
	click = input.getBool(1)
	clickx = input.getNumber(3)
	clicky = input.getNumber(4)
	if animation == false and titlescreen == false then
	if attacktimer > 500 then
		attacktimer = 0
	end
	if fame > 1000 then
		fame = 1000
	end
	if research > 1000 then
		research = 0
	end
	reactorpoints = math.floor(reactorpoints)
	hp = math.floor(hp)
	timer500t = timer500t + 1
	if timer500t > 500 then
		timer500t = 0
		reactorpoints = reactorpoints + ((reactorlv*20)/(((size*3)+1)/3))
	end
	if menu2 == -1 then
		menu = false
	elseif menu2 == 1 then
		menu = true
	end
	firet = firet + 1
	firex = firet / 30
	firey = firet / 13+3
	if firet < 3 then
		firer = math.random(100, 255)
		fireg = math.random(35, 125)
	end
	if firet > 30 then
		firet = 0
	end
	if event == false and menu == false then
	etimer = etimer + 1
	end
	if etimer > 300 and event == false and menu == false then
		event = true
		etimer = 0
	else
		etimer = etimer
		event = event
	end
	if event and event2 == 0 then
		event2 = math.random(1, 5)
		if event2 == 4 then
			randomstation = math.random(1, 3)
			if randomstation == 1 then
				salvage = 10
			elseif randomstation == 2 then
				salvage = 20
			elseif randomstation == 3 then
				salvage = 30
			end
		end
	else
		event2 = event2
	end
	if event == false then
		event2 = 0
	end
--event 5
	if event and event2 == 5.1 and accepted == false then
		if click and event2 == 5.1 then
			accepted = false
			event = false
			event2 = 0
			fame = fame + 5
			research = research + 200
			eventpopup = false
			hp = math.floor(hp/5+0.5)*5
			meteorShower(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, false)
		end
	end
	if event and event2 == 5 and accepted == false then
		if click and event2 == 5 then
			accepted = true
		else
			accepted = accepted
		end
		eventpopup = true
	elseif event and event2 == 5 and accepted == true then
		eventpopup = false
	end
--event 4
	if event and event2 == 4 and accepted == false then
		if click and event2 == 4 then
			accepted = true
		else
			accepted = accepted
		end
		eventpopup = true
	elseif event and event2 == 4 and accepted == true then
		eventpopup = false
	end
	if event and event2 == 4.1 and eventpopup then
		if click and event2 == 4.1 then
			eventpopup = false
			event = false
			event2 = 0
			accepted = false
			hp = hp - 20
			accident = 0
			fame = fame - 1
		end
	end
	if event and event2 == 4.2 and eventpopup then
		if click and event2 == 4.2 then
			accident = 0
			eventpopup = false
			event = false
			event2 = 0
			accepted = false
			if size == 1 and hp < 80 then
				hp = hp + 20
				research = research + 20
				fame = fame + 5
			elseif size == 2 and hp < 280 then
				hp = hp + 20
				research = research + 20
				fame = fame + 10
			elseif size == 3 and hp < 480 then
				hp = hp + 20
				research = research + 20
				fame = fame + 10
			else
				research = research + 40
			end
		end
	end
--event 3
	if event and event2 == 3 and accepted == false then
		if click and event2 == 3 then
			accepted = true
		else
			accepted = accepted
		end
		eventpopup = true
	elseif event and event2 == 3 and accepted == true then
		eventpopup = false
	end
	if event and event2 == 3.1 then
		if click and event2 == 3.1 then
			eventpopup = false
			event = false
			event2 = 0
			e3b1 = false
			e3b2 = false
			destroyed1 = false
			destroyed2 = false
			attack1 = 25
			attack2 = 30
			accepted = false
		end
	end
	if event and event2 == 3.2 then
		if click and event2 == 3.2 then
			eventpopup = false
			event = false
			event2 = 0
			e3b1 = false
			e3b2 = false
			destroyed1 = false
			destroyed2 = false
			attack1 = 25
			attack2 = 30
			eventpopup = false
			research = research + 50
			accepted = false
		end
	end
	if event and event2 == 3.3 then
		if click and event2 == 3.3 then
			eventpopup = false
			event = false
			event2 = 0
			e3b1 = false
			e3b2 = false
			destroyed1 = false
			destroyed2 = false
			attack1 = 25
			attack2 = 30
			eventpopup = false
			research = research + 100
			accepted = false
		end
	end
--event 2
	if event and event2 == 2 and accepted == false then
		if click and event2 == 2 then
			accepted = true
		else
			accepted = accepted
		end
		eventpopup = true
	elseif event and event2 == 2 and accepted == true then
		eventpopup = false
	end
	if event and event2 == 2.1 then
		if click and event2 == 2.1 then
			hp = hp - 60
			event = false
			eventpopup = false
			event2 = 0
			click = false
			repairaccident = 0
			scanning = 25
			perevent = false
			fame = fame - 1
		end
	end
	if event and event2 == 2.2 then
		if click and event2 == 2.2 then
			fame = fame + 10
			research = research + 90
			event = false
			eventpopup = false
			event2 = 0
			click = false
			repairaccident = 0
			scanning = 25
			perevent = false
		end
	end
--event 1
	if event and event2 == 1 and accepted == false then
		if click and event2 == 1 then
			accepted = true
		else
			accepted = accepted
		end
		eventpopup = true
	elseif event and event2 == 1 and accepted then
		eventpopup = false
	end
	if event and event2 == 1.1 then
		if click and event2 == 1.1 then
			hp = hp - 30
			event = false
			eventpopup = false
			event2 = 0
			click = false
			repairaccident = 0
			repairs = 10
			perevent = false
		else
			hp = hp
			event = event
			eventpopup = eventpopup
			event2 = event2
			click = click
		end
	end
	if event and event2 == 1.2 then
		if click then
			fame = fame + 5
			event = false
			eventpopup = false
			event2 = 0
			click = false
			repairs = 10
			repairaccident = 0
		else
			fame = fame
			event = event
			eventpopup = eventpopup
			event2 = event2
			click = click
			perevent = false
		end
	end
	end
end
function onDraw()
	--tutorial
		screen.setColor(red*255, green*255, blue*255)
		if tutorial == false and titlescreen and settings == false and tutorialbutton == false and click == false then
			screen.drawRect(54, 85, 41, 7)
			screen.drawText(55, 86, 'tutorial')
		elseif tutorial == false and titlescreen and settings == false and tutorialbutton == false and click and clickx > 54 and clickx < 95 and clicky > 85 and clicky < 93 then
			screen.drawRectF(54, 85, 41, 7)
			screen.drawText(55, 86, 'tutorail')
			tutorialbutton = true
			tutorial = true
		elseif tutorial == false and titlescreen and settings == false and tutorialbutton and click and clickx > 54 and clickx < 95 and clicky > 85 and clicky < 93 then
			screen.drawRectF(54, 85, 41, 7)
			screen.drawText(55, 86, 'tutorial')
		elseif click == false and tutorialbutton == true then 
			tutorialbutton = false
		elseif settings == false and titlescreen and tutorial == false then
			screen.drawRect(54, 85, 41, 7)
			screen.drawText(55, 86, 'tutorial')
		end
		if tutorial then
			screen.setColor(red*255, green*255, blue*255)
				if tutorialstep == 1 then
					readtimer = readtimer + 1
					screen.drawText(1, 20, 'welcome to the tutorial.\nyou can find very useful\ninformation here on how to\nplay the game. even lore!\n(click to contuine)\n(you will click a lot)\n(ps, i had to get a new mouse\nafter a testing session)')
					if click and readtimer > 30 then
						tutorialstep = tutorialstep + 1
						readtimer = 0
					end
				end
				if tutorialstep == 2 then
					screen.drawText(1, 20, 'you will now learn how\nto interact with different\nthings in the game')
					readtimer = readtimer + 1
					if click and readtimer > 30 then
						tutorialstep = tutorialstep + 1
						readtimer = 0
					end
				end
				if tutorialstep == 3 then
					screen.drawText(1, 20, 'when you have a button\nsaying scan, or target,\nor repair (etc...)\nand it ends with a number,\nyou need to click on it')
					if click and clickx > 30 and clickx < 76 and clicky > 60 and clicky < 68 and buttontoggle == false then
						screen.drawRectF(30, 60, 46, 8)
						screen.drawText(31, 61, 'press!'..tutorialbutton2)
						buttontoggle = true
						tutorialbutton2 = tutorialbutton2 - 1
					elseif click and clickx > 30 and clickx < 76 and clicky > 60 and clicky < 68 and buttontoggle then
						screen.drawRectF(30, 60, 46, 8)
						screen.drawText(31, 61, 'press!'..tutorialbutton2)
					elseif click == false and buttontoggle then
						screen.drawRect(30, 60, 46, 8)
						screen.drawText(31, 61, 'press!'..tutorialbutton2)
						buttontoggle = false
					else
						screen.drawRect(30, 60, 46, 8)
						screen.drawText(31, 61, 'press!'..tutorialbutton2)
					end
					if tutorialbutton2 == 0 then
						tutorialbutton2 = 20
						tutorialstep = tutorialstep + 1
					end
				end
				if tutorialstep == 4 then
					readtimer = readtimer + 1
					screen.drawText(1, 5, 'great job! the final part is\nthe lore. currently the lore is\nthat the space station\nis designed by some old\nscientist who\'s ideas were\nrejected in the past\nbut when he brought up a new\nidea to the receptionist who\nrejected his idea,\nhe asked to speak\nto the director of the\nspace agency, who allowed\nhis project.\n(click to return to titlescreen')
					if click and readtimer > 120 then
						tutorial = false
						tutorialstep = 1
						readtimer = 0
					end
				end
		end
	screen.setColor(red*255, green*255, blue*255)
	if animation == false then
		screen.drawText(116, 91, 'v'..version)
	end
	if animation then
		screen.drawRect(140, 0, 20, 7)
		screen.drawText(141, 1, 'skip')
		if click and clickx > 140 and clickx < 160 and clicky > 0 and clicky < 7 then
			animation = false
			animationstep = 0
		end
	end
	--titlescreen
	if event == false and titlescreen == false and settings == false and eventpopup == false and animation == false then
		screen.drawRect(5, 40, 8, 3)
		screen.drawText(5, 37, '..')
		if click and clickx > 5 and clickx < 13 and clicky > 40 and clicky < 43 then
			titlescreen = true
		end
	end
	if titlescreen and tutorial == false then
		if settings == false then
			screen.setColor(red*129, green*48, blue*255)
				screen.drawText(1, 1, '  Core Labs and the Chaosmic\n         plane presents!\n\n       Home Away From Home')
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRect(70, 50, 25, 7)
				screen.drawText(71, 51, 'Start')
		end
		if click and clickx > 70 and clickx < 95 and clicky > 50 and clicky < 57 and settings == false then
			titlescreen = false
			animation = true
		end
		screen.setColor(red*255, green*255, blue*255)
		if click and clickx > 59 and clickx < 96 and clicky > 69 and clicky < 77 and menutoggletitle == false and settings == false then
			screen.drawRectF(59, 70, 36, 7)
			screen.drawText(60, 71, 'Options')	
			settings = true
		elseif click and clickx > 59 and clickx < 96 and clicky > 69 and clicky < 77 and menutoggletitle and settings == false then
			screen.drawRectF(59, 70, 36, 7)
			screen.drawText(60, 71, 'Options')
		elseif settings == false and click == false then
			screen.drawRect(59, 70, 36, 7)
			screen.drawText(60, 71, 'Options')
			menutoggletitle = false
		elseif settings == false then
			screen.drawRect(59, 70, 36, 7)
			screen.drawText(60, 71, 'Options')
		end
		if click and clickx > 0 and clickx < 36 and clicky > 89 and clicky < 96 and menutoggletitle == false and settings then
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(0, 89, 36, 7)
			screen.setColor(red*0, green*0, blue*0)
				screen.drawText(1, 90, 'Options')
			menutoggletitle = true
			settings = false
		elseif click and clickx > 0 and clickx < 36 and clicky > 89 and clicky < 96 and menutoggletitle and settings then
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(0, 89, 36, 7)
			screen.setColor(red*0, green*0, blue*0)
				screen.drawText(1, 90, 'Options')
		elseif settings and click == false then
			menutoggletitle = false
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRect(0, 89, 36, 7)
			screen.setColor(red*255, green*255, blue*255)
				screen.drawText(1, 90, 'Options')
			menutoggletitle = false
		elseif settings then
			screen.drawRect(0, 89, 36, 7)
			screen.drawText(1, 90, 'Options')
		end
		if settings then
			screen.setColor(red*255, 0, 0)
				screen.drawRectF(5, 5, (red2*100), 10)
			screen.setColor(0, green*255, 0)
				screen.drawRectF(5, 16, (green2*100), 10)
			screen.setColor(0, 0, blue*255)
				screen.drawRectF(5, 27, (blue2*100), 10)
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(106, 5, 32, 5)
			screen.setColor(red*129, green*48, blue*255)
				screen.drawRectF(106, 11, 32, 5)
			screen.setColor(red*50, green*50, blue*50)
				screen.drawRectF(106, 17, 32, 5)
			screen.setColor(red*255, green*0, blue*0)
				screen.drawRectF(106, 23, 32, 5)
			screen.setColor(red*0, green*255, blue*0)
				screen.drawRectF(106, 29, 32, 5)
			screen.setColor(red*0, green*0, blue*255)
				screen.drawRectF(106, 35, 32, 5)
			screen.setColor(red*150, green*150, blue*50)
				screen.drawRectF(106, 41, 32, 5)
			screen.setColor(255, 0, 0)
				screen.drawRect(5, 5, 100, 10)
			screen.setColor(0, 255, 0)
				screen.drawRect(5, 16, 100, 10)
			screen.setColor(0, 0, 255)
				screen.drawRect(5, 27, 100, 10)
			screen.setColor(255, 255, 255)
			if click and clickx > 5 and clickx < 105 and clicky > 5 and clicky < 15 then
				red = (clickx-5)/50
				red2 = (clickx-5)/100
			end
			if click and clickx > 5 and clickx < 105 and clicky > 16 and clicky < 26 then
				green = (clickx-5)/50
				green2 = (clickx-5)/100
			end
			if click and clickx > 5 and clickx < 105 and clicky > 27 and clicky < 37 then
				blue = (clickx-5)/50
				blue2 = (clickx-5)/100
			end
				screen.setColor(red*255, green*255, blue*255)
				screen.drawRect(20, 50, 36, 7)
				screen.drawText(21, 51, 'presets')
				screen.drawRect(20, 60, 32, 7)
				screen.drawText(21, 61, 'deut')
				screen.drawRect(20, 70, 32, 7)
				screen.drawText(21, 71, 'prot')
				screen.drawRect(20, 80, 32, 7)
				screen.drawText(21, 81, 'norm')
				screen.drawRect(90, 50, 36, 7)
				screen.drawText(91, 51, 'shaders')
				screen.drawRect(90, 60, 32, 7)
				screen.drawText(91, 61, 'ailen')
				screen.drawRect(90, 70, 32, 7)
				screen.drawText(91, 71, 'scifi')
				screen.drawRect(90, 80, 42, 7)
				screen.drawText(91, 81, 'jetblast')
			if menutoggletitle == false then
				if click and clickx > 20 and clickx < 52 and clicky > 60 and clicky < 67 then
					red = .3
					red2 = .15
					green = 1
					green2 = .5
					blue = 1
					blue2 = .5
				end
				if click and clickx > 20 and clickx < 52 and clicky > 70 and clicky < 77 then
					red = .5
					red2 = .25
					green = .2
					green2 = .1
					blue = 1
					blue2 = .5
				end
				if click and clickx > 20 and clickx < 52 and clicky > 80 and clicky < 87 then
					red = 1
					red2 = .5
					green = 1
					green2 = .5
					blue = 1
					blue2 = .5
				end
				if click and clickx > 90 and clickx < 122 and clicky > 60 and clicky < 67 then
					red = .05
					red2 = .025
					green = 2
					green2 = 1
					blue = .05
					blue2 = .025
				end
				if click and clickx > 90 and clickx < 122 and clicky > 70 and clicky < 77 then
					red = .05
					red2 = .025
					green = 1
					green2 = .5
					blue = 1
					blue2 = .5
				end
				if click and clickx > 90 and clickx < 152 and clicky > 80 and clicky < 87 then
					red = 1
					red2 = .5
					green = 1
					green2 = .5
					blue = .05
					blue2 = .025
				end
			end
		end
	end
	--animation
	if animation then
		if animationstep > 0 and animationstep < 220 then
			--Table
			screen.setColor(red*50, green*50, blue*50)
				screen.drawRectF(0, 50, 160, 25)
			--Scientist 1
			screen.setColor(red*150, green*150, blue*50)
				screen.drawCircleF(20, 20, 15)
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(18, 33, 4, 5)
				screen.drawRectF(12, 35, 16, 15)
			screen.setColor(red*0, green*0, blue*255)
				screen.drawCircleF(13, 15, 3)
				screen.drawCircleF(27, 15, 3)
			--Scientist 1 text 1
				screen.drawRect(1, 75, 120, 19)
					screen.drawText(1, 76, 'with this new station,\nwe can explore places we\nhave never dreamed of!')
			--Scientist 1 glasses
			screen.setColor(red*50, green*50, blue*50)
				screen.drawCircle(13, 15, 3)
				screen.drawCircle(27, 15, 3)
				screen.drawLine(16, 15, 24, 15)
				screen.drawLine(7, 15, 10, 15)
				screen.drawLine(30, 15, 33, 15)
			--Blueprints
			screen.setColor(red*0, green*50, blue*255)
				screen.drawRectF(5, 55, 40, 15)
			screen.setColor(red*255, green*255, blue*255)
				screen.drawLine(10, 68, 13, 68)
				screen.drawLine(10, 68, 10, 66)
				screen.drawLine(10, 66, 13, 66)
				screen.drawLine(13, 68, 13, 60)
				screen.drawLine(13, 68, 16, 68)
				screen.drawLine(16, 68, 16, 60)
				screen.drawLine(13, 60, 16, 60)
		elseif animationstep > 220 and animationstep < 440 then
			--Table
			screen.setColor(red*50, green*50, blue*50)
				screen.drawRectF(0, 50, 160, 25)
			--Scientist 2
			screen.setColor(red*150, green*150, blue*50)
				screen.drawCircleF(20, 20, 15)
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(18, 33, 4, 5)
				screen.drawRectF(12, 35, 16, 15)
			screen.setColor(red*0, green*255, blue*0)
				screen.drawCircleF(13, 15, 3)
				screen.drawCircleF(27, 15, 3)
			--Scientist 2 text 1
				screen.drawRect(1, 75, 120, 19)
					screen.drawText(1, 76, 'gramps, the agency has\nrejected all of your\nideas. they wont change!')
			--Scientist 2 hat
			screen.setColor(red*255, green*0, blue*0)
				screen.drawRectF(5, 5, 30, 4)
				screen.drawRectF(35, 7, 5, 2)
		elseif animationstep > 440 and animationstep < 660 then
			--Table
			screen.setColor(red*100, green*100, blue*50)
				screen.drawRectF(0, 50, 160, 25)
			--Scientist 1
			screen.setColor(red*150, green*150, blue*50)
				screen.drawCircleF(20, 20, 15)
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(18, 33, 4, 5)
				screen.drawRectF(12, 35, 16, 15)
			screen.setColor(red*0, green*0, blue*255)
				screen.drawCircleF(13, 15, 3)
				screen.drawCircleF(27, 15, 3)
			--Scientist 1 text 2
				screen.drawRect(1, 75, 90, 19)
					screen.drawText(1, 76, 'so here it is\nthe station of the\nfuture!')
			--Scientist 1 glasses
			screen.setColor(red*50, green*50, blue*50)
				screen.drawCircle(13, 15, 3)
				screen.drawCircle(27, 15, 3)
				screen.drawLine(16, 15, 24, 15)
				screen.drawLine(7, 15, 10, 15)
				screen.drawLine(30, 15, 33, 15)
			--Blueprints
			screen.setColor(red*0, green*50, blue*255)
				screen.drawRectF(5, 55, 40, 15)
			screen.setColor(red*255, green*255, blue*255)
				screen.drawLine(10, 68, 13, 68)
				screen.drawLine(10, 68, 10, 66)
				screen.drawLine(10, 66, 13, 66)
				screen.drawLine(13, 68, 13, 60)
				screen.drawLine(13, 68, 16, 68)
				screen.drawLine(16, 68, 16, 60)
				screen.drawLine(13, 60, 16, 60)
		elseif animationstep > 660 and animationstep <880 then
			--Table
			screen.setColor(red*100, green*100, blue*50)
				screen.drawRectF(0, 50, 160, 25)
			--Scientist 1
			screen.setColor(red*150, green*150, blue*50)
				screen.drawCircleF(20, 20, 15)
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(18, 33, 4, 5)
				screen.drawRectF(12, 35, 16, 15)
			screen.setColor(red*0, green*0, blue*255)
				screen.drawCircleF(13, 15, 3)
				screen.drawCircleF(27, 15, 3)
				screen.setColor(red*255,green* 0, blue*0)
			--Receptionist 1 text 1
				screen.drawRect(1, 75, 130, 19)
					screen.drawText(1, 76, 'and you really think we\nwould spend 200 billion\ndollars! down the drain?')
			--Scientist 1 glasses
			screen.setColor(red*50, green*50, blue*50)
				screen.drawCircle(13, 15, 3)
				screen.drawCircle(27, 15, 3)
				screen.drawLine(16, 15, 24, 15)
				screen.drawLine(7, 15, 10, 15)
				screen.drawLine(30, 15, 33, 15)
			--Blueprints
			screen.setColor(red*0, green*50, blue*255)
				screen.drawRectF(5, 55, 40, 15)
			screen.setColor(red*255, green*255, blue*255)
				screen.drawLine(10, 68, 13, 68)
				screen.drawLine(10, 68, 10, 66)
				screen.drawLine(10, 66, 13, 66)
				screen.drawLine(13, 68, 13, 60)
				screen.drawLine(13, 68, 16, 68)
				screen.drawLine(16, 68, 16, 60)
				screen.drawLine(13, 60, 16, 60)
		elseif animationstep > 880 and animationstep < 1000 then
			--Table
			screen.setColor(red*100, green*100, blue*50)
				screen.drawRectF(0, 50, 160, 25)
			--Scientist 1
			screen.setColor(red*150, green*150,blue*50)
				screen.drawCircleF(20, 20, 15)
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(18, 33, 4, 5)
				screen.drawRectF(12, 35, 16, 15)
			screen.setColor(red*0, green*0, blue*255)
				screen.drawCircleF(13, 15, 3)
				screen.drawCircleF(27, 15, 3)
			--Scientist 1 text 2
				screen.drawRect(1, 75, 110, 19)
					screen.drawText(1, 76, 'i- i- i want to speak\nto the director of the\nagency!')
			--Scientist 1 glasses
			screen.setColor(red*50, green*50, blue*50)
				screen.drawCircle(13, 15, 3)
				screen.drawCircle(27, 15, 3)
				screen.drawLine(16, 15, 24, 15)
				screen.drawLine(7, 15, 10, 15)
				screen.drawLine(30, 15, 33, 15)
			--Blueprints
			screen.setColor(red*0, green*50, blue*255)
				screen.drawRectF(5, 55, 40, 15)
			screen.setColor(red*255, green*255, blue*255)
				screen.drawLine(10, 68, 13, 68)
				screen.drawLine(10, 68, 10, 66)
				screen.drawLine(10, 66, 13, 66)
				screen.drawLine(13, 68, 13, 60)
				screen.drawLine(13, 68, 16, 68)
				screen.drawLine(16, 68, 16, 60)
				screen.drawLine(13, 60, 16, 60)
		elseif animationstep > 1000 and animationstep < 1200 then
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(50, 25, 10, 30)
				screen.drawRectF(70, 30, 5, 2)
			screen.setColor(red*50, green*50, blue*50)
				screen.drawRectF(72, 0, 2, 30)
			screen.setColor(red*65, green*65, blue*65)
				screen.drawRectF(0, 35, 160, 2)
				screen.drawRectF(0, 55, 160, 2)
			screen.setColor(red*70, green*70, blue*70)
				screen.drawRectF(0, 60, 160, 39)
		elseif animationstep > 1200 and animationstep < 1400 then
			screen.setColor(red*0, green*50, blue*255)
				screen.drawRectF(0, 0, 160, 96)
			screen.setColor(red*10, green*255, blue*20)
				screen.drawRectF(0, 50, 160, 49)
			screen.setColor(red*65, green*65, blue*65)
				screen.drawRectF(70, 90, 20, 6)
				screen.drawTriangleF(70, 90, 50, 96, 70, 96)
				screen.drawTriangleF(90, 90, 110, 96, 90, 96)
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(75, 60, 10, 30)
				screen.drawTriangleF(80, 50, 75, 60, 85, 60)
		elseif animationstep > 1400 and animationstep < 1500 then
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(75, 30, 10, 30)
				screen.drawTriangleF(80, 20, 75, 30, 85, 30)
			screen.setColor(red*75, green*75, blue*75)
				screen.drawTriangleF(80, 60, 75, 70, 85, 70)
		elseif animationstep > 1500 then
			animation = false
		end
	end
	if animation == false and titlescreen == false then
	if eventpopup == false and menu == false then
		if size == 1 then
			screen.setColor(red*255, green*255, blue*255)
			screen.drawRectF(50, 25, 10, 30)
			screen.drawRectF(60, 30, 5, 2)
		end
		if size == 2 then
			screen.setColor(red*255, green*255, blue*255)
			screen.drawRectF(50, 25, 15, 45)
			screen.drawRectF(65, 30, 5, 2)
			screen.drawRectF(65, 40, 5, 2)
		end
		if size == 3 then
			screen.setColor(red*255, green*255, blue*255)
			screen.drawRectF(50, 25, 15, 45)
			screen.drawRectF(65, 30, 5, 2)
			screen.drawRectF(65, 40, 5, 2)
			screen.drawRectF(65, 50, 5, 2)
			screen.drawRectF(65, 60, 5, 2)
		end
		
		screen.drawText(1, 5, 'hp '..hp)
		screen.drawText(120, 5, 'fame '..fame)
	end
	if eventpopup == false then
		if click and clickx > 5 and clickx < 46 and clicky > 80 and clicky < 88 and menutoggle == false and event == false then
			menu2 = menu2 * -1
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(5, 80, 41, 8)
			screen.setColor(red*0, green*0, 0)
				screen.drawText(6, 81, 'upgrades')
			screen.setColor(red*255, green*255, blue*255)
			menutoggle = true
		elseif click and clickx > 5 and clickx < 46 and clicky > 80 and clicky < 88 and menutoggle and event == false then
		else
			screen.setColor(red*255, green*255, blue*255)
			screen.drawRect(5, 80, 41, 8)
			screen.drawText(6, 81, 'upgrades')
			menutoggle = false
		end
		if click and clickx > 5 and clickx < 46 and clicky > 80 and clicky < 88 and menutoggle and event == false or menu then
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(5, 80, 41, 8)
			screen.setColor(red*0, green*0,blue* 0)
				screen.drawText(6, 81, 'upgrades')
			screen.setColor(red*255, green*255, blue*255)
		end
	end
	if menu and event == false then
		--healing
		if hp == 95 or hp == 295 or hp == 495 then
		else
			if click and clickx > 5 and clickx < 40 and clicky > 5 and clicky < 25 and menutoggle2 == false then
				if reactorpoints > 2 and hp < 495 and menutoggle2 == false then
					if size == 1 and hp < 92 then
						reactorpoints = reactorpoints - 2
						hp = hp + 10
					end
					if size == 2 and hp < 292 then
						reactorpoints = reactorpoints - 2
						hp = hp + 10
					end
					if size == 3 and hp < 492 then
						reactorpoints = reactorpoints - 2
						hp = hp + 10
					end
					menutoggle2 = true
				end
				menutoggle2 = true
				screen.drawRectF(5, 5, 35, 20)
				screen.drawText(6, 6, 'repair\n-2 pr\n+10 hp')
			elseif click and clickx > 5 and clickx < 40 and clicky > 5 and clicky < 25 and menutoggle2 then
				screen.drawRectF(5, 5, 35, 20)
				screen.drawText(6, 6, 'repair\n-2 pr\n+10 hp')
			else
				menutoggle2 = false
				screen.drawRect(5, 5, 35, 20)
				screen.drawText(6, 6, 'repair\n-2 pr\n+10 hp')
			end
		end
		if hp == 95 or hp == 295 or hp == 495 then
			if click and clickx > 5 and clickx < 40 and clicky > 5 and clicky < 25 and menutoggle2 == false then
				if reactorpoints > 1 and hp < 500 and menutoggle2 == false then
					if size == 1 and hp == 95 then
						reactorpoints = reactorpoints - 1
						hp = hp + 5
					end
					if size == 2 and hp == 95 or hp == 295 then
						reactorpoints = reactorpoints - 1
						hp = hp + 5
					end
					if size == 3 and hp == 95 or hp == 295 or hp == 495 then
						reactorpoints = reactorpoints - 2
						hp = hp + 5
					end
					menutoggle2 = true
				end
				menutoggle2 = true
				screen.drawRectF(5, 5, 35, 20)
				screen.drawText(6, 6, 'repair\n-1 pr\n+5 hp')
			elseif click and clickx > 5 and clickx < 40 and clicky > 5 and clicky < 25 and menutoggle2 then
				screen.drawRectF(5, 5, 35, 20)
				screen.drawText(6, 6, 'repair\n-1 pr\n+10 hp')
			else
				menutoggle2 = false
				screen.drawRect(5, 5, 35, 20)
				screen.drawText(6, 6, 'repair\n-1 pr\n+5 hp')
			end
		end
		--reactor
		upgradereactortext = 'upgrade\nreactor\n- '..(reactorlv*100)..'pr\nlv= '..reactorlv
		if click and clickx > 50 and clickx < 90 and clicky > 5 and clicky < 35 and menutoggle3 == false then
			screen.drawRectF(50, 5, 40, 30)
			screen.drawText(51, 6, upgradereactortext)
			if reactorlv == 1 or reactorlv == 2 or reactorlv == 3 then
				if reactorpoints > reactorlv*100 then
					reactorpoints = reactorpoints - reactorlv*100
					reactorlv = reactorlv + 1
				end
			end
			menutoggle3 = true
		elseif click and clickx > 50 and clickx < 90 and clicky > 5 and clicky < 35 and menutoggle3 then
			screen.drawRectF(50, 5, 40, 30)
			screen.drawText(51, 6, upgradereactortext)
		else
			screen.drawRect(50, 5, 40, 30)
			screen.drawText(51, 6, upgradereactortext)
			menutoggle3 = false
		end
		--base
		upgradebasetext = 'upgrade\nstation\npr- '..(size*200)..'\nfame- '..(size*20)..'\nhp- '..(size*50)
		if click and clickx > 100 and clickx < 140 and clicky > 5 and clicky < 40 and menutoggle4 == false then
			if reactorpoints > size*200 and fame > size*20 and hp > size*50 and size <= 3 then
				reactorpoints = reactorpoints - size*200
				fame = fame - size*20
				hp = hp - size*20
				size = size + 1
			end
			screen.drawRectF(100, 5, 40, 35)
			screen.drawText(101, 6, upgradebasetext)
			menutoggle4 = true
		elseif click and clickx > 100 and clickx < 140 and clicky > 5 and clicky < 40 and menutoggle4 then
			screen.drawRectF(100, 5, 40, 35)
			screen.drawText(101, 6, upgradebasetext)
		else
			screen.drawRect(100, 5, 40, 35)
			screen.drawText(101, 6, upgradebasetext)
			menutoggle4 = false
		end
		pr2 = string.format('%f', reactorpoints)
		screen.drawText(1, 70, 'hp '..hp)
		screen.drawText(40, 70, 'pr '..pr2)
		screen.drawText(80, 70, 'fame '..fame)
	end
	--event 5
	if eventpopup and event2 == 5.1 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'after a display\nof bad luck, the station\nhas suffered heavy\ncasualties and\nthe bad luck has\nbeen stuied and now is\nwell known\nfame + 5, research + 200')
	end
	if eventpopup and event2 == 5 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 10, 'a person who had\ntheir ship attacked and\nhas very bad luck\nis asking for refuge\n(click to contuine)')
			npcSprite(50, 60, red, green, blue)
	end
	if event2 == 5 and accepted and eventpopup == false then
		if size == 1 then
			hp, meteorshower2 = meteorShower(20, 500, 100, 150, 10, 20, 65, 55, hp, 1, 2, red, green, blue, true)-- meteors, time, spreadxmin, spreadxmax, spreadymin, spreadymax, despawnx, despawny, hp_on_hit, damage_multiplier, size, r, g, b, is_active
		end
		if size == 2 then
			hp, meteorshower2 = meteorShower(20, 500, 100, 150, 10, 20, 65, 70, hp, 1.7, 3, red, green, blue, true)
		end
		if size == 3 then
			hp, meteorshower2 = meteorShower(20, 500, 100, 150, 10, 20, 65, 70, hp, .8, 8, red, green, blue, true)
		end
		if meteorshower2 > 500 then
			event2 = 5.1
			accepted = false
			eventpopup = true
			meteorshower2 = 0
		end
	end
	--event 4
	if eventpopup and event2 == 4 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'an abandoned space station\nis drifting into your space.\ntry to salvage it.\n(click to contuine)')
	end
	if eventpopup and event2 == 4.1 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'the abandoned space station\nexploded during repairs\ndue to it being caught\nin a supernova when\nthe station was abandoned\nhp - 20, fame - 1\n(click to contuine)')
	end
	if eventpopup and event2 == 4.2 then
		screen.setColor(red*255, green*0, blue*0)
			if size == 1 and hp < 80 then
				screen.drawText(1, 20, 'the abandoned space station\nhad some materials\nto use for repairs.\nhp + 20, research + 20\nfame + 5\n(click to contuine)')
			elseif size == 2 and hp < 280 then
				screen.drawText(1, 20, 'the abandoned space station\nhad some materials\nto use for repairs.\nhp + 20, research + 20\nfame + 10\n(click to contuine)')
			elseif size == 3 and hp < 480 then
				screen.drawText(1, 20, 'the abandoned space station\nhad some materials\nto use for repairs.\nhp + 20, research + 40\n(click to contuine)')
			else
				screen.drawText(1, 20, 'the abandoned space station\nhad some new tech\nthat has not been seen before\nresearch + 40\n(click to contune)')
			end
	end
	if event2 == 4 and accepted and eventpopup == false then
		if randomstation == 1 then
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(120, 20, 10, 5)
			screen.setColor(red*0, green*0, blue*255)
				screen.drawRectF(130, 20, 10, 2)
		end
		if randomstation == 2 then
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(120, 20, 20, 5)
				screen.drawRectF(135, 25, 10, 5)
			screen.setColor(red*0, green*0, blue*255)
				screen.drawRectF(140, 30, 2, 15)
		end
		if randomstation == 3 then
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(130, 25, 20, 5)
				screen.drawRectF(125, 30, 10, 5)
				screen.drawRectF(130, 35, 5, 10)
			screen.setColor(red*0, green*0, blue*255)
				screen.drawRectF(135, 40, 10, 5)
		end
		screen.setColor(red*255, green*255, blue*255)
			if click and clickx > 120 and clickx < 156 and clicky > 50 and clicky < 64 and eventbutton1 == false then
				eventbutton1 = true
				salvage = salvage - 1
				screen.drawRectF(120, 50, 36, 14)
					screen.drawText(121, 51, 'salvage\n'..salvage)
			elseif click and clickx > 120 and clickx < 156 and clicky > 50 and clicky < 64 and eventbutton1 then
				screen.drawRectF(120, 50, 36, 14)
					screen.drawText(121, 51, 'salvage\n'..salvage)
			elseif click == false and eventbutton1 then
				eventbutton1 = false
				screen.drawRect(120, 50, 36, 14)
					screen.drawText(121, 51, 'salvage\n'..salvage)
			else
				screen.drawRect(120, 50, 36, 14)
					screen.drawText(121, 51, 'salvage\n'..salvage)
			end
			if salvage < 1 and click == false then
				accident = math.random(1, 4)
			end
			if accident == 1 and click == false then
				eventpopup = true
				event2 = 4.1
				accepted = false
			end
			if accident > 1 and click == false then
				eventpopup = true
				event2 = 4.2
				accepted = false
			end
		
	end
	--event 3
	if eventpopup and event2 == 3.1 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'both ships have exploded\nduring the firefight. neither\nof them can be salvaged.\n(click to contuine)')
	end
	if eventpopup and event2 == 3.2 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'during the firefight one\nship was destroyed, while the\nother one was not.\nresearch + 50\n(click to contuine)')
	end
	if eventpopup and event2 == 3.3 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'the weapons operator was\nfresh out of training and had\nquick thinking and targeted\nthe weapons systems of the ship\nboth ships were salvaged\n+100 research\n(click to contuine)')
	end
	if eventpopup and event2 == 3 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'long range sensors have\ndetected two enemy ships in\nattack formation. defend the\nstation before it is destroyed\n(click to contuine)')
	end
	if event2 == 3 and accepted then
		if destroyed1 == true and destroyed2 == true and click == false then
			eventrandom = math.random(1, 3)
			if eventrandom == 1 then
				event2 = 3.1
			end
			if eventrandom == 2 then
				event2 = 3.2
			end
			if eventrandom == 3 then
				event2 = 3.3
			end
			eventpopup = true
		end
		if attack1 < 1 then
			destroyed1 = true
		end
		if attack2 < 1 then
			destroyed2 = true
		end
		attacktimer = attacktimer + 1
		--attack ships
		--ship 1
		if destroyed1 == false then
			screen.setColor(red*50, green*50, blue*50)
				screen.drawRectF(100, 30, 5, 2)
				screen.drawRectF(104, 32, 1, 2)
				screen.drawRectF(102, 33, 2, 1)
				screen.drawRectF(104, 28, 1, 2)
				screen.drawRectF(102, 28, 2, 1)
		end
		--ship 2
		if destroyed2 == false then
			screen.setColor(red*50, green*50, blue*50)
				screen.drawRectF(100, 50, 6, 2)
				screen.drawRectF(104, 52, 1, 2)
				screen.drawRectF(102, 53, 2, 1)
				screen.drawRectF(104, 48, 1, 2)
				screen.drawRectF(102, 48, 2, 1)
		end
		if click and clickx > 110 and clickx < 155 and clicky > 27 and clicky < 34 and e3b1 == false and destroyed1 == false then
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(110, 27, 45, 7)
				screen.drawText(111, 28, 'target '..attack1)
				attack1 = attack1 - 1
				e3b1 = true
		elseif click and clickx > 110 and clickx < 155 and clicky > 27 and clicky < 34 and e3b1 and destroyed1 == false then
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(110, 27, 45, 7)
				screen.drawText(111, 28, 'target '..attack1)
		elseif destroyed1 == false then
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRect(110, 27, 45, 7)
				screen.drawText(111, 28, 'target '..attack1)
			e3b1 = false
		end
		if click and clickx > 110 and clickx < 155 and clicky > 47 and clicky < 54 and e3b2 == false and destroyed2 == false then
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(110, 47, 45, 7)
				screen.drawText(111, 48, 'target '..attack2)
			attack2 = attack2 - 1
			e3b2 = true
		elseif click and clickx > 110 and clickx < 155 and clicky > 47 and clicky < 54 and e3b2 and destroyed2 == false then
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(110, 47, 45, 7)
				screen.drawText(111, 48, 'target '..attack2)
		elseif destroyed2 == false then
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRect(110, 47, 45, 7)
				screen.drawText(111, 48, 'target '..attack2)
			e3b2 = false
		end
		if attacktimer > 150 and attacktimer < 200 and destroyed1 == false then
			if size == 1 then
				screen.setColor(red*0, green*255, blue*0)
					screen.drawLine(102, 33, 60, 33)
					screen.drawLine(102, 28, 60, 28)
			end
			if size == 2 or size == 3 then
				screen.setColor(red*0, green*255, blue*0)
					screen.drawLine(102, 33, 65, 33)
					screen.drawLine(102, 28, 65, 28)
			end
		end
		if attacktimer > 350 and attacktimer < 400 and destroyed2 == false then
			if size == 1 then
				screen.setColor(red*0, green*255, blue*0)
					screen.drawLine(102, 53, 60, 53)
					screen.drawLine(102, 48, 60, 48)
			end
			if size == 2 or size == 3 then
				screen.setColor(red*0, green*255, blue*0)
					screen.drawLine(102, 53, 65, 53)
					screen.drawLine(102, 48, 65, 48)
			end
		end
		if attacktimer == 150 and destroyed1 == false then
			hp = hp - 5
		end
		if attacktimer == 350 and destroyed2 == false then
			hp = hp - 10
		end
	end
	--event 2
	if eventpopup and event2 == 2 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'a nearby star is about to\nsupernova. you are told to\ninvestigate the explosion\n(click to contuine)')
	end
	if eventpopup and event2 == 2.1 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'the star has exploded\nthe station barley made it out\nalive. the data was destroyed\nin the process.\nfame -1, hp -60\n(click to contuine)')
	end
	if eventpopup and event2 == 2.2 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'you have finshed scanning\nahead of time. the star\nexploded before it was\npredicted to. luckily\nthe station was able to get\nout of its range in time\nfame + 10, research + 90\n(click to contuine)')
	end
	if event2 == 2 and accepted then
		if scanning < 0 then
			scanning = 0
		end
		screen.setColor(red*0, green*fireg, blue*firer)
			screen.drawCircleF(130, 48, 20)
		screen.setColor(red*255, green*255, blue*255)
		if click and clickx > 10 and clickx < 59 and clicky > 70 and clicky < 77 and repairst == false then
			screen.drawRectF(10, 70, 49, 7)
				screen.drawText(11, 71, 'Scan: '.. scanning)
			scanning = scanning - 1
			repairst = true
		elseif click and clickx > 10 and clickx < 59 and clicky > 70 and clicky < 77 and repairst == true then
			screen.drawRectF(10, 70, 49, 7)
				screen.drawText(11, 71, 'Scan: '.. scanning)
		else
			repairst = false
			screen.drawRect(10, 70, 49, 7)
				screen.drawText(11, 71, 'Scan: '.. scanning)
		end
		if repairst == false and click == false and perevent == false and scanning == 10 then
			repairaccident = math.random(1, 5)
			perevent = true
		end
		if repairaccident == 1 and click == false then
			accepted = false
			scanning = 25
			event = true
			event2 = 2.1
			eventpopup = true
		end
		if scanning == 0 and click == false then
			accepted = false
			scanning = 25
			event = true
			event2 = 2.2
			eventpopup = true
		end
	end
	--event 1
	if eventpopup and event2 == 1 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'a ship needing repairs is\napproaching to dock now!\n(click to contuine)')
	end
	if eventpopup and event2 == 1.1 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20,  'an accident caused the\nship to explode. hp - 30\n(click to contuine)')
	end
	if eventpopup and event2 == 1.2 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'the crew are thankful for\nthe repairs. fame + 5\n(click to contuine)')
	end
	if event and event2 == 1 and eventpopup == false then
		if repairs == 3 and perevent == false and click == false then
			repairaccident = math.random(1, 4)
			perevent = true
		end
		if repairaccident == 1 then
			accepted = false
			event = true
			event2 = 1.1
			eventpopup = true
		end
		screen.setColor(red*255, green*255, blue*255)
		if click and clickx > 100 and clickx < 149 and clicky > 40 and clicky < 47 and repairst == false and repairs > 0 then
			repairs = repairs - 1
			if repairs < 0 then
				repairs = 0
			end
			screen.drawRectF(100, 40, 49, 7)
				screen.drawText(101, 41, 'Repair: '.. repairs)
			repairst = true
		elseif click and clickx > 100 and clickx < 149 and clicky > 40 and clicky < 47 and repairst == true and repairs > 0 then
			screen.drawRectF(100, 40, 49, 7)
				screen.drawText(101, 41, 'Repair: '.. repairs)
		elseif repairs == 0 and click == false then
			screen.drawRect(100, 40, 49, 7)
				screen.drawText(101, 41, 'Repaired!')
			accepted = false
			event = true
			event2 = 1.2
			eventpopup = true
		else
			screen.drawRect(100, 40, 49, 7)
				screen.drawText(101, 41, 'Repair: '.. repairs)
				repairst = false
		end
		if size == 1 then
			screen.setColor(red*50, green*50, blue*50)
			screen.drawRectF(65, 29, 10, 4)
			screen.setColor(red*firer, green*fireg, blue*0)
			if repairs > 8 then
				screen.drawRectF(64, 30, 3, 2)
			end
			if repairs > 5 then
				screen.drawRectF(68, 32, 3, 1)
			end
			if repairs > 2 then
				screen.drawRectF(70, 31, 1, 2)
			end
		end
		if size == 2 then
			screen.setColor(red*50, green*50, blue*50)
			screen.drawRectF(70, 29, 10, 4)
			screen.setColor(red*firer, green*fireg, blue*0)
			if repairs > 8 then
				screen.drawRectF(71, 30, 3, 2)
			end
			if repairs > 5 then
				screen.drawRectF(73, 32, 3, 1)
			end
			if repairs > 2 then
				screen.drawRectF(75, 31, 1, 2)
			end
		end
		if size == 3 then
			screen.setColor(red*50, green*50, blue*50)
			screen.drawRectF(70, 29, 10, 4)
			screen.setColor(red*firer, green*fireg, blue*0)
			if repairs > 8 then
				screen.drawRectF(71, 30, 3, 2)
			end
			if repairs > 5 then
				screen.drawRectF(73, 32, 3, 1)
			end
			if repairs > 2 then
				screen.drawRectF(75, 31, 1, 2)
			end
		end
	end
	end
end
--As of v0.28.2A I will now be making custom sprites and functions to speed up the coding process faster
--event5 sprites/code
	function npcSprite(x, y, r, g, b) return
		screen.setColor(100*r, 100*g, 0*b),
		screen.drawCircleF(x+5, y+5, 15),
		screen.setColor(200*r, 200*g, 200*b),
		screen.drawLine(x-8, y+1, x+18, y+1),
		screen.drawCircleF(x-2, y+1, 3),
		screen.drawCircleF(x+12, y+1, 3),
		screen.setColor(150*r, 5*g, 5*b),
		screen.drawRectF(x-8, y-10, 26, 5),
		screen.drawRectF(x-4, y-12, 18, 5)
	end
function meteorShower(meteors, time, spreadxmin, spreadxmax, spreadymin, spreadymax, despawnx, despawny, hp_on_hit, damage_multiplier, size, r, g, b, is_active)
	if is_active == false then
		x = 0
		x2 = 0
	end
	if declareonce == nil then
		meteors2 = meteors
		declareonce = false
		x = 0
		x2 = 0
	end
	x = x + 1
	x2 = 0
	if x < time then
		for i = 2, (meteors2*2)+2, 2 do
			x2 = x2 + 2
			if showertable[i-1] == nil then
				showertable[i-1] = math.random(spreadxmin, spreadxmax)
			end
			if showertable[i] == nil then
				showertable[i] = math.random(spreadymin, spreadymax)
			end
			if showertable[i-1] < despawnx or showertable[i] < 0 then
				if is_active then
					screen.setColor(0*r, 255*g, 255*b)
						screen.drawRectF(showertable[i-1]-size, showertable[i]-size, 2, size*2)
				end
				showertable[i-1] = math.random(spreadxmin, spreadxmax)
				hp_on_hit = hp_on_hit - (size*damage_multiplier)/20
			end
			if showertable[i] > 96 or showertable[i-1] < despawny then
				if is_active then
					screen.setColor(0*r, 255*g, 255*b)
						screen.drawRectF(showertable[i-1]-size, showertable[i]-size, 2, size*2)
				end
				showertable[i] = math.random(spreadymin, spreadymax)
				hp_on_hit = hp_on_hit - (size*damage_multiplier)/20
			end
				x2 = 0
				showertable[i-1] = showertable[i-1] - .5
				showertable[i] = showertable[i] + .5
				if is_active then
					screen.setColor(255*r, 255*g, 255*b)
						screen.drawCircleF(showertable[i-1], showertable[i], size)
				end
		end
	end
	return
	hp_on_hit,
	x
end

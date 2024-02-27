--Save data load system

--{100, 4, 3124, -4, 1, 995, 'core labs and the chaosmic plane presents! home away from home', 0}

--PASTE SAVE DATA HERE V V V (Please do not have two sets of the brackets "{{data}}" is bad, "{data}" is good)
loadedsavedata = {} --post
--PASTE SAVE DATA{} --post HERE ^ ^ ^ (Please do not have two sets of the brackets "{{data}}" is bad, "{data}" is good.
--You will know if it loads if the script does not:
--crash
--AND
--Will spit out that it loaded in the console
--
--NOTE: Please replace the ":" in the yellow section (They will be red) with "," as I do not know the solution yet and I am still learning LUA (-:

--DEBUG CODES
--Only use codes if you know what you are doing!
print_all_vars_debug_code = 'print all vars'
timer_debug_code = 'timer'


--Script
version = '0.34.3F'
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
research = 99 --max 1000
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
logmission = {}
logmission[1] = 1
menulog = false
menulogbutton = false
logs = 0
logclick = false
missionlogfunction = {}
timerti = 0
mutinymission = {15, .1}
mutinytime = 0
mutinyrealHP = 50
mutinymissiontimerevent_END = 0
critical_error_table = {false, 3}
spritevar = {0, 0}
debug = {false}
debugupdate = 0
savedata = {}
debuginfo = {}
savedatastuff = {false, false, false, false}
backendui = {}
missionlogfunctionsavedata1 = {}
missionlogfunctionsavedata2 = {}
missionlogfunctionsavedata3 = {}
--as of version 0.32.3A, I left the code off for several months. I am now working on it again and the code may have different formatting than the previous events.
function onTick()
	if debug_code == 'crash' then
		critical_error_table[1] = true
	end
	if loadedsavedata[1] ~= nil then
		if debug_code == 'debug' then
			print('--')
			print('loading savedata')
			print('--')
			print(savedata, '--pre')
			print('--')
		end
		savedata = loadedsavedata
		if debug_code == 'debug' then
			print(savedata, '--post')
			print('--')
			print(loadedsavedata, '--loadedfrom')
		end
		hp, reactorlv, reactorpoints, fame, size, research, logmission1 = savedata[1], savedata[2], savedata[3], savedata[4], savedata[5], savedata[6], savedata[7]
		loadedsavedata = {}
		if debug_code == 'debug' then
			print('--')
			print('loaded savedata')
			print('--')
		end
	end
	if debug_code == timer_debug_code then
		print('ontick')
		timer.start()
	end
	if debug_code == print_all_vars_debug_code then
		for i = 1, 20 do
			print('--')
		end
		print(debuginfo)
	end
	debugupdate = debugupdate + 1
	if debugupdate > 120 then
		savedata = {hp, reactorlv, reactorpoints, fame, size, research, missionlogfunctionsavedata1}
		debuginfo = {version, score, etimer, timet, event, event2, accepted, eventpopup, timer500t, hp, reactorlv, reactorpoints, fame, size, research, firex, firey, firer, fireg, firet, repairs, repairst, perevent, scanning, menu, menu2, menutoggletitle, menutoggle, menutoggle2, menutoggle3, menutoggle4, e3b1, e3b2, attack1, attack2, attacktimer, destroyed1, destroyed2, eventrandom, titlescreen, animation, animationstep, redtoggle, greentoggle, bluetoggle, red, green, blue, red2, green2, blue2, settings, randomstation, eventbutton1, accident, tutorial, tutorialstep, tutorialbutton, readtimer, tutorialbutton2, buttontoggle, npchealth, npcdead, npcship, npcbutton, showertable, logmission1, menulog, menulogbutton, logs, logclick, missionlogfunction, timerti, mutinymission, mutinytime, mutinyrealHP, mutinymissiontimerevent_ed, critical_error_table, spritevar, debug, savedata, savedatastuff, backendup, debugupdate, debug_code}
		debugupdate = 0
	end
	click = input.getBool(1)
	clickx = input.getNumber(3)
	clicky = input.getNumber(4)
	debug_code = property.getText('debug')
	dumplog(click)
	if critical_error_table[1] ~= true then
	--Limiters
	if fame > 1000 then
		fame = 1000
		print('WARNING: Fame has increased beyond limit. Lowering to prevent glitches.')
	end
	if research > 1000 then
		research = 1000
		print('WARNING: Research has increased beyond limit. Lowering to prevent glitches.')
	end
	if size == 1 then
		if hp > 100 then
			criticalerror(1, hp, size, 100)
			hp = 100
		end
	elseif size == 2 then
		if hp > 300 then
			criticalerror(1, hp, size, 300)
			hp = 300
		end
	elseif size == 3 then
		if hp > 500 then
			criticalerror(1, hp, size, 500)
			hp = 500
		end
	end
	--/Limiters
	if animation then
		animationstep = animationstep + 1
	end
	if animation == false and titlescreen == false then
	if attacktimer > 500 then
		attacktimer = 0
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
		event2 = math.random(1, 6) --What is my damn luck? During an unproductive debug session trying to make data, I got mission 1 and 6 for 3 times in a row, like mission 6, 1, 6, 1, 6, 1... I just want to get to stupid level 2 base I might fix this later. My damn fame is -14
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
--event 6
	if event and event2 == 6.1 or event2 == 6.2 then
		mutinymissiontimerevent_END = mutinymissiontimerevent_END + 1
		if click and event2 == 6.1 and mutinymissiontimerevent_END > 120 then
			event = false
			accepted = false
			event2 = 0
			fame = fame - 5
			research = research - 5
			mutinymission = {15, .1}
			mutinytime = 0
			mutinyrealHP = 50
			mutinymissiontimerevent_END = 0
			eventpopup = false
		elseif click and event2 == 6.2 and mutinymissiontimerevent_END > 120 then
			event = false
			accepted = false
			event2 = 0
			fame = fame - 10
			research = research - 50
			mutinymission = {15, .1}
			mutinytime = 0
			mutinyrealHP = 50
			mutinymissiontimerevent_END = 0
			eventpopup = false
		end
	end
	if event and event2 == 6 and accepted == false then
		if click and event2 == 6 then
			accepted = true
			event2 = 6
		else
			accepted = accepted
		end
		eventpopup = true
	elseif event and event2 == 6 and accepted == true then
		eventpopup = false
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
	if debug_code == timer_debug_code then
		timer.stop()
		print('')
	end
end
function onDraw()
	critical_error_check()
	if debug_code == timer_debug_code then
		print('ondraw')
		timer.start()
	end
	if debug_code == 'sprites' then
--		pause()
		critical_error_table[1] = true
		debug[1] = true
		sprites(red, green, blue)
	end
	if critical_error_table[1] ~= true then
	--savestuff
		if titlescreen and settings == false and tutorial == false and menulog == false and tutorialbutton == false then
--			textBox(x, y, w, h, t, f, r, g, b, onr, ong, onb, offr, offg, offb)
			textBox(2, 85, 50, 7, 'save data', savedatastuff[1], red, green, blue, 255, 255, 255, 0, 0, 0)
			savedatastuff[2] = 	isclicking(2, 85, 50, 7, clickx, clicky, click)
			if savedatastuff[2] and savedatastuff[3] == false then
				savedatastuff[4] = true
				savedatastuff[3] = true
			elseif savedatastuff[2] and savedatastuff[3] and savedatastuff[4] then
				savedatastuff[4] = false
			elseif savedatastuff[2] and savedatastuff[3] then
				savedatastuff[4] = false
			else
				savedatastuff[3] = false
				savedatastuff[4] = false
			end
		end
		if savedatastuff[1] then
			if savedatastuff[6] == false and savedatastuff[8] == false then
				screen.setColor(255*red, 0*green, 0*blue)
				screen.drawText(5, 20, 'welcome to the\nsave data system.')
			end
			screen.setColor(255*red, 255*green, 255*blue)
			if savedatastuff[5] and savedatastuff[6] ~= true and click == false then
				print('v v v--SAVE DATA BELOW--v v v')
				printColor(255*red, 0*green, 0*blue)
				local unusedstring, vara = next(savedata[7])
--				print(savedata[7])
--				print(savedata, '--pre')
				local savedata1 = {savedata[1], savedata[2], savedata[3], savedata[4], savedata[5], savedata[6], savedata[7][1], string.gsub(vara, ':', ',')}
--				print(vara)
--				print(string.gsub(vara, ':', ','))
				print(savedata1, '--post')
				printColor(255, 255, 255)
				print('^ ^ ^--SAVE DATA ABOVE--^ ^ ^')
			end
			if click == false then
				savedatastuff[6] = pushtotoggle(savedatastuff[5], 1)
			end
			savedatastuff[5] = isclicking(2, 5, 22, 7, clickx, clicky, click)
			textBox(2, 5, 22, 7, 'save', savedatastuff[5], red, green, blue, 255, 255, 255, 0, 0, 0)
			if savedatastuff[6] then
				screen.setColor(255*red, 0*green, 0*blue)
				screen.drawText(5, 15, 'please copy the data\nthat has been printed to\nthe console and store it.\nthat is your save data\nkeep it safe!\n\n(make sure to click save again)\n\nif it is blank\nlike {} then\nwait 5 seconds then try again')
				screen.setColor(255*red, 255*green, 255*blue)
			end
			if click == false then
				savedatastuff[8] = pushtotoggle(savedatastuff[7], 2)
			end
			savedatastuff[7] = isclicking(50, 5, 22, 7, clickx, clicky, click)
			textBox(50, 5, 22, 7, 'load', savedatastuff[7], red, green, blue, 255, 255, 255, 0, 0, 0)
			if savedatastuff[8] then
				screen.setColor(255*red, 0*green, 0*blue)
				screen.drawText(5, 15, 'well, i have some\ngood news and bad news...\n\nyou need to take your\nsave data and\npaste it where the script\nasks for it(top)\nin the comments\n(two minus signs, grey)\nand the script\nwill load it.')
			end
		end
		if savedatastuff[4] then
			savedatastuff[1] = not savedatastuff[1]
		end
	--tutorial
		screen.setColor(red*255, green*255, blue*255)
		if tutorial == false and titlescreen and settings == false and tutorialbutton == false and click == false and menulog == false and savedatastuff[1] == false then
			screen.drawRect(54, 85, 41, 7)
			screen.drawText(55, 86, 'tutorial')
		elseif tutorial == false and titlescreen and settings == false and tutorialbutton == false and click and clickx > 54 and clickx < 95 and clicky > 85 and clicky < 93 and  menulog == false and savedatastuff[1] == false then
			screen.drawRectF(54, 85, 41, 7)
			screen.drawText(55, 86, 'tutorail')
			tutorialbutton = true
			tutorial = true
		elseif tutorial == false and titlescreen and settings == false and tutorialbutton and click and clickx > 54 and clickx < 95 and clicky > 85 and clicky < 93 and  menulog == false and savedatastuff[1] == false then
			screen.drawRectF(54, 85, 41, 7)
			screen.drawText(55, 86, 'tutorial')
		elseif click == false and tutorialbutton == true then 
			tutorialbutton = false
		elseif settings == false and titlescreen and tutorial == false and menulog == false and savedatastuff[1] == false then
			screen.drawRect(54, 85, 41, 7)
			screen.drawText(55, 86, 'tutorial')
		end
		if tutorial then
			screen.setColor(red*255, green*255, blue*255)
				if tutorialstep == 1 then
					readtimer = readtimer + 1
					screen.drawText(1, 20, 'welcome to the tutorial.\nyou can find very useful\ninformation here on how to\nplay the game. even lore!\n(click to contuine)\n(you will click a lot)\n(ps, i had to get a new mouse\nafter a testing session)')
					missionLog('welcome to the tutorial.\nyou can find very useful\ninformation here on how to\nplay the game. even lore!\n(click to contuine)\n(you will click a lot)\n(ps, i had to get a new mouse\nafter a testing session)')
					if click and readtimer > 30 then
						tutorialstep = tutorialstep + 1
						readtimer = 0
					end
				end
				if tutorialstep == 2 then
					screen.drawText(1, 20, 'you will now learn how\nto interact with different\nthings in the game')
					readtimer = readtimer + 1
					missionLog('you will now learn how\nto interact with different\nthings in the game')
					if click and readtimer > 30 then
						tutorialstep = tutorialstep + 1
						readtimer = 0
					end
				end
				if tutorialstep == 3 then
					screen.drawText(1, 20, 'when you have a button\nsaying scan, or target,\nor repair (etc...)\nand it ends with a number,\nyou need to click on it')
					missionLog('when you have a button\nsaying scan, or target,\nor repair (etc...)\nand it ends with a number,\nyou need to click on it')
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
					screen.drawText(1, 5, 'great job! the final part is\nthe lore. currently the lore is\nthat the space station\nis designed by some old\nscientist who\'s ideas were\nrejected in the past\nbut when he brought up a new\nidea to the receptionist who\nrejected his idea,\nhe asked to speak\nto the director of the\nspace agency, who allowed\nhis project.\n(click to return to titlescreen)')
					missionLog('great job! the final part is\nthe lore. currently the lore is\nthat the space station\nis designed by some old\nscientist who\'s ideas were\nrejected in the past\nbut when he brought up a new\nidea to the receptionist who\nrejected his idea,\nhe asked to speak\nto the director of the\nspace agency, who allowed\nhis project.\n(click to return to titlescreen)')
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
	if titlescreen and tutorial == false and settings == false and savedatastuff[1] == false then
		if menulog == false then
			logs = 0
			screen.setColor(red*255, green*255, blue*255)
		if click and clickx > 10 and clickx < 28 and clicky > 69 and clicky < 77 and menulogbutton == false and menulog == false then
			screen.drawRectF(10, 69, 20, 8)
			screen.drawText(10, 70, 'logs')
			menulogbutton = true
			menulog = true
		elseif click and clickx > 10 and clickx < 28 and clicky > 69 and clicky < 77 and menulogbutton == true and menulog == false then
			screen.drawRectF(10, 69, 20, 8)
			screen.drawText(10, 70, 'logs')
			menulogbutton = true
		elseif click == false and menulogbutton then
			menulogbutton = false
		else
			screen.drawRect(10, 69, 20, 8)
			screen.drawText(10, 70, 'logs')
		end
		end
		if menulog then
			timerti = timerti + 1
			screen.drawRect(0, 89, 20, 7)
			screen.drawText(1, 90, 'logs')
			if logs == 0 then
				screen.drawText(0, 5, 'this is your log\nmenu. click to\ncycle logs. each\ntime you leave the\nlogs menu, it will\nreset to log 1\this screen')
			end
			if click and clickx > 0 and clickx < 20 and clicky > 89 and clicky < 96 then
				menulog = false
				logs = 0
			end
			if click and logclick == false and timerti > 30 then
				logs = logs + 1
				logclick = true
				timerti = 0
			elseif click == false and logclick then
				logclick = false
			end
			if logs ~= 0 and logmission[logs] ~= nil then
				if logs == 1 then
					screen.drawText(5, 20, 'this is a buffer screen\n(lua starts at 1 instead of 0)\n\nclick again to go into logs')
				end
			end
			if logmission[logs] ~= nil then
				screen.setColor(255*red, 255*green, 255*blue)
				screen.drawText(150, 5, logs)
				screen.drawText(5, 10, logmission[logs])

			end
			if logmission[logs] == nil and logs ~= 0 then
				screen.drawText(5, 5, 'you have ran out of\nlogs. play more to\nget more logs')
			end
		end
	end
	if titlescreen and tutorial == false and menulog == false and savedatastuff[1] == false then
		if settings == false and menulog == false then
			screen.setColor(red*129, green*48, blue*255)
				screen.drawText(1, 1, '  core labs and the chaosmic\n         plane presents!\n\n       home away from home')
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRect(70, 50, 25, 7)
				screen.drawText(71, 51, 'start')
			missionLog('  core labs and the chaosmic\n         plane presents!\n\n       home away from home')
		end
		if click and clickx > 70 and clickx < 95 and clicky > 50 and clicky < 57 and settings == false then
			titlescreen = false
			animation = true
		end
		screen.setColor(red*255, green*255, blue*255)
		if click and clickx > 59 and clickx < 96 and clicky > 69 and clicky < 77 and menutoggletitle == false and settings == false then
			screen.drawRectF(59, 70, 36, 7)
			screen.drawText(60, 71, 'options')	
			settings = true
		elseif click and clickx > 59 and clickx < 96 and clicky > 69 and clicky < 77 and menutoggletitle and settings == false then
			screen.drawRectF(59, 70, 36, 7)
			screen.drawText(60, 71, 'options')
		elseif settings == false and click == false then
			screen.drawRect(59, 70, 36, 7)
			screen.drawText(60, 71, 'options')
			menutoggletitle = false
		elseif settings == false then
			screen.drawRect(59, 70, 36, 7)
			screen.drawText(60, 71, 'options')
		end
		if click and clickx > 0 and clickx < 36 and clicky > 89 and clicky < 96 and menutoggletitle == false and settings then
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(0, 89, 36, 7)
			screen.setColor(red*0, green*0, blue*0)
				screen.drawText(1, 90, 'options')
			menutoggletitle = true
			settings = false
		elseif click and clickx > 0 and clickx < 36 and clicky > 89 and clicky < 96 and menutoggletitle and settings then
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(0, 89, 36, 7)
			screen.setColor(red*0, green*0, blue*0)
				screen.drawText(1, 90, 'options')
		elseif settings and click == false then
			menutoggletitle = false
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRect(0, 89, 36, 7)
			screen.setColor(red*255, green*255, blue*255)
				screen.drawText(1, 90, 'options')
			menutoggletitle = false
		elseif settings then
			screen.drawRect(0, 89, 36, 7)
			screen.drawText(1, 90, 'options')
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
					missionLog('with this new station,\nwe can explore places we\nhave never dreamed of!')
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
					missionLog('gramps, the agency has\nrejected all of your\nideas. they wont change!')
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
					missionLog('so here it is\nthe station of the\nfuture!')
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
				screen.setColor(red*255, green* 0, blue*0)
			--Receptionist 1 text 1
				screen.drawRect(1, 75, 130, 19)
					screen.drawText(1, 76, 'and you really think we\nwould spend 200 billion\ndollars! down the drain?')
					missionLog('and you really think we\nwould spend 200 billion\ndollars! down the drain?')
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
					missionLog('i- i- i want to speak\nto the director of the\nagency!')
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
		elseif size == 2 then
			screen.setColor(red*255, green*255, blue*255)
			screen.drawRectF(50, 25, 15, 45)
			screen.drawRectF(65, 30, 5, 2)
			screen.drawRectF(65, 40, 5, 2)
		elseif size == 3 then
			screen.setColor(red*255, green*255, blue*255)
			screen.drawRectF(50, 25, 15, 45)
			screen.drawRectF(65, 30, 5, 2)
			screen.drawRectF(65, 40, 5, 2)
			screen.drawRectF(65, 50, 5, 2)
			screen.drawRectF(65, 60, 5, 2)
		else
			criticalerror(1, size, 3)
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
		if hp < 100 and size > 1 then
			screen.setColor(255*red, 0, 0)
			screen.drawText(100, 76, 'your hp can\ngo over 100')
			screen.setColor(255*red, 255*green, 255*blue)
		end
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
	--event 6
	if event2 == 6 and accepted and eventpopup == false then
		hp, mutinytime, mutinyrealHP = mutinyMission(hp, red, green, blue, clickx, clicky, click, size, mutinytime, mutinyrealHP)
		if hp == 5 then
			eventpopup = true
			event2 = 6.1
			hp = 35
		end
		if mutinyrealHP == 0 then
			eventpopup = true
			event2 = 6.2
			hp = 5
		end
	end
	if event2 == 6.1 then
		screen.setColor(red*255, green*0, blue*0)
		screen.drawText(1, 20, 'well... i have good news..\nand bad news..\nthe good news is...\nthey gave up. but the bad news..\nyou left your station\ncritically damaged.\nfame - 5, research - 5\n\nclick anywhere to contuine')
		missionLog('well... i have good news..\nand bad news..\nthe good news is...\nthey gave up. but the bad news..\nyou left your station\ncritically damaged.\nfame - 5, research - 5\n\nclick anywhere to contuine')
	end
	if event2 == 6.2 then
		screen.setColor(red*255, green*0, blue*0)
		screen.drawText(1, 20, 'the mutiny won! your ship was\ndestroyed. the good news is\nthat someone else stopped them\nand came to rescue you.\nthe issue is, the station got\nleft unattended and blew up!\nyou have managed to partially\nrepair it.\nfame - 10, research - 50\n\nclick anywhere to contuine')
		missionLog('the mutiny won! your ship was\ndestroyed. the good news is\nthat someone else stopped them\nand came to rescue you.\nthe issue is, the station got\nleft unattended and blew up!\nyou have managed to partially\nrepair it.\nfame - 10, research - 50\n\nclick anywhere to contuine')
	end
	if eventpopup and event2 == 6 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'right when you thought nothing\nwas going to happen...\nyou got a mutiny on your hands!\n\ncapture your crew back!')
			missionLog('right when you thought nothing\nwas going to happen...\nyou got a mutiny on your hands!\n\ncapture your crew back!')
	end
	--event 5
	if eventpopup and event2 == 5.1 then --Reminder to balance size 1 and 2.
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'after a display\nof bad luck, the station\nhas suffered heavy\ncasualties and\nthe bad luck has\nbeen stuied and now is\nwell known\nfame + 5, research + 200')
			missionLog('after a display\nof bad luck, the station\nhas suffered heavy\ncasualties and\nthe bad luck has\nbeen stuied and now is\nwell known\nfame + 5, research + 200')
	end
	if eventpopup and event2 == 5 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 10, 'a person who had\ntheir ship attacked and\nhas very bad luck\nis asking for refuge\n(click to contuine)')
			missionLog('a person who had\ntheir ship attacked and\nhas very bad luck\nis asking for refuge\n(click to contuine)')
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
			missionLog('an abandoned space station\nis drifting into your space.\ntry to salvage it.\n(click to contuine)')
	end
	if eventpopup and event2 == 4.1 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'the abandoned space station\nexploded during repairs\ndue to it being caught\nin a supernova when\nthe station was abandoned\nhp - 20, fame - 1\n(click to contuine)')
			missionLog('the abandoned space station\nexploded during repairs\ndue to it being caught\nin a supernova when\nthe station was abandoned\nhp - 20, fame - 1\n(click to contuine)')
	end
	if eventpopup and event2 == 4.2 then
		screen.setColor(red*255, green*0, blue*0)
			if size == 1 and hp < 80 then
				screen.drawText(1, 20, 'the abandoned space station\nhad some materials\nto use for repairs.\nhp + 20, research + 20\nfame + 5\n(click to contuine)')
				missionLog('the abandoned space station\nhad some materials\nto use for repairs.\nhp + 20, research + 20\nfame + 5\n(click to contuine)')
			elseif size == 2 and hp < 280 then
				screen.drawText(1, 20, 'the abandoned space station\nhad some materials\nto use for repairs.\nhp + 20, research + 20\nfame + 10\n(click to contuine)')
				missionLog('the abandoned space station\nhad some materials\nto use for repairs.\nhp + 20, research + 20\nfame + 10\n(click to contuine)')
			elseif size == 3 and hp < 480 then
				screen.drawText(1, 20, 'the abandoned space station\nhad some materials\nto use for repairs.\nhp + 20, research + 40\n(click to contuine)')
				missionLog('the abandoned space station\nhad some materials\nto use for repairs.\nhp + 20, research + 40\n(click to contuine)')
			else
				screen.drawText(1, 20, 'the abandoned space station\nhad some new tech\nthat has not been seen before\nresearch + 40\n(click to contune)')
				missionLog('the abandoned space station\nhad some new tech\nthat has not been seen before\nresearch + 40\n(click to contune)')
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
			missionLog('both ships have exploded\nduring the firefight. neither\nof them can be salvaged.\n(click to contuine)')
	end
	if eventpopup and event2 == 3.2 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'during the firefight one\nship was destroyed, while the\nother one was not.\nresearch + 50\n(click to contuine)')
			missionLog('during the firefight one\nship was destroyed, while the\nother one was not.\nresearch + 50\n(click to contuine)')
	end
	if eventpopup and event2 == 3.3 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'the weapons operator was\nfresh out of training and had\nquick thinking and targeted\nthe weapons systems of the ship\nboth ships were salvaged\n+100 research\n(click to contuine)')
			missionLog('the weapons operator was\nfresh out of training and had\nquick thinking and targeted\nthe weapons systems of the ship\nboth ships were salvaged\n+100 research\n(click to contuine)')
	end
	if eventpopup and event2 == 3 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'long range sensors have\ndetected two enemy ships in\nattack formation. defend the\nstation before it is destroyed\n(click to contuine)')
			missionLog('long range sensors have\ndetected two enemy ships in\nattack formation. defend the\nstation before it is destroyed\n(click to contuine)')
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
			missionLog('a nearby star is about to\nsupernova. you are told to\ninvestigate the explosion\n(click to contuine)')
	end
	if eventpopup and event2 == 2.1 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'the star has exploded\nthe station barley made it out\nalive. the data was destroyed\nin the process.\nfame -1, hp -60\n(click to contuine)')
			missionLog('the star has exploded\nthe station barley made it out\nalive. the data was destroyed\nin the process.\nfame -1, hp -60\n(click to contuine)')
	end
	if eventpopup and event2 == 2.2 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'you have finshed scanning\nahead of time. the star\nexploded before it was\npredicted to. luckily\nthe station was able to get\nout of its range in time\nfame + 10, research + 90\n(click to contuine)')
			missionLog('you have finshed scanning\nahead of time. the star\nexploded before it was\npredicted to. luckily\nthe station was able to get\nout of its range in time\nfame + 10, research + 90\n(click to contuine)')
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
			missionLog('a ship needing repairs is\napproaching to dock now!\n(click to contuine)')
	end
	if eventpopup and event2 == 1.1 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20,  'an accident caused the\nship to explode. hp - 30\n(click to contuine)')
			missionLog('an accident caused the\nship to explode. hp - 30\n(click to contuine)')
	end
	if eventpopup and event2 == 1.2 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawText(1, 20, 'the crew are thankful for\nthe repairs. fame + 5\n(click to contuine)')
			missionLog('the crew are thankful for\nthe repairs. fame + 5\n(click to contuine)')
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
	if debug_code == timer_debug_code then
		timer.stop()
		print('')
		print('')
		print('')
		print('--')
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
				if size == 2 then
					hp_on_hit = hp_on_hit - (size*damage_multiplier)/30
				end
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
function missionLog(text)--missionlogfunctionsavedata1, 2
	missionlogfunction[text] = text
	numbercounterforfunction = 0
	for k,v in pairs(missionlogfunction) do
--		print(k, '--', v, '1')
		 numbercounterforfunction=numbercounterforfunction+1
		 logmission[numbercounterforfunction+1]=k
	end
	logmission[1] = #missionlogfunction + 1
	
	missionlogfunctionsavedata1[text] = text
	numbercounterforfunction2 = 0
	for k,v in pairs(missionlogfunctionsavedata2) do
--		print(k, '--', v, '2')
		 numbercounterforfunction2=numbercounterforfunction2+1
		 missionlogfunctionsavedata3[numbercounterforfunction1+1]=k
	end
	missionlogfunctionsavedata3[1] = #missionlogfunctionsavedata2 + 1
end

function textBox(x, y, w, h, t, f, r, g, b, onr, ong, onb, offr, offg, offb)
	if f then
		screen.setColor(onr*r, ong*g, onb*b)
			screen.drawRectF(x, y, w, h)
			screen.drawRectF(x, y, w, h)
		screen.setColor(offr*r, offg*g, offb*b)
			screen.drawText(x+1, y+1, t)
	else
		screen.setColor(offr*r, offg*g, offb*b)
			screen.drawRect(x, y, w, h)
		screen.setColor(onr*r, ong*g, onb*b)
			screen.drawText(x+1, y+1, t)
			screen.drawRect(x, y, w, h)
	end
	screen.setColor(255, 255, 255)
end
function isclicking(x, y, w, h, cx, cy, c)
	return cx > x and cx < x+w and cy > y and cy < y+h and c
end
--mission 6
function mutinyMission(hp, r, g, b, cx, cy, c, lvl, time, realHP)
	time = time + 1
	if mutinymission[4] ~= true then
		for i = 7, 1, 5 do
			mutinymission[i] = math.random()
		end
		mutinymission[4] = true
	end
	screen.setColor(150*r, 150*g, 150*b)
	if mutinymission[1] > 80 then
		mutinymission[2] = -.1
	end
	if mutinymission[1] < 10 then
		mutinymission[2] = .1
	end
	mutinymission[1] =  mutinymission[1]+mutinymission[2]
	screen.drawRectF(120, mutinymission[1], 10, 5)
	textBox(135, mutinymission[1]-1, 25, 8, 'fire', (c and cx > 130 and cx < 155 and cy > mutinymission[1] and cy < mutinymission[1]+7), r, g, b, 255, 255, 255, 0, 0, 0)
	screen.setColor(255*r, 255*g, 0*b)
	screen.drawText(35, 91, 'Your HP: '..realHP..'/50')
		if time > 60 then
			mutinymission[5] = math.random()
			mutinymission[6] = math.random()
			mutinymission[7] = math.random()
		end
		if time > 500 then
			if time%10 == 0 and time < 550 then
				realHP = realHP - .5
			end
			if size == 1 then
				screen.setColor(255*r, 255*g, 0)
				screen.drawLine(60, 55, 120, mutinymission[1]+1)
			end
			if size > 1 then
				screen.setColor(255*r, 255*g, 0)
				screen.drawLine(65, 70, 120, mutinymission[1]+1)
			end
		end
		if time > 545 then
			time = 0
		end
		
	fire = c and cx > 130 and cx < 155 and cy > mutinymission[1] and cy < mutinymission[1]+7
	if fire then
		screen.setColor(0*r, 255*g, 0*b)
		if size == 1 then
			if mutinymission[1]+3 > 25 and mutinymission[1]+3 < 30 then
				endpointx = 60
				hit = true
			elseif mutinymission[1]+3 > 30 and mutinymission[1]+3 < 32 then
				endpointx = 65
				hit = true
			elseif mutinymission[1]+3 > 32 and mutinymission[1]+3 < 55 then
				endpointx = 60
				hit = true
			else
				endpointx = 0
				hit = false
			end
		elseif size == 2 then
			if mutinymission[1]+3 > 25 and mutinymission[1]+3 < 30 then
				endpointx = 65
				hit = true
			elseif mutinymission[1]+3 > 30 and mutinymission[1]+3 < 32 then
				endpointx = 70
				hit = true
			elseif mutinymission[1]+3 > 32 and mutinymission[1]+3 < 40 then
				endpointx = 65
				hit = true
			elseif mutinymission[1]+3 > 40 and mutinymission[1]+3 < 42 then
				endpointx = 70
				hit = true
			elseif mutinymission[1]+3 > 42 and mutinymission[1]+3 < 70 then
				endpointx = 65
				hit = true
			else
				endpointx = 0
				hit = false
			end
		elseif size == 3 then
			if mutinymission[1]+3 > 25 and mutinymission[1]+3 < 30 then
				endpointx = 65
				hit = true
			elseif mutinymission[1]+3 > 30 and mutinymission[1]+3 < 32 then
				endpointx = 70
				hit = true
			elseif mutinymission[1]+3 > 32 and mutinymission[1]+3 < 40 then
				endpointx = 65
				hit = true
			elseif mutinymission[1]+3 > 40 and mutinymission[1]+3 < 42 then
				endpointx = 70
				hit = true
			elseif mutinymission[1]+3 > 42 and mutinymission[1]+3 < 50 then
				endpointx = 65
				hit = true
			elseif mutinymission[1]+3 > 50 and mutinymission[1]+3 < 52 then
				endpointx = 70
				hit = true
			elseif mutinymission[1]+3 > 52 and mutinymission[1]+3 < 60 then
				endpointx = 65
				hit = true
			elseif mutinymission[1]+3 > 60 and mutinymission[1]+3 < 62 then
				endpointx = 70
				hit = true
			elseif mutinymission[1]+3 > 62 and mutinymission[1]+3 < 70 then
				endpointx = 65
				hit = true
			else
				endpointx = 0
				hit = false
			end
		end
		screen.drawLine(120, mutinymission[1]+3, endpointx, mutinymission[1]+3)
		if hit then
			if time%10 == 0 then
				hp = hp - (size/2)
			end
			for i = 1, 5 do
				screen.setColor(((mutinymission[7]*100)+100+math.random()*6)*r, ((mutinymission[5]*50)+50+math.random()*6)*g, 0)
				screen.drawLine(endpointx, mutinymission[1]+3, endpointx+(mutinymission[6]*5)+math.random()*6, mutinymission[1]+3+(mutinymission[7]*5)+math.random()*6)
			end
		end
	end
	return hp, time, realHP
end
function criticalerror(code, var1, var2, var3, var4, var5, var6, var7, var8, var9)
	if critical_error_table[1] ~= true then
		for i = 3, 15 do
			if type(critical_error_table[i]) == 'table' then
			else
				critical_error_table[i] = {code, var1, var2, var3, var4, var5, var6, var7, var8, var9}
				critical_error_table[1] = true
				break
			end
		end
	end
end
function critical_error_check()
	if critical_error_table[1] and debug[1] == false then
		screen.setColor(0, 5, 255)
		screen.drawRectF(-999, -999, 9999999, 9999999)
		screen.setColor(255, 255, 255)
		screen.drawText(5, 20, 'warning:\n\ncritical error found\nin the script')
		for i = 1, 9 do
			error = critical_error_table[2]
				if type(error) ~= 'nil' and type(error) ~= 'table' then
					
					screen.drawText(5+(i*12), 46, tostring(critical_error_table[2])..', ')
				end
		end
		screen.drawText(5, 5, 'Please click anywhere to send\ndumplog to console')
		
	end
end
function dumplog(click)
	if click and critical_error_table[1] then
		for i = 1, 400 do
			print(' ')
		end
		print([[dumplog, copy and paste this line into my DMS. ("silo88" on discord) ]], critical_error_table, print_all_vars_debug_code)
	end
end
function pushtotoggle(click, id)
	id2 = id*3
	if backendui[id2+2] == nil then
		backendui[id2+2] = false
	end
	if click and backendui[id2] == false then
		backendui[id2+1] = true
		backendui[id2] = true
	elseif click and backendui[id2] and backendui[id2+1] then
		backendui[id2+1] = false
	elseif click and backendui[id2] then
		backendui[id2+1] = false
	else
		backendui[id2] = false
		backendui[id2+1] = false
	end
	if backendui[id2+1] then
		backendui[id2+2] = not backendui[id2+2]
	end
	return
	backendui[id2+2]
end
function sprites(red, green, blue)
--	spritevar[2] = spritevar[2] + 1
	
	
	spritevar[1] = spritevar[1] + 1
	if spritevar[1] > 60 then
		spritevar[2] = spritevar[2] + 1
		spritevar[1] = 0
	end

	--bases
	if spritevar[2] == 1 then
		screen.setColor(red*255, green*255, blue*255)
			screen.drawRectF(50, 25, 10, 30)
			screen.drawRectF(60, 30, 5, 2)
	elseif spritevar[2] == 2 then
		screen.setColor(red*255, green*255, blue*255)
			screen.drawRectF(50, 25, 15, 45)
			screen.drawRectF(65, 30, 5, 2)
			screen.drawRectF(65, 40, 5, 2)
	elseif spritevar[2] == 3 then
		screen.setColor(red*255, green*255, blue*255)
			screen.drawRectF(50, 25, 15, 45)
			screen.drawRectF(65, 30, 5, 2)
			screen.drawRectF(65, 40, 5, 2)
			screen.drawRectF(65, 50, 5, 2)
			screen.drawRectF(65, 60, 5, 2)
	elseif spritevar[2] == 4 then
		screen.setColor(red*50, green*50, blue*50)
			screen.drawRectF(0, 50, 160, 25)
	elseif spritevar[2] == 5 then
			screen.setColor(red*150, green*150, blue*50)
				screen.drawCircleF(20, 20, 15)
			screen.setColor(red*255, green*255, blue*255)
				screen.drawRectF(18, 33, 4, 5)
				screen.drawRectF(12, 35, 16, 15)
			screen.setColor(red*0, green*0, blue*255)
				screen.drawCircleF(13, 15, 3)
				screen.drawCircleF(27, 15, 3)
	elseif spritevar[2] == 6 then
		screen.setColor(red*0, green*0, blue*255)
		screen.drawRect(1, 75, 120, 19)
			screen.drawText(1, 76, 'with this new station,\nwe can explore places we\nhave never dreamed of!')
	elseif spritevar[2] == 7 then
		screen.setColor(red*50, green*50, blue*50)
			screen.drawCircle(13, 15, 3)
			screen.drawCircle(27, 15, 3)
			screen.drawLine(16, 15, 24, 15)
			screen.drawLine(7, 15, 10, 15)
			screen.drawLine(30, 15, 33, 15)
	elseif spritevar[2] == 8 then
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
	elseif spritevar[2] == 9 then
			screen.setColor(red*50, green*50, blue*50)
				screen.drawRectF(0, 50, 160, 25)
	elseif spritevar[2] == 10 then
		screen.setColor(red*150, green*150, blue*50)
			screen.drawCircleF(20, 20, 15)
		screen.setColor(red*255, green*255, blue*255)
			screen.drawRectF(18, 33, 4, 5)
			screen.drawRectF(12, 35, 16, 15)
		screen.setColor(red*0, green*255, blue*0)
			screen.drawCircleF(13, 15, 3)
			screen.drawCircleF(27, 15, 3)
	elseif spritevar[2] == 11 then
		screen.setColor(red*0, green*255, blue*0)
			screen.drawRect(1, 75, 120, 19)
			screen.drawText(1, 76, 'gramps, the agency has\nrejected all of your\nideas. they wont change!')
	elseif spritevar[2] == 12 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawRectF(5, 5, 30, 4)
			screen.drawRectF(35, 7, 5, 2)
	elseif spritevar[2] == 13 then
		screen.setColor(red*100, green*100, blue*50)
			screen.drawRectF(0, 50, 160, 25)
	elseif spritevar[2] == 14 then
		screen.setColor(red*150, green*150, blue*50)
			screen.drawCircleF(20, 20, 15)
		screen.setColor(red*255, green*255, blue*255)
			screen.drawRectF(18, 33, 4, 5)
			screen.drawRectF(12, 35, 16, 15)
		screen.setColor(red*0, green*0, blue*255)
			screen.drawCircleF(13, 15, 3)
			screen.drawCircleF(27, 15, 3)
	elseif spritevar[2] == 15 then
		screen.setColor(red*0, green*0, blue*255)
			screen.drawRect(1, 75, 90, 19)
				screen.drawText(1, 76, 'so here it is\nthe station of the\nfuture!')
	elseif spritevar[2] == 16 then
		screen.setColor(red*50, green*50, blue*50)
			screen.drawCircle(13, 15, 3)
			screen.drawCircle(27, 15, 3)
			screen.drawLine(16, 15, 24, 15)
			screen.drawLine(7, 15, 10, 15)
			screen.drawLine(30, 15, 33, 15)
	elseif spritevar[2] == 17 then
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
	elseif spritevar[2] == 18 then
		screen.setColor(red*100, green*100, blue*50)
			screen.drawRectF(0, 50, 160, 25)
	elseif spritevar[2] == 19 then
		screen.setColor(red*150, green*150, blue*50)
			screen.drawCircleF(20, 20, 15)
		screen.setColor(red*255, green*255, blue*255)
			screen.drawRectF(18, 33, 4, 5)
			screen.drawRectF(12, 35, 16, 15)
		screen.setColor(red*0, green*0, blue*255)
			screen.drawCircleF(13, 15, 3)
			screen.drawCircleF(27, 15, 3)
			screen.setColor(red*255, green* 0, blue*0)
	elseif spritevar[2] == 20 then
		screen.setColor(red*255, green*0, blue*0)
			screen.drawRect(1, 75, 130, 19)
			screen.drawText(1, 76, 'and you really think we\nwould spend 200 billion\ndollars! down the drain?')
	elseif spritevar[2] == 21 then
		screen.setColor(red*50, green*50, blue*50)
			screen.drawCircle(13, 15, 3)
			screen.drawCircle(27, 15, 3)
			screen.drawLine(16, 15, 24, 15)
			screen.drawLine(7, 15, 10, 15)
			screen.drawLine(30, 15, 33, 15)
	elseif spritevar[2] == 22 then
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
	elseif spritevar[2] == 23 then
		screen.setColor(red*100, green*100, blue*50)
			screen.drawRectF(0, 50, 160, 25)
	elseif spritevar[2] == 24 then
		screen.setColor(red*150, green*150,blue*50)
			screen.drawCircleF(20, 20, 15)
		screen.setColor(red*255, green*255, blue*255)
			screen.drawRectF(18, 33, 4, 5)
			screen.drawRectF(12, 35, 16, 15)
		screen.setColor(red*0, green*0, blue*255)
			screen.drawCircleF(13, 15, 3)
			screen.drawCircleF(27, 15, 3)
	elseif spritevar[2] == 25 then
		screen.setColor(red*0, green*0, blue*255)
			screen.drawRect(1, 75, 110, 19)
			screen.drawText(1, 76, 'i- i- i want to speak\nto the director of the\nagency!')
	elseif spritevar[2] == 26 then
		screen.setColor(red*50, green*50, blue*50)
			screen.drawCircle(13, 15, 3)
			screen.drawCircle(27, 15, 3)
			screen.drawLine(16, 15, 24, 15)
			screen.drawLine(7, 15, 10, 15)
			screen.drawLine(30, 15, 33, 15)
	elseif spritevar[2] == 27 then
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
	elseif spritevar[2] == 28 then
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
	elseif spritevar[2] == 29 then
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
	elseif spritevar[2] == 30 then
		screen.setColor(red*255, green*255, blue*255)
			screen.drawRectF(75, 30, 10, 30)
			screen.drawTriangleF(80, 20, 75, 30, 85, 30)
		screen.setColor(red*75, green*75, blue*75)
			screen.drawTriangleF(80, 60, 75, 70, 85, 70)
	elseif spritevar[2] == 31 then
		screen.setColor(red*255, green*255, blue*255)
			screen.drawRectF(120, 20, 10, 5)
		screen.setColor(red*0, green*0, blue*255)
			screen.drawRectF(130, 20, 10, 2)
	elseif spritevar[2] == 32 then
		screen.setColor(red*255, green*255, blue*255)
			screen.drawRectF(120, 20, 20, 5)
			screen.drawRectF(135, 25, 10, 5)
		screen.setColor(red*0, green*0, blue*255)
			screen.drawRectF(140, 30, 2, 15)
	elseif spritevar[2] == 33 then
		screen.setColor(red*255, green*255, blue*255)
			screen.drawRectF(130, 25, 20, 5)
			screen.drawRectF(125, 30, 10, 5)
			screen.drawRectF(130, 35, 5, 10)
		screen.setColor(red*0, green*0, blue*255)
			screen.drawRectF(135, 40, 10, 5)
	elseif spritevar[2] > 33 then
		pause()
	end
end

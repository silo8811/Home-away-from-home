version = '0.10.1A' --Note, uses the stormworks lua API
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
research = 0 --max 1000
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
titlescreen = false
animation = false
animationstep = 0
function onTick()
	print(size)
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
		event2 = math.random(1, 3)
	else
		event2 = event2
	end
	if event == false then
		event2 = 0
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
	screen.setColor(255, 255, 255)
		screen.drawText(116, 91, 'v.'..version)
	if animation == false and titlescreen == false then
	if eventpopup == false and menu == false then
		if size == 1 then
			screen.setColor(255, 255, 255)
			screen.drawRectF(50, 25, 10, 30)
			screen.drawRectF(60, 30, 5, 2)
		end
		if size == 2 then
			screen.setColor(255, 255, 255)
			screen.drawRectF(50, 25, 15, 45)
			screen.drawRectF(65, 30, 5, 2)
			screen.drawRectF(65, 40, 5, 2)
		end
		if size == 3 then
			screen.setColor(255, 255, 255)
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
			screen.setColor(255, 255, 255)
				screen.drawRectF(5, 80, 41, 8)
			screen.setColor(0, 0, 0)
				screen.drawText(6, 81, 'Upgrades')
			screen.setColor(255, 255, 255)
			menutoggle = true
		elseif click and clickx > 5 and clickx < 46 and clicky > 80 and clicky < 88 and menutoggle and event == false then
		else
			screen.setColor(255, 255, 255)
			screen.drawRect(5, 80, 41, 8)
			screen.drawText(6, 81, 'Upgrades')
			menutoggle = false
		end
		if click and clickx > 5 and clickx < 46 and clicky > 80 and clicky < 88 and menutoggle and event == false or menu then
			screen.setColor(255, 255, 255)
				screen.drawRectF(5, 80, 41, 8)
			screen.setColor(0, 0, 0)
				screen.drawText(6, 81, 'Upgrades')
			screen.setColor(255, 255, 255)
		end
	end
	if menu and event == false then
		--healing
		if click and clickx > 5 and clickx < 40 and clicky > 5 and clicky < 25 and menutoggle2 == false then
			if reactorpoints > 2 and menutoggle2 == false then
				if size == 1 and hp < 92 then
					reactorpoints = reactorpoints - 2
					hp = hp + 10
				end
				if size == 2 and hp < 292 then
					reactorpoints = reactorpoints - 2
					hp = hp + 10
				end
				if size > 3 then
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
		--reactor
		upgradereactortext = 'upgrade\nreactor\n- '..(reactorlv*100)..'pr\nlv= '..reactorlv
		if click and clickx > 50 and clickx < 90 and clicky > 5 and clicky < 35 and menutoggle3 == false then
			screen.drawRectF(50, 5, 40, 30)
			screen.drawText(51, 6, upgradereactortext)
				if reactorpoints > reactorlv*100 then
					reactorpoints = reactorpoints - reactorlv*100
					reactorlv = reactorlv + 1
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
			if reactorpoints > size*200 and fame > size*20 and hp > size*50 then
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
	--event 3
	if eventpopup and event2 == 3.1 then
		screen.setColor(255, 0, 0)
			screen.drawText(1, 20, 'both ships have exploded\nduring the firefight. neither\nof them can be salvaged.\n(click to contuine)')
	end
	if eventpopup and event2 == 3.2 then
		screen.setColor(255, 0, 0)
			screen.drawText(1, 20, 'during the firefight one\nship was destroyed, while the\nother one was not.\nresearch + 50\n(click to contuine)')
	end
	if eventpopup and event2 == 3.3 then
		screen.setColor(255, 0, 0)
			screen.drawText(1, 20, 'the weapons operator was\nfresh out of training and had\nquick thinking and targeted\nthe weapons systems of the ship\nboth ships were salvaged\n+100 research\n(click to contuine)')
	end
	if eventpopup and event2 == 3 then
		screen.setColor(255, 0, 0)
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
			screen.setColor(50, 50, 50)
				screen.drawRectF(100, 30, 5, 2)
				screen.drawRectF(104, 32, 1, 2)
				screen.drawRectF(102, 33, 2, 1)
				screen.drawRectF(104, 28, 1, 2)
				screen.drawRectF(102, 28, 2, 1)
		end
		--ship 2
		if destroyed2 == false then
			screen.setColor(50, 50, 50)
				screen.drawRectF(100, 50, 6, 2)
				screen.drawRectF(104, 52, 1, 2)
				screen.drawRectF(102, 53, 2, 1)
				screen.drawRectF(104, 48, 1, 2)
				screen.drawRectF(102, 48, 2, 1)
		end
		if click and clickx > 110 and clickx < 155 and clicky > 27 and clicky < 34 and e3b1 == false and destroyed1 == false then
			screen.setColor(255, 255, 255)
				screen.drawRectF(110, 27, 45, 7)
				screen.drawText(111, 28, 'target '..attack1)
				attack1 = attack1 - 1
				e3b1 = true
		elseif click and clickx > 110 and clickx < 155 and clicky > 27 and clicky < 34 and e3b1 and destroyed1 == false then
			screen.setColor(255, 255, 255)
				screen.drawRectF(110, 27, 45, 7)
				screen.drawText(111, 28, 'target '..attack1)
		elseif destroyed1 == false then
			screen.setColor(255, 255, 255)
				screen.drawRect(110, 27, 45, 7)
				screen.drawText(111, 28, 'target '..attack1)
			e3b1 = false
		end
		if click and clickx > 110 and clickx < 155 and clicky > 47 and clicky < 54 and e3b2 == false and destroyed2 == false then
			screen.setColor(255, 255, 255)
				screen.drawRectF(110, 47, 45, 7)
				screen.drawText(111, 48, 'target '..attack2)
			attack2 = attack2 - 1
			e3b2 = true
		elseif click and clickx > 110 and clickx < 155 and clicky > 47 and clicky < 54 and e3b2 and destroyed2 == false then
			screen.setColor(255, 255, 255)
				screen.drawRectF(110, 47, 45, 7)
				screen.drawText(111, 48, 'target '..attack2)
		elseif destroyed2 == false then
			screen.setColor(255, 255, 255)
				screen.drawRect(110, 47, 45, 7)
				screen.drawText(111, 48, 'target '..attack2)
			e3b2 = false
		end
		if attacktimer > 150 and attacktimer < 200 and destroyed1 == false then
			if size == 1 then
				screen.setColor(0, 255, 0)
					screen.drawLine(102, 33, 60, 33)
					screen.drawLine(102, 28, 60, 28)
			end
			if size > 2 then
				screen.setColor(0, 255, 0)
					screen.drawLine(102, 33, 65, 33)
					screen.drawLine(102, 28, 65, 28)
			end
		end
		if attacktimer > 350 and attacktimer < 400 and destroyed2 == false then
			if size == 1 then
				screen.setColor(0, 255, 0)
					screen.drawLine(102, 53, 60, 53)
					screen.drawLine(102, 48, 60, 48)
			end
			if size > 2 then
				screen.setColor(0, 255, 0)
					screen.drawLine(102, 53, 65, 53)
					screen.drawLine(102, 48, 65, 48)
			end
		end
		if attacktimer == 150 and destroyed1 == false then
			hp = hp - size*10
		end
		if attacktimer == 350 and destroyed2 == false then
			hp = hp - size*10
		end
	end
	--event 2
	if eventpopup and event2 == 2 then
		screen.setColor(255, 0, 0)
			screen.drawText(1, 20, 'a nearby star is about to \nsupernova. you are told to \ninvestigate the explosion \n(click to contuine)')
	end
	if eventpopup and event2 == 2.1 then
		screen.setColor(255, 0, 0)
			screen.drawText(1, 20, 'the star has exploded \nthe station barley made it out \nalive. the data was destroyed \nin the process. \nfame -1, hp -60 \n(click to contuine)')
	end
	if eventpopup and event2 == 2.2 then
		screen.setColor(255, 0, 0)
			screen.drawText(1, 20, 'you have finshed scanning \n ahead of time. the star \nexploded before it was \npredicted to. luckily \nthe station was able to get \nout of its range in time \nfame + 10, research + 90 \n(click to contuine)')
	end
	if event2 == 2 and accepted then
		if scanning < 0 then
			scanning = 0
		end
		screen.setColor(0, fireg, firer)
			screen.drawCircleF(130, 48, 20)
		screen.setColor(255, 255, 255)
		if click and clickx > 10 and clickx < 59 and clicky > 68 and clicky < 77 and repairst == false then
			screen.drawRectF(10, 70, 49, 7)
				screen.drawText(11, 71, 'Scan: '.. scanning)
			scanning = scanning - 1
			repairst = true
		elseif click and clickx > 10 and clickx < 59 and clicky > 68 and clicky < 77 and repairst == true then
			screen.drawRectF(10, 70, 49, 7)
				screen.drawText(11, 71, 'Scan: '.. scanning)
		else
			repairst = false
			screen.drawRect(10, 70, 49, 7)
				screen.drawText(11, 71, 'Scan: '.. scanning)
		end
		if repairst == 10 and click == false and perevent == false then
			repairaccident = math.random(1, 8)
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
		screen.setColor(255, 0, 0)
			screen.drawText(1, 20, 'a ship needing repairs is \napproaching to dock now! \n(click to contuine)')
	end
	if eventpopup and event2 == 1.1 then
		screen.setColor(255, 0, 0)
			screen.drawText(1, 20,  'an accident caused the \nship to explode. hp - 30 \n(click to contuine)')
	end
	if eventpopup and event2 == 1.2 then
		screen.setColor(255, 0, 0)
			screen.drawText(1, 20, 'the crew are thankful for \nthe repairs. fame + 5 \n(click to contuine)')
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
		screen.setColor(255, 255, 255)
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
			screen.setColor(50, 50, 50)
			screen.drawRectF(65, 29, 10, 4)
			screen.setColor(firer, fireg, 0)
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
			screen.setColor(50, 50, 50)
			screen.drawRectF(70, 29, 10, 4)
			screen.setColor(firer, fireg, 0)
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
			screen.setColor(50, 50, 50)
			screen.drawRectF(70, 29, 10, 4)
			screen.setColor(firer, fireg, 0)
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

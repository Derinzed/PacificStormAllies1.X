-------------------------------------------------------------
-- File with random tasks for strateg level
-------------------------------------------------------------

log_message ("sl_random_tasks.lua parsing begin")

require ("res://common.lua")
-- список вспомогательных переменных для рандомных событий. 
--чтобы было событие с этой вероятностью, ждите пока randNum станет меньше этого числа
--например if randNum < oneTimePerMonth then... - будет значить, что событие произойдет раз в месяц

--1 раз в день.
oneTimePerDay = 1.0

--1 раз в неделю.
oneTimePerWeek = 1.0/7.0

--1 раз в месяц.
oneTimePerMonth = 1.0/30.0

--1 раз в год.
oneTimePerYear = 1.0/365.0


indicTimeToLive = 200

--эту функцию надо вызывать на провал задания
function onTaskFailedFunc(taskName)
	sl_rt_on_task_failed(taskName)
	local indName = sl_rt_get_task_param_string(taskName, "IndicatorName")
	sl_remove_indicator(indName)
	sl_rt_remove_task(taskName)	
end

--эту функцию надо вызывать на выполнение задания
function onTaskCompleteFunc(taskName)
	sl_rt_on_task_complete(taskName)
	local indName = sl_rt_get_task_param_string(taskName, "IndicatorName")
	sl_remove_indicator(indName)
	sl_rt_remove_task(taskName)	
end

--эту функцию надо вызывать при отмене задания
function onTaskCancelFunc(taskName)
	--sl_rt_on_task_complete(taskName)
	local indName = sl_rt_get_task_param_string(taskName, "IndicatorName")
	sl_remove_indicator(indName)
	sl_rt_remove_task(taskName)	
end

-------------------------------------------------------------
-------------------------------------------------------------
-------------------------------------------------------------
--главная функция, следит за рандомами и вызывает функции, которые надо было бы породить
function sl_jap_watch_for_new_random_task()
	--return
	--в обучающих миссиях нет заданий
	if (sl_is_training_mission()) then
		return
	end
	
	--Японцы начинают войну
	if (not(sl_is_at_war(Japan, USA))) then
		if (sl_rt_jap_begin_war_create()==1) then
			return
		end
	end

	--максимум 8 заданий
	if (sl_rt_get_task_count() > 7) then
		return
	end

	local randNum = math.random()
	

	--следим за вторым необходимым апгрейдом
	if (sl_rt_second_upgrade_create()==1) then
		return
	end
	

	--следим за построением юнитов в сонарами
	if (sl_rt_units_with_sonar_create()==1) then
		return
	end


	randNum = math.random()
	--захват базы
	if (sl_is_at_war_with_someone(Japan) and randNum < oneTimePerMonth) then
		if (sl_rt_capture_base_create()==1) then
			return
		end
	end
	
	randNum = math.random()
	
	--запрос на случайный апгрейд
	if (randNum < oneTimePerMonth) then
		if (sl_rt_make_upgrade_create()==1) then
			return
		end
	end
	
	
	randNum = math.random()	
	--обеспечение защиты базы
	if (randNum < oneTimePerDay/5.0) then
		if (sl_rt_reinforce_base_create()==1) then
			return
		end
	end
	
	randNum = math.random()
		
	--просим строить новые здания в уже захваченных зонах
	if (sl_is_at_war_with_someone(Japan) and randNum < oneTimePerWeek*3) then
		if (sl_rt_make_building_on_base_create()==1) then
			return
		end
	end		

	if (not(sl_is_at_war_with_someone(Japan)) and randNum < oneTimePerWeek) then
		if (sl_rt_make_building_on_base_create()==1) then
			return
		end
	end		
		
	randNum = math.random()

	--если идет война, то просим иногда разрушать вражеские здания
	if (sl_is_at_war_with_someone(Japan) and randNum < oneTimePerWeek) then
		if (sl_rt_destroy_building_create()==1) then
			return
		end
	end	
	
	--захват зоны свободной	
	if (sl_rt_make_base_create()==1) then
		return
	end
	
	
end
-------------------------------------------------------------
-------------------------------------------------------------
-------------------------------------------------------------



-------------------------------------------------------------
--создать новую базу в нужной зоне. зона должна выбраться автоматом, если есть свободная
--не может быть 2 таких задания
-------------------------------------------------------------
function sl_rt_make_base_create()
	log_message ("sl_rt_make_base_create() begin creating task")
	
	--проверим, если такое задание уже есть, то новое не создает
	if (sl_rt_have_tasks_with_this_function("sl_rt_make_base")==true) then
		return 0
	end
	
	--чем больше зон, тем реже выдаем это задание
	local zones_count = 0
	if (sl_get_my_player_id() == sl_usa_player:get_id()) then
		zones_count = sl_usa_player:get_zones_count()
	end
	if (sl_get_my_player_id() == sl_japan_player:get_id()) then
		zones_count = sl_japan_player:get_zones_count()
	end	
	if (zones_count > 25) then
		--если больше 25 зон, то раз в 2 месяца
		if (math.random() > oneTimePerMonth/2) then
			return 0
		end
	else
		if (zones_count > 10) then
			--если больше 10 зон, то раз в месяц
			if (math.random() > oneTimePerMonth) then
				return 0
			end
		else
			if (zones_count > 6) then
				--если больше 5 зон, то раз в 2 недели
				if (math.random() > oneTimePerWeek/2) then
					return 0
				end
			end --if (zones_count > 6) then
		end -- if (zones_count > 10) then
	end --if (zones_count > 25) then
	
	

	--создаем новое задание по захвату базы
	--найдем ближайшую пустую базу, которую нужно будет захватить
	local zone = sl_get_near_free_zone()
	if (zone == nil) then
		return 0
	end

	if (zone == "") then
		return 0
	end
	

	------------------------------------------------------------------
	--создаем задание
	local taskName = sl_rt_register_task("sl_rt_make_base", "", "BaseCreate")
	
	
	------------------------------------------------------------------
	--время на задание и параметры задания
	sl_rt_add_task_param_string(taskName, "Zone", zone)
	local daysCount = 30
	sl_rt_add_task_param_string(taskName, "Time", daysCount)	
	------------------------------------------------------------------
	-- регистрируем бонусы и штрафы
	-- +10000 денег
	sl_rt_add_task_param_int(taskName, "PlusMoney", 10000/25*4)

	-- +50000 нефти на главную базу максимум
	local plusOil = 50000
	if (math.random() > 0.7) then
		plusOil = 10000
	else
		if (math.random() > 0.35) then
			plusOil = 25000
		end
	end	
	sl_rt_add_task_param_int(taskName, "PlusOilOnMainBase", plusOil)
	
	-- +5% морали	
	sl_rt_add_task_param_int(taskName, "PlusMorale", 5)
	-- -10% морали
	sl_rt_add_task_param_int(taskName, "MinusMorale", 10)
	sl_rt_add_task_param_int(taskName, "MinusMoney", 20000/25*4)
	------------------------------------------------------------------
	-- покажем стрелку на зону, которую надо захватить и зададим ей время жизни
	--также зададим позицию индикатора - теперь при выделении этого задания будет показываться индикатор в этой позиции
	--если это сделать перед sl_rt_add_task_desc, то можно будет переходить к этому индикатору по правому клику в окне лога
	local zonePos = sl_get_zone_center(zone)
	local indicName = sl_set_indicator_to_point(zonePos)
	sl_set_indicator_time_to_live(indicName,indicTimeToLive,true)	
	sl_rt_add_task_param_int(taskName, "IndicatorX", zonePos['x'])
	sl_rt_add_task_param_int(taskName, "IndicatorY", zonePos['z'])
	sl_rt_add_task_param_string(taskName, "IndicatorName", indicName)	
	------------------------------------------------------------------
	-- сформируем строку информации о задании и выведем ее на экран
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTJapNewBaseCapture", zone, tostring(daysCount), "")
	------------------------------------------------------------------
	
	log_message ("sl_rt_make_base_create() end creating task")
	return 1
end

-------------------------------------------------------------
--создать новую базу в зоне с именем zoneName.
--не может быть 2 таких задания
-------------------------------------------------------------
function sl_rt_make_base_create_with_params(zoneName)
	log_message ("sl_rt_make_base_create() begin creating task")
	
	--проверим, если такое задание уже есть, то новое не создает
	if (sl_rt_have_tasks_with_this_function("sl_rt_make_base")==true) then
		return 0
	end

	local zone = zoneName
	if (zone == nil) then
		return 0
	end

	if (zone == "") then
		return 0
	end
	

	------------------------------------------------------------------
	--создаем задание
	local taskName = sl_rt_register_task("sl_rt_make_base", "", "BaseCreate")
	
	------------------------------------------------------------------
	--время на задание и параметры задания
	sl_rt_add_task_param_string(taskName, "Zone", zone)
	local daysCount = 30
	sl_rt_add_task_param_string(taskName, "Time", daysCount)	
	------------------------------------------------------------------
	-- регистрируем бонусы и штрафы
	-- +10000 денег
	sl_rt_add_task_param_int(taskName, "PlusMoney", 10000/25*4)
	-- +5% морали	
	sl_rt_add_task_param_int(taskName, "PlusMorale", 5)
	-- -10% морали
	sl_rt_add_task_param_int(taskName, "MinusMorale", 10)
	------------------------------------------------------------------
	-- покажем стрелку на зону, которую надо захватить и зададим ей время жизни
	--также зададим позицию индикатора - теперь при выделении этого задания будет показываться индикатор в этой позиции
	--если это сделать перед sl_rt_add_task_desc, то можно будет переходить к этому индикатору по правому клику в окне лога
	local zonePos = sl_get_zone_center(zone)
	local indicName = sl_set_indicator_to_point(zonePos)
	sl_set_indicator_time_to_live(indicName,indicTimeToLive,true)	
	sl_rt_add_task_param_int(taskName, "IndicatorX", zonePos['x'])
	sl_rt_add_task_param_int(taskName, "IndicatorY", zonePos['z'])
	sl_rt_add_task_param_string(taskName, "IndicatorName", indicName)	
	------------------------------------------------------------------
	-- сформируем строку информации о задании и выведем ее на экран
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTJapNewBaseCapture", zone, tostring(daysCount), "")
	------------------------------------------------------------------
	
	log_message ("sl_rt_make_base_create() end creating task")
	return 1
end


--создать новую базу в нужной зоне. зона должна выбраться автоматом, если есть свободная
--проверяет зону на принадлежность myPlayer. если другому, то задание провалено. если ему, то выиграно
--если время кончилось, то задание провалено
function sl_rt_make_base(taskName)
	local zone = sl_rt_get_task_param_string(taskName, "Zone")
	local player = sl_get_zone_player(zone)
	if (player ~= 255) then
		--если кто-то захватил зону, то проигрываем, если это враг и побеждаем, если мы
		if (sl_get_my_player_id() ~= player) then
			onTaskFailedFunc(taskName)
			return
		end	
		onTaskCompleteFunc(taskName)
		return
	end	
	--проверим время на истечение
	if (sl_rt_get_task_last_time(taskName) < 0) then
			onTaskFailedFunc(taskName)
		return
	end	
end


-------------------------------------------------------------
-- создать строение на базе. База, строение и время выбираются случайным образом.
-- не может быть более 3-х таких заданий
-------------------------------------------------------------
function sl_rt_make_building_on_base_create()
	log_message ("sl_rt_make_building_on_base_create() begin creating task")

	--проверим, если такое задание уже есть, то новое не создает
	if (sl_rt_count_tasks_with_this_function("sl_rt_make_building_on_base") > 2) then
		return 0
	end
	
	--получим параметры задания
	local params = sl_rt_get_params_for_make_building_on_base()	
	if (params['have']==false) then
		return 0
	end
		
	local baseName = params['base']
	local buildingName = params['building']
	local timeToComplete = params['time']
	local buildingCost = params['cost'] * math.random(8,12) / 10
	local base = get_base(baseName)
	
	------------------------------------------------------------------
	--создаем задание
	local taskName = sl_rt_register_task("sl_rt_make_building_on_base", "", "MakeBuilding")
	------------------------------------------------------------------
	--время на задание и параметры задания
	sl_rt_add_task_param_string(taskName, "Base", baseName)
	local daysCount = timeToComplete
	sl_rt_add_task_param_string(taskName, "Time", daysCount)	
	sl_rt_add_task_param_string(taskName, "Building", buildingName)	
	local buildingCount = base:get_building_count(buildingName)
	--столько зданий было перед заданием
	sl_rt_add_task_param_int(taskName, "BuildingCount", buildingCount)
	
	------------------------------------------------------------------
	-- регистрируем бонусы и штрафы
	-- +5000 денег
	sl_rt_add_task_param_int(taskName, "PlusMoney", buildingCost)	--/25*4
	-- -10000 денег
	sl_rt_add_task_param_int(taskName, "MinusMoney", 2 * buildingCost)	--/25*4
	------------------------------------------------------------------
	-- покажем стрелку на базу
	if (base ~= nil) then
		local aPos = base:get_position()
		aPos['z'] = aPos['y']
		aPos['y'] = 0		
		local indicName = sl_set_indicator_to_point(aPos)
		sl_set_indicator_time_to_live(indicName,indicTimeToLive,true)	
		sl_rt_add_task_param_int(taskName, "IndicatorX", aPos['x'])
		sl_rt_add_task_param_int(taskName, "IndicatorY", aPos['z'])
		sl_rt_add_task_param_string(taskName, "IndicatorName", indicName)
	end
	------------------------------------------------------------------
	-- сформируем строку информации о задании и выведем ее на экран
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTBuildOnBase", buildingName, baseName, tostring(daysCount))
	------------------------------------------------------------------		
	log_message ("sl_rt_make_building_on_base_create() end creating task")
	return 1
end

-------------------------------------------------------------
-- создать строение на базе
-- не может быть более 3-х таких заданий
-------------------------------------------------------------
function sl_rt_make_building_on_base_create_with_params(baseName, buildingName, timeToComplete)
	log_message ("sl_rt_make_building_on_base_create_with_params() begin creating task")

	--проверим, если такое задание уже есть, то новое не создает
	if (sl_rt_count_tasks_with_this_function("sl_rt_make_building_on_base") > 2) then
		return 0
	end
	
	--получим параметры задания
	local params = sl_rt_get_params_for_make_building_on_base()	
	if (params['have']==false) then
		return 0
	end
		
	local base = get_base(baseName)
	
	------------------------------------------------------------------
	--создаем задание
	local taskName = sl_rt_register_task("sl_rt_make_building_on_base", "", "MakeBuilding")
	------------------------------------------------------------------
	--время на задание и параметры задания
	sl_rt_add_task_param_string(taskName, "Base", baseName)
	local daysCount = timeToComplete
	sl_rt_add_task_param_string(taskName, "Time", daysCount)	
	sl_rt_add_task_param_string(taskName, "Building", buildingName)	
	local buildingCount = base:get_building_count(buildingName)
	--столько зданий было перед заданием
	sl_rt_add_task_param_int(taskName, "BuildingCount", buildingCount)
	
	local buildingCost = params['cost'] * math.random(8, 12) / 10
	
	------------------------------------------------------------------
	-- регистрируем бонусы и штрафы
	-- +5000 денег
	sl_rt_add_task_param_int(taskName, "PlusMoney", buildingCost)	--/25*4
	-- -10000 денег
	sl_rt_add_task_param_int(taskName, "MinusMoney", 2*buildingCost)	--/25*4
	------------------------------------------------------------------
	-- покажем стрелку на базу
	if (base ~= nil) then
		local aPos = base:get_position()
		aPos['z'] = aPos['y']
		aPos['y'] = 0		
		local indicName = sl_set_indicator_to_point(aPos)
		sl_set_indicator_time_to_live(indicName,indicTimeToLive,true)	
		sl_rt_add_task_param_int(taskName, "IndicatorX", aPos['x'])
		sl_rt_add_task_param_int(taskName, "IndicatorY", aPos['z'])
		sl_rt_add_task_param_string(taskName, "IndicatorName", indicName)
	end
	------------------------------------------------------------------
	-- сформируем строку информации о задании и выведем ее на экран
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTBuildOnBase", buildingName, baseName, tostring(daysCount))
	------------------------------------------------------------------		
	log_message ("sl_rt_make_building_on_base_create_with_params() end creating task")
	return 1
end


------------------------------------------------------------------		
function sl_rt_make_building_on_base(taskName)
	--проверим время на истечение
	if (sl_rt_get_task_last_time(taskName) < 0) then
		onTaskFailedFunc(taskName)
		return
	end	
	
	--проверим на потерю базы
	local baseName = sl_rt_get_task_param_string(taskName, "Base")
	local base = get_base(baseName)
	if (base:get_player_id() ~= sl_get_my_player_id()) then
		onTaskFailedFunc(taskName)
		return
	end
	
	--проверим на выполнение
	--столько зданий было перед заданием
	local oldBuildingCount = sl_rt_get_task_param_int(taskName, "BuildingCount")
	local buildName = sl_rt_get_task_param_string(taskName, "Building")
	local BuildingCount = base:get_building_count(buildName)
	if (BuildingCount>oldBuildingCount) then
		--win
		onTaskCompleteFunc(taskName)
		return
	end
	
end


------------------------------------------------------------------
--захват базы вражеской. ищет вражескую базу ближайщую к нам и 
--дает задание ее захватить
function sl_rt_capture_base_create()
	log_message ("sl_rt_capture_base_create() begin creating task")
	
	--проверим, если такое задание уже есть, то новое не создает
	if (sl_rt_count_tasks_with_this_function("sl_rt_capture_base") > 0) then
		return 0
	end
	
	--получим параметры задания
	local baseName = get_near_enemy_base_for_my_player()	
	if (baseName == nil) then
		return 0
	end
	local base = get_base(baseName)
	
	local daysCount = math.random(30,90)
	
	------------------------------------------------------------------
	--создаем задание
	local taskName = sl_rt_register_task("sl_rt_capture_base", "", "UniversalTask")
	------------------------------------------------------------------
	--время на задание и параметры задания
	sl_rt_add_task_param_string(taskName, "Base", baseName)
	sl_rt_add_task_param_string(taskName, "Time", daysCount)
	
	------------------------------------------------------------------
	-- регистрируем бонусы и штрафы
	sl_rt_add_task_param_int(taskName, "PlusMoney", 50000/25*4)
	sl_rt_add_task_param_int(taskName, "PlusMorale", 10)
	sl_rt_add_task_param_int(taskName, "MinusMorale", 10)
	sl_rt_add_task_param_int(taskName, "MinusAllRes", 10)
	------------------------------------------------------------------
	-- покажем стрелку на базу
	if (base ~= nil) then
		local aPos = base:get_position()
		aPos['z'] = aPos['y']
		aPos['y'] = 0		
		local indicName = sl_set_indicator_to_point(aPos)
		sl_set_indicator_time_to_live(indicName,indicTimeToLive,true)	
		sl_rt_add_task_param_int(taskName, "IndicatorX", aPos['x'])
		sl_rt_add_task_param_int(taskName, "IndicatorY", aPos['z'])
		sl_rt_add_task_param_string(taskName, "IndicatorName", indicName)
	end
	------------------------------------------------------------------
	-- сформируем строку информации о задании и выведем ее на экран
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTJapBaseCapture", baseName, tostring(daysCount), "")
	------------------------------------------------------------------			

	log_message ("sl_rt_capture_base_create() end creating task")
	return 1
end


------------------------------------------------------------------
------------------------------------------------------------------
function sl_rt_capture_base(taskName)
	local baseName = sl_rt_get_task_param_string(taskName, "Base")
	local base = get_base(baseName)
	local basePlayer = base:get_player_id()
	local myPlayer = sl_get_my_player_id()
	
	--отменим, если помирились
	if basePlayer ~= myPlayer and not sl_is_at_war(basePlayer+1, myPlayer+1) then
		onTaskCancelFunc(taskName)
		return
	end
	
	--проверим время на истечение
	if (sl_rt_get_task_last_time(taskName) < 0) then
		onTaskFailedFunc(taskName)
		return
	end	
	
	--проверим на потерю базы
	if (basePlayer == myPlayer) then
		onTaskCompleteFunc(taskName)
		return
	end	
end



------------------------------------------------------------------
--сделать рандомный апгрейд
function sl_rt_make_upgrade_create()
	log_message ("sl_rt_make_upgrade_create() begin creating task")
	
	--проверим, если такое задание уже есть, то новое не создает
	if (sl_rt_count_tasks_with_this_function("sl_rt_make_upgrade") > 0) then
		return 0
	end
	
	--получим параметры задания
	local params = sl_rt_get_params_for_make_upgrade()	
	if (params['have']==false) then
		return 0
	end
	
	local daysCount = math.random(5,30)
	daysCount = daysCount + params['time']
	
	------------------------------------------------------------------
	--создаем задание
	local taskName = sl_rt_register_task("sl_rt_make_upgrade", "", "TechnologyCompleted")
	------------------------------------------------------------------
	--время на задание и параметры задания
	sl_rt_add_task_param_string(taskName, "Upgrade", params['upgrade'])
	sl_rt_add_task_param_string(taskName, "Time", daysCount)
	
	------------------------------------------------------------------
	-- регистрируем бонусы и штрафы
	sl_rt_add_task_param_int(taskName, "PlusMoney", 50000/25*4)
	sl_rt_add_task_param_int(taskName, "PlusMorale", 10)
	sl_rt_add_task_param_int(taskName, "MinusMorale", 10)
	sl_rt_add_task_param_int(taskName, "MinusAllRes", 10)

	------------------------------------------------------------------
	-- сформируем строку информации о задании и выведем ее на экран
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTMakeUpgrade", params['upgrade'], tostring(daysCount), "")
	------------------------------------------------------------------			

	log_message ("sl_rt_make_upgrade_create() end creating task")
	return 1
end


------------------------------------------------------------------
--сделать первый апгрейд
function sl_rt_first_upgrade_create()
	log_message ("sl_rt_first_upgrade_create() begin creating task")
	
	--проверим, если такое задание уже есть, то новое не создает
	if (sl_rt_count_tasks_with_this_function("sl_rt_make_upgrade") > 0) then
		return 0
	end

	local upgradeName = "J_DVS1"
	if (sl_get_my_player_id() == sl_usa_player:get_id()) then
		upgradeName = "U_DVS1"
	end
	
	--если его статус недоступный, то выходим
	if (sl_is_available_technology(upgradeName) == false) then
		return 0
	end

	local daysCount = sl_get_days_to_make_technology(upgradeName)
	daysCount = daysCount + math.random(5,30)
	
	------------------------------------------------------------------
	--создаем задание
	local taskName = sl_rt_register_task("sl_rt_make_upgrade", "", "TechnologyCompleted")
	------------------------------------------------------------------
	--время на задание и параметры задания
	sl_rt_add_task_param_string(taskName, "Upgrade", upgradeName)
	sl_rt_add_task_param_string(taskName, "Time", daysCount)
	
	------------------------------------------------------------------
	-- регистрируем бонусы и штрафы
	sl_rt_add_task_param_int(taskName, "PlusMoney", 100000/25*4)
	sl_rt_add_task_param_int(taskName, "PlusAllum", 3000)
	sl_rt_add_task_param_int(taskName, "PlusMorale", 10)
	sl_rt_add_task_param_int(taskName, "PlusAllRes", 10)
	sl_rt_add_task_param_int(taskName, "MinusMorale", 20)
	sl_rt_add_task_param_int(taskName, "MinusAllRes", 10)

	------------------------------------------------------------------
	-- сформируем строку информации о задании и выведем ее на экран
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTMakeUpgradeFirst", upgradeName, tostring(daysCount), "")
	------------------------------------------------------------------			

	log_message ("sl_rt_first_upgrade_create() end creating task")
	return 1
end



------------------------------------------------------------------
--следить, когда сделан первый апгрейд, начинать второй
function sl_rt_second_upgrade_create()
	log_message ("sl_rt_second_upgrade_create() begin creating task")

	-- во время войны нет задания про сонары	
	if (sl_is_at_war_with_someone(sl_get_my_player_id() + 1)) then
		return 0
	end
	
	--проверим, если такое задание уже есть, то новое не создает
	if (sl_rt_count_tasks_with_this_function("sl_rt_make_upgrade") > 0) then
		return 0
	end

	local firstUpgradeName = "J_DVS1"
	if (sl_get_my_player_id() == sl_usa_player:get_id()) then
		firstUpgradeName = "U_DVS1"
	end
	
	--если первый еще не сделан, то выходим
	if (sl_is_developed(firstUpgradeName) == false) then
		return 0
	end

	local upgradeName = "J_Sonar"
	if (sl_get_my_player_id() == sl_usa_player:get_id()) then
		upgradeName = "U_Sonar"
	end
	
	--если его статус недоступный, то выходим
	if (sl_is_available_technology(upgradeName) == false) then
		return 0
	end

	local daysCount = sl_get_days_to_make_technology(upgradeName)
	daysCount = daysCount + math.random(5,30)
	
	------------------------------------------------------------------
	--создаем задание
	local taskName = sl_rt_register_task("sl_rt_make_upgrade", "", "TechnologyCompleted")
	------------------------------------------------------------------
	--время на задание и параметры задания
	sl_rt_add_task_param_string(taskName, "Upgrade", upgradeName)
	sl_rt_add_task_param_string(taskName, "Time", daysCount)
	
	------------------------------------------------------------------
	-- регистрируем бонусы и штрафы
	sl_rt_add_task_param_int(taskName, "PlusMoney", 50000/25*4)
	sl_rt_add_task_param_int(taskName, "PlusMorale", 10)
	sl_rt_add_task_param_int(taskName, "PlusIron", 100000)	
	sl_rt_add_task_param_int(taskName, "PlusAllRes", 10)
	sl_rt_add_task_param_int(taskName, "MinusMorale", 20)
	sl_rt_add_task_param_int(taskName, "MinusAllRes", 10)

	------------------------------------------------------------------
	-- сформируем строку информации о задании и выведем ее на экран
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTMakeUpgradeSecond", upgradeName, tostring(daysCount), "")
	------------------------------------------------------------------			

	log_message ("sl_rt_second_upgrade_create() end creating task")
	return 1
end

------------------------------------------------------------------
--сделать апгрейд
------------------------------------------------------------------
function sl_rt_make_upgrade(taskName)
	--проверим время на истечение
	if (sl_rt_get_task_last_time(taskName) < 0) then
		onTaskFailedFunc(taskName)
		return
	end	

	local upgradeName = sl_rt_get_task_param_string(taskName, "Upgrade")
	--проверим на разработку
	if (sl_is_developed(upgradeName)) then
		onTaskCompleteFunc(taskName)
		return
	end	
end



------------------------------------------------------------------
--следить, когда сделан второй апгрейд про сонары, потребовать создать несколько кораблей с сонарами
function sl_rt_units_with_sonar_create()
	if (sl_rt_task_about_sonars_showed()) then
		return 0
	end

	log_message ("sl_rt_units_with_sonar_create() begin creating task")
	

	--проверим, если такое задание уже есть, то новое не создает
	if (sl_rt_count_tasks_with_this_function("sl_rt_units_with_sonar") > 0) then
		return 0
	end
	
	sl_rt_task_about_sonars_show()
		
	local upgradeName = "J_Sonar"
	if (sl_get_my_player_id() == sl_usa_player:get_id()) then
		upgradeName = "U_Sonar"
	end
	
	--если сонарный апгрейд еще не сделан, то выходим
	if (sl_is_developed(upgradeName) == false) then
		return 0
	end

	local countWithSonar = sl_get_count_units_with_sonar()
	--проверим на 10 штук. если уже есть они, то не выдаем больше задание
	if (countWithSonar > 9) then
		return 0
	end

	local daysCount = 250
	daysCount = daysCount + math.random(15, 45)
	
	------------------------------------------------------------------
	--создаем задание
	local taskName = sl_rt_register_task("sl_rt_units_with_sonar", "", "UniversalTask")
	------------------------------------------------------------------
	--время на задание и параметры задания
	sl_rt_add_task_param_string(taskName, "Time", daysCount)
	
	------------------------------------------------------------------
	-- регистрируем бонусы и штрафы
	sl_rt_add_task_param_int(taskName, "PlusMoney", 50000/25*4)
	sl_rt_add_task_param_int(taskName, "PlusMorale", 10)
	sl_rt_add_task_param_int(taskName, "MinusMorale", 10)
	sl_rt_add_task_param_int(taskName, "MinusAllRes", 5)
	sl_rt_add_task_param_int(taskName, "PlusAllRes", 5)

	------------------------------------------------------------------
	-- сформируем строку информации о задании и выведем ее на экран
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTMakeUnitsWithSonar", tostring(daysCount), "", "")
	------------------------------------------------------------------			

	log_message ("sl_rt_units_with_sonar_create() end creating task")
	return 1
end


function sl_rt_units_with_sonar(taskName)
	--проверим время на истечение
	if (sl_rt_get_task_last_time(taskName) < 0) then
		onTaskFailedFunc(taskName)
		return
	end	

	local countWithSonar = sl_get_count_units_with_sonar()
	--проверим на 10 штук
	if (countWithSonar > 9) then
		onTaskCompleteFunc(taskName)
		return
	end	
end



-------------------------------------------------------------
-- Разрушить строение на базе. База, строение и время выбираются случайным образом.
-- не может быть более 3-х таких заданий. должна быть война
-------------------------------------------------------------
function sl_rt_destroy_building_create()
	log_message ("sl_rt_destroy_building_create() begin creating task")

	--проверим, если такое задание уже есть, то новое не создает
	if (sl_rt_count_tasks_with_this_function("sl_rt_destroy_building") > 2) then
		return 0
	end
	
	--получим параметры задания
	local params = sl_rt_get_params_for_destroy_building()	
	if (params['have']==false) then
		return 0
	end
		
	local baseName = params['base']
	local buildingName = params['building']
	local timeToComplete = params['time']
	local base = get_base(baseName)
	
	------------------------------------------------------------------
	--создаем задание
	local taskName = sl_rt_register_task("sl_rt_destroy_building", "", "DestroyBuilding")
	------------------------------------------------------------------
	--время на задание и параметры задания
	sl_rt_add_task_param_string(taskName, "Base", baseName)
	local daysCount = timeToComplete
	sl_rt_add_task_param_string(taskName, "Time", daysCount)	
	sl_rt_add_task_param_string(taskName, "Building", buildingName)	
	local buildingCount = base:get_building_count(buildingName)
	--столько зданий было перед заданием
	sl_rt_add_task_param_int(taskName, "BuildingCount", buildingCount)
	
	------------------------------------------------------------------
	-- регистрируем бонусы и штрафы
	-- +5000 денег
	sl_rt_add_task_param_int(taskName, "PlusMoney", 5000/25*4)
	-- -5000 денег
	sl_rt_add_task_param_int(taskName, "MinusMoney", 5000/25*4)
	------------------------------------------------------------------
	-- покажем стрелку на базу
	if (base ~= nil) then
		local aPos = base:get_position()
		aPos['z'] = aPos['y']
		aPos['y'] = 0		
		local indicName = sl_set_indicator_to_point(aPos)
		sl_set_indicator_time_to_live(indicName,indicTimeToLive,true)	
		sl_rt_add_task_param_int(taskName, "IndicatorX", aPos['x'])
		sl_rt_add_task_param_int(taskName, "IndicatorY", aPos['z'])
		sl_rt_add_task_param_string(taskName, "IndicatorName", indicName)
	end
	------------------------------------------------------------------
	-- сформируем строку информации о задании и выведем ее на экран
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTDestroyBuilding", baseName, buildingName, tostring(daysCount))
	------------------------------------------------------------------		
	log_message ("sl_rt_destroy_building_create() end creating task")
	return 1
end


------------------------------------------------------------------		
function sl_rt_destroy_building(taskName)
	--проверим время на истечение
	if (sl_rt_get_task_last_time(taskName) < 0) then
		onTaskFailedFunc(taskName)
		return
	end	
	
	--проверим на захват базы
	local baseName = sl_rt_get_task_param_string(taskName, "Base")
	local base = get_base(baseName)
	if (base:get_player_id() == sl_get_my_player_id()) then
		onTaskCompleteFunc(taskName)
		return
	end
	
	--проверим на выполнение
	--столько зданий было перед заданием
	local oldBuildingCount = sl_rt_get_task_param_int(taskName, "BuildingCount")
	local buildName = sl_rt_get_task_param_string(taskName, "Building")
	local BuildingCount = base:get_building_count(buildName)
	if (BuildingCount<oldBuildingCount) then
		--win
		onTaskCompleteFunc(taskName)
		return
	end	
end



-------------------------------------------------------------
-- Задание на начало войны для японцев. выдается 1 раз в определенное время.
-- при невыполнении большой минус, да и собственно, проигрыш
-------------------------------------------------------------
function sl_rt_jap_begin_war_create()
	log_message ("sl_rt_jap_begin_war_create() begin creating task")

	--проверим, если такое задание уже есть, то новое не создает
	if (sl_rt_count_tasks_with_this_function("sl_rt_jap_begin_war") > 0) then
		return 0
	end
	
	--проверим время
	--даем задание не раньше 1941 года
	if (sl_get_year() < 1941) then
		return 0
	end
	
	--даем задание не раньше октября
	if (sl_get_month() <= 9) then
		return 0
	end	
	

	------------------------------------------------------------------
	--создаем задание
	local taskName = sl_rt_register_task("sl_rt_jap_begin_war", "", "FoundEnemy")
	
	------------------------------------------------------------------
	-- задание на такой срок
	local daysCount = 60

	if sl_get_game_type() ~= "arcade" then
		-- задание д.б. выполнено до конца года, иначе проиграем
		daysCount = math.ceil((12-sl_get_month())*30.5) + 31 - sl_get_day() + 1
	else
		------------------------------------------------------------------
		-- регистрируем бонусы и штрафы
		-- нельзя отказываться от таких заданий
		sl_rt_add_task_param_int(taskName, "MinusMorale", 50)
		sl_rt_add_task_param_int(taskName, "MinusAllRes", 50)
	end

	------------------------------------------------------------------
	-- сформируем строку информации о задании и выведем ее на экран
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTJapanBeginWar", tostring(daysCount), "", "")
	------------------------------------------------------------------		
	log_message ("sl_rt_jap_begin_war_create() end creating task")
	return 1
end


------------------------------------------------------------------		
function sl_rt_jap_begin_war(taskName)
	--проверим время на истечение
	if (sl_rt_get_task_last_time(taskName) < 0) then
		onTaskFailedFunc(taskName)
		return
	end
	
	-- если началась война, то задание выполнено
	if (sl_is_at_war(Japan, USA)) then
		onTaskCompleteFunc(taskName)
	end
end

-------------------------------------------------------------
-- Задание обеспечить защитой свою слабозащищённую базу, т.е.
-- разместить там дополнительные силы
-------------------------------------------------------------
function sl_rt_reinforce_base_create()
	log_message ("sl_rt_reinforce_base_create() begin creating task")

	--состояние войны
	local isAtWar = sl_is_at_war_with_someone(sl_get_my_player_id() + 1)

	--в мирное время 3 заданий одновременно будет достаточно
	local maxTasks = 3
	if (isAtWar) then
		maxTasks = 5
	end
	--проверим, если таких заданий уже много, то новое не создаём
	if (sl_rt_count_tasks_with_this_function("sl_rt_reinforce_base") >= maxTasks) then
		return 0
	end

	--получим параметры задания
	local minShipsCount = 2
	local minAirplanesCount = 6
	local daysCount = math.random(15,30)
	local waitingTime = 30
	local money = 4000
	local morale = 5

	--во время войны и войск надо больше и награда на выполнение больше
	if (isAtWar) then
		minShipsCount = 5
		minAirplanesCount = 20
		money = 10000
		morale = 10
	end

	local baseName = get_base_for_reinforce(minShipsCount, minAirplanesCount)
	if (baseName == nil) then
		return 0
	end
	local base = get_base(baseName)
	local baseAirportsCount = base:get_building_count("Airport")

	------------------------------------------------------------------
	--создаем задание
	local taskName = sl_rt_register_task("sl_rt_reinforce_base", "", "UniversalTask")
	------------------------------------------------------------------
	--время на задание и параметры задания
	sl_rt_add_task_param_string(taskName, "Base", baseName)
	sl_rt_add_task_param_string(taskName, "Time", daysCount)	--string???

	------------------------------------------------------------------
	-- регистрируем бонусы и штрафы
	sl_rt_add_task_param_int(taskName, "PlusMoney", money)
	sl_rt_add_task_param_int(taskName, "PlusMorale", morale)
	sl_rt_add_task_param_int(taskName, "MinusMorale", morale)
	sl_rt_add_task_param_int(taskName, "MinusMoney", 2 * money)
	------------------------------------------------------------------
	--сохраним кол-во аэропортов, чтобы не просить самолёты для базы без аэропорта
	sl_rt_add_task_param_int(taskName, "AirportsCount", baseAirportsCount)
	sl_rt_add_task_param_int(taskName, "MinShipsCount", minShipsCount)
	sl_rt_add_task_param_int(taskName, "MinAirplanesCount", minAirplanesCount)
	sl_rt_add_task_param_int(taskName, "IsWaiting", 0)
	sl_rt_add_task_param_int(taskName, "WaitingTime", waitingTime)
	------------------------------------------------------------------
	-- покажем стрелку на базу
	if (base ~= nil) then
		local aPos = base:get_position()
		aPos['z'] = aPos['y']
		aPos['y'] = 0
		local indicName = sl_set_indicator_to_point(aPos)
		sl_set_indicator_time_to_live(indicName,indicTimeToLive,true)	
		sl_rt_add_task_param_int(taskName, "IndicatorX", aPos['x'])
		sl_rt_add_task_param_int(taskName, "IndicatorY", aPos['z'])
		sl_rt_add_task_param_string(taskName, "IndicatorName", indicName)
	end
	------------------------------------------------------------------
	-- сформируем строку информации о задании и выведем ее на экран
	if (baseAirportsCount > 0) then
		sl_rt_add_task_desc4(taskName, daysCount, "IDS_MSG_RTBaseReinforce", baseName, tostring(minShipsCount), tostring(minAirplanesCount), tostring(daysCount))
	else 
		sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTBaseReinforceOnlyShips", baseName, tostring(minShipsCount), tostring(daysCount))
	end
	------------------------------------------------------------------		

	log_message ("sl_rt_reinforce_base_create() end creating task")
	return 1
end


------------------------------------------------------------------		
function sl_rt_reinforce_base(taskName)
	--проверим время на истечение
	local lastTime = sl_rt_get_task_last_time(taskName)
	if (lastTime < 0) then
		onTaskFailedFunc(taskName)
		return
	end
	
	--если захватили нашу базу, до того как мы её защитили, то это провал
	local baseName = sl_rt_get_task_param_string(taskName, "Base")
	local base = get_base(baseName)
	if (base:get_player_id() ~= sl_get_my_player_id()) then
		onTaskFailedFunc(taskName)
		return
	end

	local baseAirportsCount = sl_rt_get_task_param_int(taskName, "AirportsCount")
	local minShipsCount = sl_rt_get_task_param_int(taskName, "MinShipsCount")
	local minAirplanesCount = sl_rt_get_task_param_int(taskName, "MinAirplanesCount")
	local isWaiting = sl_rt_get_task_param_int(taskName, "IsWaiting")
	local waitingTime = sl_rt_get_task_param_int(taskName, "WaitingTime")

	--проверим на выполнение
	if (isWaiting == 0) then
		if (base:get_ships_count() >= minShipsCount or base:get_airplanes_count() >= minAirplanesCount) then
			sl_rt_add_task_param_int(taskName, "IsWaiting", 1)

			--время увеличим до waitingTime
			sl_rt_set_task_time(taskName, waitingTime + 1)
			--sl_rt_add_task_param_string(taskName, "Time", waitingTime + 1)
			return
		end
	else
		if (base:get_ships_count() < minShipsCount and base:get_airplanes_count() < minAirplanesCount) then
			onTaskFailedFunc(taskName)
			return
		end
		if (waitingTime > 0) then
			local dec = waitingTime - 1
			sl_rt_add_task_param_int(taskName, "WaitingTime", dec)
		else
			onTaskCompleteFunc(taskName)
		end
		return
	end
end

log_message ("sl_random_tasks.lua parsing end")



-------------------------------------------------------------
-- File with random tasks for strateg level
-------------------------------------------------------------

log_message ("sl_random_tasks.lua parsing begin")

require ("res://common.lua")
-- ������ ��������������� ���������� ��� ��������� �������. 
--����� ���� ������� � ���� ������������, ����� ���� randNum ������ ������ ����� �����
--�������� if randNum < oneTimePerMonth then... - ����� �������, ��� ������� ���������� ��� � �����

--1 ��� � ����.
oneTimePerDay = 1.0

--1 ��� � ������.
oneTimePerWeek = 1.0/7.0

--1 ��� � �����.
oneTimePerMonth = 1.0/30.0

--1 ��� � ���.
oneTimePerYear = 1.0/365.0


indicTimeToLive = 200

--��� ������� ���� �������� �� ������ �������
function onTaskFailedFunc(taskName)
	sl_rt_on_task_failed(taskName)
	local indName = sl_rt_get_task_param_string(taskName, "IndicatorName")
	sl_remove_indicator(indName)
	sl_rt_remove_task(taskName)	
end

--��� ������� ���� �������� �� ���������� �������
function onTaskCompleteFunc(taskName)
	sl_rt_on_task_complete(taskName)
	local indName = sl_rt_get_task_param_string(taskName, "IndicatorName")
	sl_remove_indicator(indName)
	sl_rt_remove_task(taskName)	
end

--��� ������� ���� �������� ��� ������ �������
function onTaskCancelFunc(taskName)
	--sl_rt_on_task_complete(taskName)
	local indName = sl_rt_get_task_param_string(taskName, "IndicatorName")
	sl_remove_indicator(indName)
	sl_rt_remove_task(taskName)	
end

-------------------------------------------------------------
-------------------------------------------------------------
-------------------------------------------------------------
--������� �������, ������ �� ��������� � �������� �������, ������� ���� ���� �� ��������
function sl_jap_watch_for_new_random_task()
	--return
	--� ��������� ������� ��� �������
	if (sl_is_training_mission()) then
		return
	end
	
	--������ �������� �����
	if (not(sl_is_at_war(Japan, USA))) then
		if (sl_rt_jap_begin_war_create()==1) then
			return
		end
	end

	--�������� 8 �������
	if (sl_rt_get_task_count() > 7) then
		return
	end

	local randNum = math.random()
	

	--������ �� ������ ����������� ���������
	if (sl_rt_second_upgrade_create()==1) then
		return
	end
	

	--������ �� ����������� ������ � ��������
	if (sl_rt_units_with_sonar_create()==1) then
		return
	end


	randNum = math.random()
	--������ ����
	if (sl_is_at_war_with_someone(Japan) and randNum < oneTimePerMonth) then
		if (sl_rt_capture_base_create()==1) then
			return
		end
	end
	
	randNum = math.random()
	
	--������ �� ��������� �������
	if (randNum < oneTimePerMonth) then
		if (sl_rt_make_upgrade_create()==1) then
			return
		end
	end
	
	
	randNum = math.random()	
	--����������� ������ ����
	if (randNum < oneTimePerDay/5.0) then
		if (sl_rt_reinforce_base_create()==1) then
			return
		end
	end
	
	randNum = math.random()
		
	--������ ������� ����� ������ � ��� ����������� �����
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

	--���� ���� �����, �� ������ ������ ��������� ��������� ������
	if (sl_is_at_war_with_someone(Japan) and randNum < oneTimePerWeek) then
		if (sl_rt_destroy_building_create()==1) then
			return
		end
	end	
	
	--������ ���� ���������	
	if (sl_rt_make_base_create()==1) then
		return
	end
	
	
end
-------------------------------------------------------------
-------------------------------------------------------------
-------------------------------------------------------------



-------------------------------------------------------------
--������� ����� ���� � ������ ����. ���� ������ ��������� ���������, ���� ���� ���������
--�� ����� ���� 2 ����� �������
-------------------------------------------------------------
function sl_rt_make_base_create()
	log_message ("sl_rt_make_base_create() begin creating task")
	
	--��������, ���� ����� ������� ��� ����, �� ����� �� �������
	if (sl_rt_have_tasks_with_this_function("sl_rt_make_base")==true) then
		return 0
	end
	
	--��� ������ ���, ��� ���� ������ ��� �������
	local zones_count = 0
	if (sl_get_my_player_id() == sl_usa_player:get_id()) then
		zones_count = sl_usa_player:get_zones_count()
	end
	if (sl_get_my_player_id() == sl_japan_player:get_id()) then
		zones_count = sl_japan_player:get_zones_count()
	end	
	if (zones_count > 25) then
		--���� ������ 25 ���, �� ��� � 2 ������
		if (math.random() > oneTimePerMonth/2) then
			return 0
		end
	else
		if (zones_count > 10) then
			--���� ������ 10 ���, �� ��� � �����
			if (math.random() > oneTimePerMonth) then
				return 0
			end
		else
			if (zones_count > 6) then
				--���� ������ 5 ���, �� ��� � 2 ������
				if (math.random() > oneTimePerWeek/2) then
					return 0
				end
			end --if (zones_count > 6) then
		end -- if (zones_count > 10) then
	end --if (zones_count > 25) then
	
	

	--������� ����� ������� �� ������� ����
	--������ ��������� ������ ����, ������� ����� ����� ���������
	local zone = sl_get_near_free_zone()
	if (zone == nil) then
		return 0
	end

	if (zone == "") then
		return 0
	end
	

	------------------------------------------------------------------
	--������� �������
	local taskName = sl_rt_register_task("sl_rt_make_base", "", "BaseCreate")
	
	
	------------------------------------------------------------------
	--����� �� ������� � ��������� �������
	sl_rt_add_task_param_string(taskName, "Zone", zone)
	local daysCount = 30
	sl_rt_add_task_param_string(taskName, "Time", daysCount)	
	------------------------------------------------------------------
	-- ������������ ������ � ������
	-- +10000 �����
	sl_rt_add_task_param_int(taskName, "PlusMoney", 10000/25*4)

	-- +50000 ����� �� ������� ���� ��������
	local plusOil = 50000
	if (math.random() > 0.7) then
		plusOil = 10000
	else
		if (math.random() > 0.35) then
			plusOil = 25000
		end
	end	
	sl_rt_add_task_param_int(taskName, "PlusOilOnMainBase", plusOil)
	
	-- +5% ������	
	sl_rt_add_task_param_int(taskName, "PlusMorale", 5)
	-- -10% ������
	sl_rt_add_task_param_int(taskName, "MinusMorale", 10)
	sl_rt_add_task_param_int(taskName, "MinusMoney", 20000/25*4)
	------------------------------------------------------------------
	-- ������� ������� �� ����, ������� ���� ��������� � ������� �� ����� �����
	--����� ������� ������� ���������� - ������ ��� ��������� ����� ������� ����� ������������ ��������� � ���� �������
	--���� ��� ������� ����� sl_rt_add_task_desc, �� ����� ����� ���������� � ����� ���������� �� ������� ����� � ���� ����
	local zonePos = sl_get_zone_center(zone)
	local indicName = sl_set_indicator_to_point(zonePos)
	sl_set_indicator_time_to_live(indicName,indicTimeToLive,true)	
	sl_rt_add_task_param_int(taskName, "IndicatorX", zonePos['x'])
	sl_rt_add_task_param_int(taskName, "IndicatorY", zonePos['z'])
	sl_rt_add_task_param_string(taskName, "IndicatorName", indicName)	
	------------------------------------------------------------------
	-- ���������� ������ ���������� � ������� � ������� �� �� �����
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTJapNewBaseCapture", zone, tostring(daysCount), "")
	------------------------------------------------------------------
	
	log_message ("sl_rt_make_base_create() end creating task")
	return 1
end

-------------------------------------------------------------
--������� ����� ���� � ���� � ������ zoneName.
--�� ����� ���� 2 ����� �������
-------------------------------------------------------------
function sl_rt_make_base_create_with_params(zoneName)
	log_message ("sl_rt_make_base_create() begin creating task")
	
	--��������, ���� ����� ������� ��� ����, �� ����� �� �������
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
	--������� �������
	local taskName = sl_rt_register_task("sl_rt_make_base", "", "BaseCreate")
	
	------------------------------------------------------------------
	--����� �� ������� � ��������� �������
	sl_rt_add_task_param_string(taskName, "Zone", zone)
	local daysCount = 30
	sl_rt_add_task_param_string(taskName, "Time", daysCount)	
	------------------------------------------------------------------
	-- ������������ ������ � ������
	-- +10000 �����
	sl_rt_add_task_param_int(taskName, "PlusMoney", 10000/25*4)
	-- +5% ������	
	sl_rt_add_task_param_int(taskName, "PlusMorale", 5)
	-- -10% ������
	sl_rt_add_task_param_int(taskName, "MinusMorale", 10)
	------------------------------------------------------------------
	-- ������� ������� �� ����, ������� ���� ��������� � ������� �� ����� �����
	--����� ������� ������� ���������� - ������ ��� ��������� ����� ������� ����� ������������ ��������� � ���� �������
	--���� ��� ������� ����� sl_rt_add_task_desc, �� ����� ����� ���������� � ����� ���������� �� ������� ����� � ���� ����
	local zonePos = sl_get_zone_center(zone)
	local indicName = sl_set_indicator_to_point(zonePos)
	sl_set_indicator_time_to_live(indicName,indicTimeToLive,true)	
	sl_rt_add_task_param_int(taskName, "IndicatorX", zonePos['x'])
	sl_rt_add_task_param_int(taskName, "IndicatorY", zonePos['z'])
	sl_rt_add_task_param_string(taskName, "IndicatorName", indicName)	
	------------------------------------------------------------------
	-- ���������� ������ ���������� � ������� � ������� �� �� �����
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTJapNewBaseCapture", zone, tostring(daysCount), "")
	------------------------------------------------------------------
	
	log_message ("sl_rt_make_base_create() end creating task")
	return 1
end


--������� ����� ���� � ������ ����. ���� ������ ��������� ���������, ���� ���� ���������
--��������� ���� �� �������������� myPlayer. ���� �������, �� ������� ���������. ���� ���, �� ��������
--���� ����� ���������, �� ������� ���������
function sl_rt_make_base(taskName)
	local zone = sl_rt_get_task_param_string(taskName, "Zone")
	local player = sl_get_zone_player(zone)
	if (player ~= 255) then
		--���� ���-�� �������� ����, �� �����������, ���� ��� ���� � ���������, ���� ��
		if (sl_get_my_player_id() ~= player) then
			onTaskFailedFunc(taskName)
			return
		end	
		onTaskCompleteFunc(taskName)
		return
	end	
	--�������� ����� �� ���������
	if (sl_rt_get_task_last_time(taskName) < 0) then
			onTaskFailedFunc(taskName)
		return
	end	
end


-------------------------------------------------------------
-- ������� �������� �� ����. ����, �������� � ����� ���������� ��������� �������.
-- �� ����� ���� ����� 3-� ����� �������
-------------------------------------------------------------
function sl_rt_make_building_on_base_create()
	log_message ("sl_rt_make_building_on_base_create() begin creating task")

	--��������, ���� ����� ������� ��� ����, �� ����� �� �������
	if (sl_rt_count_tasks_with_this_function("sl_rt_make_building_on_base") > 2) then
		return 0
	end
	
	--������� ��������� �������
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
	--������� �������
	local taskName = sl_rt_register_task("sl_rt_make_building_on_base", "", "MakeBuilding")
	------------------------------------------------------------------
	--����� �� ������� � ��������� �������
	sl_rt_add_task_param_string(taskName, "Base", baseName)
	local daysCount = timeToComplete
	sl_rt_add_task_param_string(taskName, "Time", daysCount)	
	sl_rt_add_task_param_string(taskName, "Building", buildingName)	
	local buildingCount = base:get_building_count(buildingName)
	--������� ������ ���� ����� ��������
	sl_rt_add_task_param_int(taskName, "BuildingCount", buildingCount)
	
	------------------------------------------------------------------
	-- ������������ ������ � ������
	-- +5000 �����
	sl_rt_add_task_param_int(taskName, "PlusMoney", buildingCost)	--/25*4
	-- -10000 �����
	sl_rt_add_task_param_int(taskName, "MinusMoney", 2 * buildingCost)	--/25*4
	------------------------------------------------------------------
	-- ������� ������� �� ����
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
	-- ���������� ������ ���������� � ������� � ������� �� �� �����
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTBuildOnBase", buildingName, baseName, tostring(daysCount))
	------------------------------------------------------------------		
	log_message ("sl_rt_make_building_on_base_create() end creating task")
	return 1
end

-------------------------------------------------------------
-- ������� �������� �� ����
-- �� ����� ���� ����� 3-� ����� �������
-------------------------------------------------------------
function sl_rt_make_building_on_base_create_with_params(baseName, buildingName, timeToComplete)
	log_message ("sl_rt_make_building_on_base_create_with_params() begin creating task")

	--��������, ���� ����� ������� ��� ����, �� ����� �� �������
	if (sl_rt_count_tasks_with_this_function("sl_rt_make_building_on_base") > 2) then
		return 0
	end
	
	--������� ��������� �������
	local params = sl_rt_get_params_for_make_building_on_base()	
	if (params['have']==false) then
		return 0
	end
		
	local base = get_base(baseName)
	
	------------------------------------------------------------------
	--������� �������
	local taskName = sl_rt_register_task("sl_rt_make_building_on_base", "", "MakeBuilding")
	------------------------------------------------------------------
	--����� �� ������� � ��������� �������
	sl_rt_add_task_param_string(taskName, "Base", baseName)
	local daysCount = timeToComplete
	sl_rt_add_task_param_string(taskName, "Time", daysCount)	
	sl_rt_add_task_param_string(taskName, "Building", buildingName)	
	local buildingCount = base:get_building_count(buildingName)
	--������� ������ ���� ����� ��������
	sl_rt_add_task_param_int(taskName, "BuildingCount", buildingCount)
	
	local buildingCost = params['cost'] * math.random(8, 12) / 10
	
	------------------------------------------------------------------
	-- ������������ ������ � ������
	-- +5000 �����
	sl_rt_add_task_param_int(taskName, "PlusMoney", buildingCost)	--/25*4
	-- -10000 �����
	sl_rt_add_task_param_int(taskName, "MinusMoney", 2*buildingCost)	--/25*4
	------------------------------------------------------------------
	-- ������� ������� �� ����
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
	-- ���������� ������ ���������� � ������� � ������� �� �� �����
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTBuildOnBase", buildingName, baseName, tostring(daysCount))
	------------------------------------------------------------------		
	log_message ("sl_rt_make_building_on_base_create_with_params() end creating task")
	return 1
end


------------------------------------------------------------------		
function sl_rt_make_building_on_base(taskName)
	--�������� ����� �� ���������
	if (sl_rt_get_task_last_time(taskName) < 0) then
		onTaskFailedFunc(taskName)
		return
	end	
	
	--�������� �� ������ ����
	local baseName = sl_rt_get_task_param_string(taskName, "Base")
	local base = get_base(baseName)
	if (base:get_player_id() ~= sl_get_my_player_id()) then
		onTaskFailedFunc(taskName)
		return
	end
	
	--�������� �� ����������
	--������� ������ ���� ����� ��������
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
--������ ���� ���������. ���� ��������� ���� ��������� � ��� � 
--���� ������� �� ���������
function sl_rt_capture_base_create()
	log_message ("sl_rt_capture_base_create() begin creating task")
	
	--��������, ���� ����� ������� ��� ����, �� ����� �� �������
	if (sl_rt_count_tasks_with_this_function("sl_rt_capture_base") > 0) then
		return 0
	end
	
	--������� ��������� �������
	local baseName = get_near_enemy_base_for_my_player()	
	if (baseName == nil) then
		return 0
	end
	local base = get_base(baseName)
	
	local daysCount = math.random(30,90)
	
	------------------------------------------------------------------
	--������� �������
	local taskName = sl_rt_register_task("sl_rt_capture_base", "", "UniversalTask")
	------------------------------------------------------------------
	--����� �� ������� � ��������� �������
	sl_rt_add_task_param_string(taskName, "Base", baseName)
	sl_rt_add_task_param_string(taskName, "Time", daysCount)
	
	------------------------------------------------------------------
	-- ������������ ������ � ������
	sl_rt_add_task_param_int(taskName, "PlusMoney", 50000/25*4)
	sl_rt_add_task_param_int(taskName, "PlusMorale", 10)
	sl_rt_add_task_param_int(taskName, "MinusMorale", 10)
	sl_rt_add_task_param_int(taskName, "MinusAllRes", 10)
	------------------------------------------------------------------
	-- ������� ������� �� ����
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
	-- ���������� ������ ���������� � ������� � ������� �� �� �����
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
	
	--�������, ���� ����������
	if basePlayer ~= myPlayer and not sl_is_at_war(basePlayer+1, myPlayer+1) then
		onTaskCancelFunc(taskName)
		return
	end
	
	--�������� ����� �� ���������
	if (sl_rt_get_task_last_time(taskName) < 0) then
		onTaskFailedFunc(taskName)
		return
	end	
	
	--�������� �� ������ ����
	if (basePlayer == myPlayer) then
		onTaskCompleteFunc(taskName)
		return
	end	
end



------------------------------------------------------------------
--������� ��������� �������
function sl_rt_make_upgrade_create()
	log_message ("sl_rt_make_upgrade_create() begin creating task")
	
	--��������, ���� ����� ������� ��� ����, �� ����� �� �������
	if (sl_rt_count_tasks_with_this_function("sl_rt_make_upgrade") > 0) then
		return 0
	end
	
	--������� ��������� �������
	local params = sl_rt_get_params_for_make_upgrade()	
	if (params['have']==false) then
		return 0
	end
	
	local daysCount = math.random(5,30)
	daysCount = daysCount + params['time']
	
	------------------------------------------------------------------
	--������� �������
	local taskName = sl_rt_register_task("sl_rt_make_upgrade", "", "TechnologyCompleted")
	------------------------------------------------------------------
	--����� �� ������� � ��������� �������
	sl_rt_add_task_param_string(taskName, "Upgrade", params['upgrade'])
	sl_rt_add_task_param_string(taskName, "Time", daysCount)
	
	------------------------------------------------------------------
	-- ������������ ������ � ������
	sl_rt_add_task_param_int(taskName, "PlusMoney", 50000/25*4)
	sl_rt_add_task_param_int(taskName, "PlusMorale", 10)
	sl_rt_add_task_param_int(taskName, "MinusMorale", 10)
	sl_rt_add_task_param_int(taskName, "MinusAllRes", 10)

	------------------------------------------------------------------
	-- ���������� ������ ���������� � ������� � ������� �� �� �����
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTMakeUpgrade", params['upgrade'], tostring(daysCount), "")
	------------------------------------------------------------------			

	log_message ("sl_rt_make_upgrade_create() end creating task")
	return 1
end


------------------------------------------------------------------
--������� ������ �������
function sl_rt_first_upgrade_create()
	log_message ("sl_rt_first_upgrade_create() begin creating task")
	
	--��������, ���� ����� ������� ��� ����, �� ����� �� �������
	if (sl_rt_count_tasks_with_this_function("sl_rt_make_upgrade") > 0) then
		return 0
	end

	local upgradeName = "J_DVS1"
	if (sl_get_my_player_id() == sl_usa_player:get_id()) then
		upgradeName = "U_DVS1"
	end
	
	--���� ��� ������ �����������, �� �������
	if (sl_is_available_technology(upgradeName) == false) then
		return 0
	end

	local daysCount = sl_get_days_to_make_technology(upgradeName)
	daysCount = daysCount + math.random(5,30)
	
	------------------------------------------------------------------
	--������� �������
	local taskName = sl_rt_register_task("sl_rt_make_upgrade", "", "TechnologyCompleted")
	------------------------------------------------------------------
	--����� �� ������� � ��������� �������
	sl_rt_add_task_param_string(taskName, "Upgrade", upgradeName)
	sl_rt_add_task_param_string(taskName, "Time", daysCount)
	
	------------------------------------------------------------------
	-- ������������ ������ � ������
	sl_rt_add_task_param_int(taskName, "PlusMoney", 100000/25*4)
	sl_rt_add_task_param_int(taskName, "PlusAllum", 3000)
	sl_rt_add_task_param_int(taskName, "PlusMorale", 10)
	sl_rt_add_task_param_int(taskName, "PlusAllRes", 10)
	sl_rt_add_task_param_int(taskName, "MinusMorale", 20)
	sl_rt_add_task_param_int(taskName, "MinusAllRes", 10)

	------------------------------------------------------------------
	-- ���������� ������ ���������� � ������� � ������� �� �� �����
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTMakeUpgradeFirst", upgradeName, tostring(daysCount), "")
	------------------------------------------------------------------			

	log_message ("sl_rt_first_upgrade_create() end creating task")
	return 1
end



------------------------------------------------------------------
--�������, ����� ������ ������ �������, �������� ������
function sl_rt_second_upgrade_create()
	log_message ("sl_rt_second_upgrade_create() begin creating task")

	-- �� ����� ����� ��� ������� ��� ������	
	if (sl_is_at_war_with_someone(sl_get_my_player_id() + 1)) then
		return 0
	end
	
	--��������, ���� ����� ������� ��� ����, �� ����� �� �������
	if (sl_rt_count_tasks_with_this_function("sl_rt_make_upgrade") > 0) then
		return 0
	end

	local firstUpgradeName = "J_DVS1"
	if (sl_get_my_player_id() == sl_usa_player:get_id()) then
		firstUpgradeName = "U_DVS1"
	end
	
	--���� ������ ��� �� ������, �� �������
	if (sl_is_developed(firstUpgradeName) == false) then
		return 0
	end

	local upgradeName = "J_Sonar"
	if (sl_get_my_player_id() == sl_usa_player:get_id()) then
		upgradeName = "U_Sonar"
	end
	
	--���� ��� ������ �����������, �� �������
	if (sl_is_available_technology(upgradeName) == false) then
		return 0
	end

	local daysCount = sl_get_days_to_make_technology(upgradeName)
	daysCount = daysCount + math.random(5,30)
	
	------------------------------------------------------------------
	--������� �������
	local taskName = sl_rt_register_task("sl_rt_make_upgrade", "", "TechnologyCompleted")
	------------------------------------------------------------------
	--����� �� ������� � ��������� �������
	sl_rt_add_task_param_string(taskName, "Upgrade", upgradeName)
	sl_rt_add_task_param_string(taskName, "Time", daysCount)
	
	------------------------------------------------------------------
	-- ������������ ������ � ������
	sl_rt_add_task_param_int(taskName, "PlusMoney", 50000/25*4)
	sl_rt_add_task_param_int(taskName, "PlusMorale", 10)
	sl_rt_add_task_param_int(taskName, "PlusIron", 100000)	
	sl_rt_add_task_param_int(taskName, "PlusAllRes", 10)
	sl_rt_add_task_param_int(taskName, "MinusMorale", 20)
	sl_rt_add_task_param_int(taskName, "MinusAllRes", 10)

	------------------------------------------------------------------
	-- ���������� ������ ���������� � ������� � ������� �� �� �����
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTMakeUpgradeSecond", upgradeName, tostring(daysCount), "")
	------------------------------------------------------------------			

	log_message ("sl_rt_second_upgrade_create() end creating task")
	return 1
end

------------------------------------------------------------------
--������� �������
------------------------------------------------------------------
function sl_rt_make_upgrade(taskName)
	--�������� ����� �� ���������
	if (sl_rt_get_task_last_time(taskName) < 0) then
		onTaskFailedFunc(taskName)
		return
	end	

	local upgradeName = sl_rt_get_task_param_string(taskName, "Upgrade")
	--�������� �� ����������
	if (sl_is_developed(upgradeName)) then
		onTaskCompleteFunc(taskName)
		return
	end	
end



------------------------------------------------------------------
--�������, ����� ������ ������ ������� ��� ������, ����������� ������� ��������� �������� � ��������
function sl_rt_units_with_sonar_create()
	if (sl_rt_task_about_sonars_showed()) then
		return 0
	end

	log_message ("sl_rt_units_with_sonar_create() begin creating task")
	

	--��������, ���� ����� ������� ��� ����, �� ����� �� �������
	if (sl_rt_count_tasks_with_this_function("sl_rt_units_with_sonar") > 0) then
		return 0
	end
	
	sl_rt_task_about_sonars_show()
		
	local upgradeName = "J_Sonar"
	if (sl_get_my_player_id() == sl_usa_player:get_id()) then
		upgradeName = "U_Sonar"
	end
	
	--���� �������� ������� ��� �� ������, �� �������
	if (sl_is_developed(upgradeName) == false) then
		return 0
	end

	local countWithSonar = sl_get_count_units_with_sonar()
	--�������� �� 10 ����. ���� ��� ���� ���, �� �� ������ ������ �������
	if (countWithSonar > 9) then
		return 0
	end

	local daysCount = 250
	daysCount = daysCount + math.random(15, 45)
	
	------------------------------------------------------------------
	--������� �������
	local taskName = sl_rt_register_task("sl_rt_units_with_sonar", "", "UniversalTask")
	------------------------------------------------------------------
	--����� �� ������� � ��������� �������
	sl_rt_add_task_param_string(taskName, "Time", daysCount)
	
	------------------------------------------------------------------
	-- ������������ ������ � ������
	sl_rt_add_task_param_int(taskName, "PlusMoney", 50000/25*4)
	sl_rt_add_task_param_int(taskName, "PlusMorale", 10)
	sl_rt_add_task_param_int(taskName, "MinusMorale", 10)
	sl_rt_add_task_param_int(taskName, "MinusAllRes", 5)
	sl_rt_add_task_param_int(taskName, "PlusAllRes", 5)

	------------------------------------------------------------------
	-- ���������� ������ ���������� � ������� � ������� �� �� �����
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTMakeUnitsWithSonar", tostring(daysCount), "", "")
	------------------------------------------------------------------			

	log_message ("sl_rt_units_with_sonar_create() end creating task")
	return 1
end


function sl_rt_units_with_sonar(taskName)
	--�������� ����� �� ���������
	if (sl_rt_get_task_last_time(taskName) < 0) then
		onTaskFailedFunc(taskName)
		return
	end	

	local countWithSonar = sl_get_count_units_with_sonar()
	--�������� �� 10 ����
	if (countWithSonar > 9) then
		onTaskCompleteFunc(taskName)
		return
	end	
end



-------------------------------------------------------------
-- ��������� �������� �� ����. ����, �������� � ����� ���������� ��������� �������.
-- �� ����� ���� ����� 3-� ����� �������. ������ ���� �����
-------------------------------------------------------------
function sl_rt_destroy_building_create()
	log_message ("sl_rt_destroy_building_create() begin creating task")

	--��������, ���� ����� ������� ��� ����, �� ����� �� �������
	if (sl_rt_count_tasks_with_this_function("sl_rt_destroy_building") > 2) then
		return 0
	end
	
	--������� ��������� �������
	local params = sl_rt_get_params_for_destroy_building()	
	if (params['have']==false) then
		return 0
	end
		
	local baseName = params['base']
	local buildingName = params['building']
	local timeToComplete = params['time']
	local base = get_base(baseName)
	
	------------------------------------------------------------------
	--������� �������
	local taskName = sl_rt_register_task("sl_rt_destroy_building", "", "DestroyBuilding")
	------------------------------------------------------------------
	--����� �� ������� � ��������� �������
	sl_rt_add_task_param_string(taskName, "Base", baseName)
	local daysCount = timeToComplete
	sl_rt_add_task_param_string(taskName, "Time", daysCount)	
	sl_rt_add_task_param_string(taskName, "Building", buildingName)	
	local buildingCount = base:get_building_count(buildingName)
	--������� ������ ���� ����� ��������
	sl_rt_add_task_param_int(taskName, "BuildingCount", buildingCount)
	
	------------------------------------------------------------------
	-- ������������ ������ � ������
	-- +5000 �����
	sl_rt_add_task_param_int(taskName, "PlusMoney", 5000/25*4)
	-- -5000 �����
	sl_rt_add_task_param_int(taskName, "MinusMoney", 5000/25*4)
	------------------------------------------------------------------
	-- ������� ������� �� ����
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
	-- ���������� ������ ���������� � ������� � ������� �� �� �����
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTDestroyBuilding", baseName, buildingName, tostring(daysCount))
	------------------------------------------------------------------		
	log_message ("sl_rt_destroy_building_create() end creating task")
	return 1
end


------------------------------------------------------------------		
function sl_rt_destroy_building(taskName)
	--�������� ����� �� ���������
	if (sl_rt_get_task_last_time(taskName) < 0) then
		onTaskFailedFunc(taskName)
		return
	end	
	
	--�������� �� ������ ����
	local baseName = sl_rt_get_task_param_string(taskName, "Base")
	local base = get_base(baseName)
	if (base:get_player_id() == sl_get_my_player_id()) then
		onTaskCompleteFunc(taskName)
		return
	end
	
	--�������� �� ����������
	--������� ������ ���� ����� ��������
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
-- ������� �� ������ ����� ��� �������. �������� 1 ��� � ������������ �����.
-- ��� ������������ ������� �����, �� � ����������, ��������
-------------------------------------------------------------
function sl_rt_jap_begin_war_create()
	log_message ("sl_rt_jap_begin_war_create() begin creating task")

	--��������, ���� ����� ������� ��� ����, �� ����� �� �������
	if (sl_rt_count_tasks_with_this_function("sl_rt_jap_begin_war") > 0) then
		return 0
	end
	
	--�������� �����
	--���� ������� �� ������ 1941 ����
	if (sl_get_year() < 1941) then
		return 0
	end
	
	--���� ������� �� ������ �������
	if (sl_get_month() <= 9) then
		return 0
	end	
	

	------------------------------------------------------------------
	--������� �������
	local taskName = sl_rt_register_task("sl_rt_jap_begin_war", "", "FoundEnemy")
	
	------------------------------------------------------------------
	-- ������� �� ����� ����
	local daysCount = 60

	if sl_get_game_type() ~= "arcade" then
		-- ������� �.�. ��������� �� ����� ����, ����� ���������
		daysCount = math.ceil((12-sl_get_month())*30.5) + 31 - sl_get_day() + 1
	else
		------------------------------------------------------------------
		-- ������������ ������ � ������
		-- ������ ������������ �� ����� �������
		sl_rt_add_task_param_int(taskName, "MinusMorale", 50)
		sl_rt_add_task_param_int(taskName, "MinusAllRes", 50)
	end

	------------------------------------------------------------------
	-- ���������� ������ ���������� � ������� � ������� �� �� �����
	sl_rt_add_task_desc(taskName, daysCount, "IDS_MSG_RTJapanBeginWar", tostring(daysCount), "", "")
	------------------------------------------------------------------		
	log_message ("sl_rt_jap_begin_war_create() end creating task")
	return 1
end


------------------------------------------------------------------		
function sl_rt_jap_begin_war(taskName)
	--�������� ����� �� ���������
	if (sl_rt_get_task_last_time(taskName) < 0) then
		onTaskFailedFunc(taskName)
		return
	end
	
	-- ���� �������� �����, �� ������� ���������
	if (sl_is_at_war(Japan, USA)) then
		onTaskCompleteFunc(taskName)
	end
end

-------------------------------------------------------------
-- ������� ���������� ������� ���� ��������������� ����, �.�.
-- ���������� ��� �������������� ����
-------------------------------------------------------------
function sl_rt_reinforce_base_create()
	log_message ("sl_rt_reinforce_base_create() begin creating task")

	--��������� �����
	local isAtWar = sl_is_at_war_with_someone(sl_get_my_player_id() + 1)

	--� ������ ����� 3 ������� ������������ ����� ����������
	local maxTasks = 3
	if (isAtWar) then
		maxTasks = 5
	end
	--��������, ���� ����� ������� ��� �����, �� ����� �� ������
	if (sl_rt_count_tasks_with_this_function("sl_rt_reinforce_base") >= maxTasks) then
		return 0
	end

	--������� ��������� �������
	local minShipsCount = 2
	local minAirplanesCount = 6
	local daysCount = math.random(15,30)
	local waitingTime = 30
	local money = 4000
	local morale = 5

	--�� ����� ����� � ����� ���� ������ � ������� �� ���������� ������
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
	--������� �������
	local taskName = sl_rt_register_task("sl_rt_reinforce_base", "", "UniversalTask")
	------------------------------------------------------------------
	--����� �� ������� � ��������� �������
	sl_rt_add_task_param_string(taskName, "Base", baseName)
	sl_rt_add_task_param_string(taskName, "Time", daysCount)	--string???

	------------------------------------------------------------------
	-- ������������ ������ � ������
	sl_rt_add_task_param_int(taskName, "PlusMoney", money)
	sl_rt_add_task_param_int(taskName, "PlusMorale", morale)
	sl_rt_add_task_param_int(taskName, "MinusMorale", morale)
	sl_rt_add_task_param_int(taskName, "MinusMoney", 2 * money)
	------------------------------------------------------------------
	--�������� ���-�� ����������, ����� �� ������� ������� ��� ���� ��� ���������
	sl_rt_add_task_param_int(taskName, "AirportsCount", baseAirportsCount)
	sl_rt_add_task_param_int(taskName, "MinShipsCount", minShipsCount)
	sl_rt_add_task_param_int(taskName, "MinAirplanesCount", minAirplanesCount)
	sl_rt_add_task_param_int(taskName, "IsWaiting", 0)
	sl_rt_add_task_param_int(taskName, "WaitingTime", waitingTime)
	------------------------------------------------------------------
	-- ������� ������� �� ����
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
	-- ���������� ������ ���������� � ������� � ������� �� �� �����
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
	--�������� ����� �� ���������
	local lastTime = sl_rt_get_task_last_time(taskName)
	if (lastTime < 0) then
		onTaskFailedFunc(taskName)
		return
	end
	
	--���� ��������� ���� ����, �� ���� ��� �� � ��������, �� ��� ������
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

	--�������� �� ����������
	if (isWaiting == 0) then
		if (base:get_ships_count() >= minShipsCount or base:get_airplanes_count() >= minAirplanesCount) then
			sl_rt_add_task_param_int(taskName, "IsWaiting", 1)

			--����� �������� �� waitingTime
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



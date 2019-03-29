-------------------------------------------------------------
-- File with random tasks for strateg level
-------------------------------------------------------------

log_message ("sl_random_tasksEng.lua parsing begin")

-------------------------------------------------------------
-------------------------------------------------------------
-------------------------------------------------------------
--������� �������, ������ �� ��������� � �������� �������, ������� ���� ���� �� ��������
function sl_eng_watch_for_new_random_task()
	--return
	--� ��������� ������� ��� �������
	if (sl_is_training_mission()) then
		return
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
	
	local isAtWar = sl_is_at_war_with_someone(sl_get_my_player_id() + 1)

	--������ ����
	if (isAtWar and randNum < oneTimePerMonth/2.0) then
		if (sl_rt_capture_base_create()==1) then
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

	--������ �� ��������� �������
	if (randNum < oneTimePerMonth*2) then
		if (sl_rt_make_upgrade_create()==1) then
			return
		end
	end

	randNum = math.random()
	
	--���� ���� ��������� ����, �� ������ ������ ��
	--� �������������� ����
	local timeToCreateBase = oneTimePerMonth
	if (sl_get_game_type() == "arcade") then
		timeToCreateBase = oneTimePerWeek
	end
	
	if (randNum < timeToCreateBase*5) then
		if (sl_rt_make_base_create()==1) then
			return
		end
	end	
	
	randNum = math.random()
	
	--���� ���� �����, �� ������ ������ ��������� ��������� ������
	if (isAtWar and randNum < oneTimePerWeek) then
		if (sl_rt_destroy_building_create()==1) then
			return
		end
	end	
	
	randNum = math.random()
	
	--������ ������� ����� ������ � ��� ����������� �����
	if (isAtWar and randNum < oneTimePerWeek*3) then
		if (sl_rt_make_building_on_base_create()==1) then
			return
		end
	end		

	if (not(isAtWar) and randNum < oneTimePerWeek) then
		if (sl_rt_make_building_on_base_create()==1) then
			return
		end
	end		
	
end
-------------------------------------------------------------
-------------------------------------------------------------
-------------------------------------------------------------



log_message ("sl_random_tasksEng.lua parsing end")

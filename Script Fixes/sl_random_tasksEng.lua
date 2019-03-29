-------------------------------------------------------------
-- File with random tasks for strateg level
-------------------------------------------------------------

log_message ("sl_random_tasksEng.lua parsing begin")

-------------------------------------------------------------
-------------------------------------------------------------
-------------------------------------------------------------
--главная функция, следит за рандомами и вызывает функции, которые надо было бы породить
function sl_eng_watch_for_new_random_task()
	--return
	--в обучающих миссиях нет заданий
	if (sl_is_training_mission()) then
		return
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
	
	local isAtWar = sl_is_at_war_with_someone(sl_get_my_player_id() + 1)

	--захват базы
	if (isAtWar and randNum < oneTimePerMonth/2.0) then
		if (sl_rt_capture_base_create()==1) then
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

	--запрос на случайный апгрейд
	if (randNum < oneTimePerMonth*2) then
		if (sl_rt_make_upgrade_create()==1) then
			return
		end
	end

	randNum = math.random()
	
	--если есть незанятые базы, то просим занять их
	--в неисторической чаще
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
	
	--если идет война, то просим иногда разрушать вражеские здания
	if (isAtWar and randNum < oneTimePerWeek) then
		if (sl_rt_destroy_building_create()==1) then
			return
		end
	end	
	
	randNum = math.random()
	
	--просим строить новые здания в уже захваченных зонах
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

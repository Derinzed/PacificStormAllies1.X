log_message ("sl_init.lua ")


require ("res://slgui.lua")
require ("res://sl_player_ai.lua")
require ("res://sl_tests.lua")
require ("res://sl_random_tasks.lua")
require ("res://sl_random_tasksUSA.lua")
require ("res://sl_random_tasksEng.lua")
require ("res://sl_decoration.lua")
require ("res://sl_usa_scripts.lua")
require ("res://sl_japan_scripts.lua")
require ("res://sl_england_scripts.lua")
--require ("res://TestSLMessages.lua")

log_message ("Executing SL init script slinit.lua")

Neutral = 0
USA = 1
Japan = 2
England = 3
Holland = 4
Germany = 5
USSR = 6

sl_main_messager_maximize_btn();


function sl_create_game(my_player)

	--TestSLMessages()

	-- Создаем игроков --
	sl_usa_player = sl_create_player("USA", true)
	sl_japan_player = sl_create_player("Japan", true)
	sl_england_player = sl_create_player("England", true)
	
	-- Неиграбельные нации
	sl_holland_player = sl_create_player("Holland", false)
	sl_germany_player = sl_create_player("Germany", false)
	sl_ussr_player = sl_create_player("USSR", false)
	
	sl_set_my_player(my_player)
	
	-- FOR DEBUG
	--sl_japan_player:ai_disable()	

	-- Назначаем главнокомандующих --
	sl_usa_player:appoint_general_commander("Kimmel");
	sl_japan_player:appoint_general_commander("Yamamoto");
	sl_england_player:appoint_general_commander("Layton");


	-- Устанавливаем условия поражения --
	sl_usa_player:set_defeat_condition("sl_usa_condition_of_defeat");
	sl_japan_player:set_defeat_condition("sl_japan_condition_of_defeat");
	sl_england_player:set_defeat_condition("sl_england_condition_of_defeat");
	sl_germany_player:set_defeat_condition("sl_no_defeat_condition");
	sl_ussr_player:set_defeat_condition("sl_no_defeat_condition");
	sl_holland_player:set_defeat_condition("sl_no_defeat_condition");

	-- Назаначаем игровые сценарии игрокам --
	sl_usa_player:set_game_script("sl_usa_game_script")
	sl_japan_player:set_game_script("sl_japan_game_script")
	sl_england_player:set_game_script("sl_england_game_script")
	sl_germany_player:set_game_script("sl_germany_game_script");
	sl_ussr_player:set_game_script("sl_ussr_game_script");
	sl_holland_player:set_game_script("sl_holland_game_script");

	sl_set_light_direction(-1.0, -2.0, -1.0)
	sl_set_light_specular(0, 0, 0)

	sl_usa_player:set_colour_diffuse(0.6, 0.7, 0.9)
	sl_usa_player:set_colour_ambient(0.7, 1.1, 1.8)
	
	sl_japan_player:set_colour_diffuse(1.3, 0.8, 0.5)
	sl_japan_player:set_colour_ambient(0.6, 0.5, 0.4)
	
	sl_england_player:set_colour_diffuse(0.5, 0.9, 0.5)
	sl_england_player:set_colour_ambient(0.5, 0.7, 0.5)
	
	sl_holland_player:set_colour_diffuse(1.5, 0.6, 0.6)
	sl_holland_player:set_colour_ambient(0.7, 0.6, 0.6)
	
	sl_ussr_player:set_colour_diffuse(1.5, 0.1, 0.1)
	sl_ussr_player:set_colour_ambient(1.0, 0.2, 0.1)
	
	sl_germany_player:set_colour_diffuse(0.7, 0.1, 0.7)
	sl_germany_player:set_colour_ambient(0.7, 0.3, 0.7)
	
	sl_main_timescalebtn1()
	sl_main_pausebtn()

	on_pausebtn_click = ''
	on_timescalebtn1_click = ''
	on_timescalebtn2_click = ''
	on_timescalebtn3_click = ''
	on_timescalebtn4_click = ''
	on_main_metropoly_page = ''
	on_main_messager_maximize_click = ''
	on_metropoly_close_click = ''
	on_metropoly_resources_click = ''
	on_metropoly_forces_click = ''
	on_metropoly_production_click = ''
	on_metropoly_technology_click = ''
	on_metropoly_technology_buy_click = ''
	on_objects_editor_click = ''
	on_make_formation_popup = ''
	on_menuitem_patrol = ''
	on_menuitem_zone_capture = ''
	on_battle_auto_btn = ''
	on_battle_end_close_btn = ''
	set_light_gui_element("sl_main_messager_maximize_btn",false)
	set_light_gui_element("SL/Metropoly/MainPanel/Flag",false)
	set_light_gui_element("SL/Metropoly/Resources/TableCaption",false)
	set_light_gui_element("sl_metropoly_forces_btn",false)
	set_light_gui_element("sl_metropoly_production_btn",false)
	set_light_gui_element("SL/OE/ChBox_BigGun",false)
	set_light_gui_element("SL/OE/ChBox_Aiming",false)
	set_light_gui_element("sl_metropoly_technology_btn",false)
	set_light_gui_element("sl_main_pausebtn",false)
	set_light_gui_element("sl_main_timescalebtn1",false)
	set_light_gui_element("sl_main_timescalebtn2",false)
	set_light_gui_element("sl_main_timescalebtn3",false)
	set_light_gui_element("sl_main_timescalebtn4",false)
	set_light_gui_element("sl_base_formations_btn",false)
	
	set_light_gui_element("sl_main_statistic_btn", false)
	set_light_gui_element("sl_main_diplomacy_btn", false)
	set_light_gui_element("sl_main_menu_btn", false)
	set_light_gui_element("sl_main_options_btn", false)
	set_light_gui_element("sl_main_homeland_btn",false)
	set_light_gui_element("sl_base_formations_btn",false)
	set_light_gui_element("sl_base_close_btn", false)
	set_light_gui_element("sl_metropoly_close_btn", false)
	set_light_gui_element("sl_base_materials_btn", false)
	set_light_gui_element("sl_base_people_btn", false)
	set_light_gui_element("sl_base_building_btn", false)
	set_light_gui_element("sl_base_info_btn", false)
	set_light_gui_element("sl_base_tactic_btn", false)
	set_light_gui_element("sl_base_options_btn", false)
	set_light_gui_element("sl_base_homeland_btn", false)
	set_light_gui_element("sl_metropoly_resources_btn", false)
	
	set_light_gui_element("SL/Base/Formations",false)
	set_light_gui_element("SL/Base/Formations/Units",false)
	set_light_gui_element("SL/Base/Formations/Units/Ships",false)
	set_light_gui_element("SL/Base/Formations/Units/Airplanes",false)
	set_light_gui_element("SL/Base/Formations/Units/All",false)
	set_light_gui_element("SL/Base/Formations/FormTypes",false)
	set_light_gui_element("SL/Base/Formations/FormTypes/Battalion",false)
	set_light_gui_element("SL/Base/Formations/FormTypes/Division",false) 
	set_light_gui_element("SL/Base/Formations/FormTypes/Fleet",false)
	set_light_gui_element("SL/Base/Formations/FormTypes/Squadron",false) 
	set_light_gui_element("SL/Base/Formations/FormTypes/Regiment",false) 
	set_light_gui_element("SL/Base/Formations/FormTypes/Corps",false)
	set_light_gui_element("SL/Base/Formations/FormTypes/All",false)
	
	set_light_gui_element("SL/Base/Store/Orders/MakeBtn",false)
	set_light_gui_element("SL/Base/Formations/FormBtn",false)
	--set_light_gui_element("sl_cargo_order_apply_btn",false)
	set_light_gui_element("sl_main_messager_maximize_btn",false)
	set_light_gui_element("SL/Base/Formations",false)

	set_script_func ('')
	set_script_func_mouse ('')
	
	set_light_gui_element("SL/Base/Store/Orders/MakeBtn",false)
	--set_light_gui_element("sl_cargo_order_apply_btn",false)
	--sl_set_func_on_action_cargo_order('sl_cargo_order_apply_btn','')
	sl_set_lua_func_on_click('FormationEscort', '')
	
	interface = get_base_gui_interface()
	interface:set_active_page("Formations")
	page = get_gui_page(metropoly_page)
	page:set_active_page("Resources")
	get_gui_page(editor_page):enable_all_slots()

	-- DEBUG
	--if (sl_get_my_player_id() == sl_japan_player:get_id()) then
	--	sl_jap_watch_for_new_random_task()
	--end
	--если играем за них, то вызовем обработчик случайных заданий
	--if (sl_get_my_player_id() == sl_usa_player:get_id()) then
	--	sl_usa_watch_for_new_random_task()		
	--end
	--END DEBUG
	
	sl_set_fuel_percent(1)
	
	--сразу зарегистрируем задание о создании апгрейда на самолеты
	if (sl_is_training_mission()==false) then
		sl_rt_first_upgrade_create()
	end
end


-- для текущей базы отобразит интерфейс на вкладке intName
function sl_show_base_interface(intName)
	local inter = get_base_gui_interface()
	inter:set_active_page(intName)
end

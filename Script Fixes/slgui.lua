--require("res://trainstrateg.lua")

log_message("slgui.lua")


main_page = "SL/MainPanel"
base_page = "SL/BaseControlGUI"
metropoly_page = "SL/Metropoly"
current_page = main_page
editor_page = "SL/ObjectsEditor"

invalid_formation_id = -1
invalid_base_id = -1
invalid_player_id = 255


----------------------------------------------------------
-- Time control --
----------------------------------------------------------
pause = 0 min = 1 ten_min = 2 hour = 3 day = 4

on_pausebtn_click = ''
function sl_main_pausebtn()
	if sl_get_time_scale() == pause then
		sl_set_button_press_state("sl_main_pausebtn", false)
	else
		sl_set_button_press_state("sl_main_pausebtn", true)
	end
	sl_set_time_scale(pause)
	if(on_pausebtn_click~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_pausebtn_click)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

on_timescalebtn1_click = ''
function sl_main_timescalebtn1()
	sl_set_time_scale(min)
	sl_set_button_press_state("sl_main_pausebtn", false)
	sl_set_button_press_state("sl_main_timescalebtn1", true)
	sl_set_button_press_state("sl_main_timescalebtn2", false)
	sl_set_button_press_state("sl_main_timescalebtn3", false)
	sl_set_button_press_state("sl_main_timescalebtn4", false)
	if(on_timescalebtn1_click~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_timescalebtn1_click)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end
on_timescalebtn2_click = ''
function sl_main_timescalebtn2()
	sl_set_time_scale(ten_min)
	sl_set_button_press_state("sl_main_pausebtn", false)
	sl_set_button_press_state("sl_main_timescalebtn1", false)
	sl_set_button_press_state("sl_main_timescalebtn2", true)
	sl_set_button_press_state("sl_main_timescalebtn3", false)
	sl_set_button_press_state("sl_main_timescalebtn4", false)
	if(on_timescalebtn2_click~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_timescalebtn2_click)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end
on_timescalebtn3_click = ''
function sl_main_timescalebtn3()
	sl_set_time_scale(hour)
	sl_set_button_press_state("sl_main_pausebtn", false)
	sl_set_button_press_state("sl_main_timescalebtn1", false)
	sl_set_button_press_state("sl_main_timescalebtn2", false)
	sl_set_button_press_state("sl_main_timescalebtn3", true)
	sl_set_button_press_state("sl_main_timescalebtn4", false)
	if(on_timescalebtn3_click~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_timescalebtn3_click)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end
on_timescalebtn4_click = ''
function sl_main_timescalebtn4()
	sl_set_time_scale(day)
	sl_set_button_press_state("sl_main_pausebtn", false)
	sl_set_button_press_state("sl_main_timescalebtn1", false)
	sl_set_button_press_state("sl_main_timescalebtn2", false)
	sl_set_button_press_state("sl_main_timescalebtn3", false)
	sl_set_button_press_state("sl_main_timescalebtn4", true)
	if(on_timescalebtn4_click~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_timescalebtn4_click)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

function sl_set_pause()
	if sl_get_time_scale() ~= pause then
		sl_main_pausebtn()
	end
end

----------------------------------------------------------
-- Main control panel --
----------------------------------------------------------
on_main_metropoly_page = ''
function sl_main_homeland_btn()
	hide_overlay(current_page)
	current_page = metropoly_page
	page = get_gui_page(metropoly_page)
	page:show()
	-- hide zone info overlay
	hide_overlay("SL/ZoneInfoOverlay")
	if(on_main_metropoly_page~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_main_metropoly_page)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

function sl_main_menu_btn()
	sl_show_game_menu()
end

sl_is_messager_maximize = false

-- когда на кнопку нажали --
on_main_messager_maximize_click = ''
function sl_main_messager_maximize_btn()
	if (sl_is_visible_statistic_gui()) then
		return
	end
	if sl_is_messager_maximize then
		sl_play_sound("HideHistoryLog", false)
		sl_is_messager_maximize = false
		ge_get ("SL/Main/CommonPanel"):set_material ("SL/MainPageGui/Panel_minimize")
		ge_get ("SL/Main/CommonPanel"):set_height (101)
		ge_get ("SL/Main/CommonPanel"):set_top (-101)
		ge_get ("SL/Main/MessageList"):hide ()
		ge_get ("sl_main_messager_maximize_btn"):set ("button_up_material", "SL/MainPageGui/MaximizeBtnUp")
		ge_get ("sl_main_messager_maximize_btn"):set ("button_down_material", "SL/MainPageGui/MaximizeBtnDown")
	else
		sl_play_sound("ShowHistoryLog", false)
		sl_is_messager_maximize = true
		ge_get ("SL/Main/CommonPanel"):set_material ("SL/MainPageGui/Panel_maximize")
		ge_get ("SL/Main/CommonPanel"):set_height (242)
		ge_get ("SL/Main/CommonPanel"):set_top (-242)
		ge_get ("SL/Main/MessageList"):show ()
		ge_get ("sl_main_messager_maximize_btn"):set ("button_up_material", "SL/MainPageGui/MinimizeBtnUp")
		ge_get ("sl_main_messager_maximize_btn"):set ("button_down_material", "SL/MainPageGui/MinimizeBtnDown")
	end
	if(on_main_messager_maximize_click~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_main_messager_maximize_click)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

----------------------------------------------------------
-- Resource market --
----------------------------------------------------------
--function sl_main_resourcemarket_btn()
--	sl_resourcemarket_show(sl_get_my_player_id())
--end

function sl_main_diplomacy_btn()
	--local pl = sl_get_my_player_id() + 1
	--if (pl > 2) then
	--	pl = 0
	--end
	sl_play_sound("ShowDiplomacyWindow", false)
	sl_main_diplomacy_show(sl_get_my_player_id(), invalid_player_id) --pl)
end

----------------------------------------------------------
-- Show statistic --
----------------------------------------------------------

sl_is_messager_maximize_old = false

function sl_main_statistic_btn()

	--показываем окно
	if (not sl_is_visible_statistic_gui()) then

		sl_is_messager_maximize_old = sl_is_messager_maximize
		if sl_is_messager_maximize then
			sl_main_messager_maximize_btn()
		end

		sl_toggleshow_statistic_gui()
	--скрываем окно		
	else

		sl_toggleshow_statistic_gui()

		if sl_is_messager_maximize_old then
			sl_main_messager_maximize_btn()
		end
	end
end

----------------------------------------------------------
-- Metropoly --
----------------------------------------------------------
on_metropoly_close_click = ''
function sl_metropoly_close_btn()
	page = get_gui_page(metropoly_page)
	page:hide()
	current_page = main_page
	show_overlay(current_page,false)

--	if sl_get_time_scale() == pause then
--		sl_main_pausebtn()
--	end

	if(on_metropoly_close_click~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_metropoly_close_click)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

function sl_metropoly_help_btn()
	page = get_gui_page(metropoly_page)
	page:show_help()
end

on_metropoly_resources_click = ''
function sl_metropoly_resources_btn()
	page = get_gui_page(metropoly_page)
	page:set_active_page("Resources")
	page:update_auto_show_help()
	sl_set_button_press_state("sl_metropoly_resources_btn", true)
	sl_set_button_press_state("sl_metropoly_forces_btn", false)
	sl_set_button_press_state("sl_metropoly_production_btn", false)
	sl_set_button_press_state("sl_metropoly_technology_btn", false)
	if(on_metropoly_resources_click~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_metropoly_resources_click)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

on_metropoly_forces_click = ''
function sl_metropoly_forces_btn()
	page = get_gui_page(metropoly_page)
	page:set_active_page("Forces")
	page:update_auto_show_help()
	sl_set_button_press_state("sl_metropoly_resources_btn", false)
	sl_set_button_press_state("sl_metropoly_forces_btn", true)
	sl_set_button_press_state("sl_metropoly_production_btn", false)
	sl_set_button_press_state("sl_metropoly_technology_btn", false)
	if(on_metropoly_forces_click~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_metropoly_forces_click)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

on_metropoly_production_click = ''
function sl_metropoly_production_btn()
	page = get_gui_page(metropoly_page)
	page:set_active_page("Production")
	page:update_auto_show_help()
	sl_set_button_press_state("sl_metropoly_resources_btn", false)
	sl_set_button_press_state("sl_metropoly_forces_btn", false)
	sl_set_button_press_state("sl_metropoly_production_btn", true)
	sl_set_button_press_state("sl_metropoly_technology_btn", false)
	if(on_metropoly_production_click~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_metropoly_production_click)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

on_metropoly_technology_click = ''
function sl_metropoly_technology_btn()
	page = get_gui_page(metropoly_page)
	page:set_active_page("Technology")
	page:update_auto_show_help()
	sl_set_button_press_state("sl_metropoly_resources_btn", false)
	sl_set_button_press_state("sl_metropoly_forces_btn", false)
	sl_set_button_press_state("sl_metropoly_production_btn", false)
	sl_set_button_press_state("sl_metropoly_technology_btn", true)
	if(on_metropoly_technology_click~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_metropoly_technology_click)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

on_metropoly_technology_buy_click = ''
function sl_metropoly_technology_buy_btn()
	sl_open_tech_buy_interface();
	if(on_metropoly_technology_buy_click~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_metropoly_technology_buy_click)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

on_objects_editor_click = ''
function sl_objects_editor_btn(full_prod_name)
	if sl_get_time_scale() ~= pause then
		sl_main_pausebtn()
	end
--	hide_overlay(current_page)
--	current_page = editor_page
	page = get_gui_page(editor_page)
	page:show(full_prod_name)
	if(on_objects_editor_click~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_objects_editor_click)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

function sl_go_to_editor_form_change_mod(full_prod_name)
	get_gui_page(editor_page):show(full_prod_name)
end


----------------------------------------------------------
-- Objects Editor --
----------------------------------------------------------
function sl_objects_editor_close_btn()
	--sl_main_homeland_btn()
	--sl_metropoly_production_btn()
	get_gui_page(editor_page):hide()
end

function sl_objects_editor_help_btn()
	get_gui_page(metropoly_page):show_help()
end


function make_mod_list_popup(menu, filter)
	if string.sub(filter, 1, 1) == "1" then
		add_item_to_popup_menu(menu, "sl_menuitem_copy_mod", "IDS_OE_Copy", "", "IDS_HINT_OE_COPY_MOD", true);
	else
		add_item_to_popup_menu(menu, "sl_menuitem_copy_mod", "IDS_OE_Copy", "", "IDS_HINT_OE_COPY_MOD", false);
	end
	if string.sub(filter, 2, 2) == "1" then
		add_item_to_popup_menu(menu, "sl_menuitem_delete_mod", "IDS_OE_Delete", "", "IDS_HINT_OE_DELETE_MOD", true);
	else
		add_item_to_popup_menu(menu, "sl_menuitem_delete_mod", "IDS_OE_Delete", "", "IDS_HINT_OE_DELETE_MOD", false);
	end
	if string.sub(filter, 3, 3) == "1" then
		add_item_to_popup_menu(menu, "sl_menuitem_rename_mod", "IDS_OE_Rename", "", "IDS_HINT_OE_RENAME_MOD", true);
	else
		add_item_to_popup_menu(menu, "sl_menuitem_rename_mod", "IDS_OE_Rename", "", "IDS_HINT_OE_RENAME_MOD", false);
	end
end

function make_debug_mod_list_popup(menu, filter)
	make_mod_list_popup(menu, filter)
	add_item_to_popup_menu(menu, "sl_menuitem_reset_mod", "Reset", "", "IDS_HINT_RESET_MOD", true);
	add_item_to_popup_menu(menu, "sl_menuitem_reset_and_auto_assign_mod", "Reset&AutoAssign", "", "IDS_HINT_RESETAUTOASSIGN_MOD", true);
	add_item_to_popup_menu(menu, "sl_menuitem_inner_rename_mod", "Inner rename", "", "IDS_HINT_RENAME_MOD", true);
end

function sl_menuitem_copy_mod()
	sl_play_sound("SLMenuitemCopy", false) 
	get_gui_page(editor_page):copy_modification()
end

function sl_menuitem_delete_mod()
	sl_play_sound("SLMenuitemDelete", false) 
	get_gui_page(editor_page):delete_modification()
end

function sl_menuitem_rename_mod()
	sl_play_sound("SLMenuitemRename", false) 
	get_gui_page(editor_page):rename_modification()
end

function sl_menuitem_inner_rename_mod()
	
	get_gui_page(editor_page):inner_rename()
end

function sl_menuitem_reset_and_auto_assign_mod()
	get_gui_page(editor_page):reset_and_auto_assign_prototype()
end

function sl_menuitem_reset_mod()
	get_gui_page(editor_page):reset_prototype()
end


----------------------------------------------------------
-- Popup menu creation --
----------------------------------------------------------
on_make_formation_popup = ''
function make_formation_popup(menu, filter)

	sl_play_sound("MakeFormationPopup", false)
	add_item_to_popup_menu(menu, "sl_menuitem_show_transport_route_gui", "IDS_SetTransportRoute", "", "IDS_HINT_SETTRANSPORTROUTE", (string.sub(filter, 13, 13) == "1"));

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_stop_launching_missiles_from_formation",
		"IDS_StopLaunchingMissiles",
		"",
		"IDS_HINT_STOP_LAUNCHNG_MISSILES",
		string.sub(filter, 1, 1) == "1"
	)

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_launch_missile_from_formation",
		"IDS_LaunchMissile",
		"",
		"IDS_HINT_LAUNCH_MISSILE",
		string.sub(filter, 2, 2) == "1"
	)

	add_item_to_popup_menu(
		menu, 
		"sl_menuitem_stop_formation", 
		"IDS_Stop", 
		"", 
		"IDS_HINT_STOP", 
		(string.sub(filter, 3, 3) == "1")
	);
	
	add_item_to_popup_menu(
		menu, 
		"sl_menuitem_patrol", 
		"Patrol", 
		"", 
		"IDS_HINT_PATROL", 
		(string.sub(filter, 4, 4) == "1")
	);
	
	add_item_to_popup_menu(
		menu, 
		"sl_menuitem_go_to_base", 
		"GoToBase", 
		"", 
		"IDS_HINT_GOTOBASE", 
		(string.sub(filter, 5, 5) == "1")
	);
	
	add_item_to_popup_menu(
		menu, 
		"sl_menuitem_escort", 
		"Escort", 
		"", 
		"IDS_HINT_ESCORT", 
		(string.sub(filter, 6, 6) == "1")
	);
	
	add_item_to_popup_menu(
		menu, 
		"sl_menuitem_zone_capture", 
		"ZoneCapture", 
		"", 
		"IDS_HINT_ZONECAPTURE", 
		(string.sub(filter, 7, 7) == "1")
	);
	
	add_item_to_popup_menu(
		menu, 
		"sl_menuitem_show_form_info", 
		"IDS_ShowFormInfo", 
		"", 
		"IDS_HINT_SHOWFORMINFO", 
		(string.sub(filter, 8, 8) == "1")
	);
	
	add_item_to_popup_menu(
		menu, 
		"sl_menuitem_air_attack", 
		"IDS_FormationAirAttack", 
		"", 
		"IDS_HINT_FORMATION_AIR_ATTACK", 
		(string.sub(filter, 9, 9) == "1")
	);
	
	if (string.sub(filter, 14, 14) == "1") then
		add_item_to_popup_menu(
			menu, 
			"sl_menuitem_cancel_report_go_to_base", 
			"IDS_CancelReportGoToBase", 
			"", 
			"IDS_HINT_CANCEL_REPORT_GO_TO_BASE", 
			true
		);
	else 
		add_item_to_popup_menu(
			menu, 
			"sl_menuitem_go_to_base_and_report", 
			"IDS_GoToBaseAndReport", 
			"", 
			"IDS_HINT_GOTOBASE_AND_REPORT", 
			(string.sub(filter, 10, 10) == "1")
		);
	end

	--add_item_to_popup_menu(menu, "sl_menuitem_attack", "Attack", "", "IDS_HINT_ATTACK", true);
	--add_item_to_popup_menu(menu, "sl_menuitem_interception", "Interception", "", "IDS_HINT_INTERCEPTION", true);
	--add_item_to_popup_menu(menu, "sl_menuitem_reconnaissance", "Reconnaissance", "", "IDS_HINT_RECONNAISSANCE", true);

	if(on_make_formation_popup~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_make_formation_popup)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

function make_formation_in_march_popup(menu)

	sl_play_sound("SLMakeFormationMarchPopup", false) 
	add_item_to_popup_menu(menu, "sl_menuitem_separate", "Separate", "", "IDS_HINT_SEPARATE", true);
	add_item_to_popup_menu(menu, "sl_menuitem_attack", "Attack", "", "IDS_HINT_ATTACK", true);
	add_item_to_popup_menu(menu, "sl_menuitem_patrol", "Patrol", "", "IDS_HINT_PATROL", true);
	--add_item_to_popup_menu(menu, "sl_menuitem_reconnaissance", "Reconnaissance", "", "IDS_HINT_RECONNAISSANCE", true);
	add_item_to_popup_menu(menu, "sl_menuitem_go_to_base", "GoToBase", "", "IDS_HINT_GOTOBASE", true);
	add_item_to_popup_menu(menu, "sl_menuitem_escort", "Escort", "", "IDS_HINT_ESCORT", true);
end


function make_formation_info_popup(menu, filter)
	if string.sub(filter, 1, 1) == "1" then
		add_item_to_popup_menu(menu, "sl_form_info_select_ammo", "IDS_Select_Ammo", "", "IDS_HINT_SELECT_AMMO", true);
	else
		add_item_to_popup_menu(menu, "sl_form_info_select_ammo", "IDS_Select_Ammo", "", "IDS_HINT_SELECT_AMMO", false);
	end
	if string.sub(filter, 2, 2) == "1" then
		add_item_to_popup_menu(menu, "sl_form_info_destroy", "IDS_Destroy", "", "IDS_HINT_DESTROY", true);
	end
	if string.sub(filter, 3, 3) == "1" then
		add_item_to_popup_menu(menu, "sl_form_info_separate", "Separate", "", "IDS_HINT_SEPARATE", true);
	else
		add_item_to_popup_menu(menu, "sl_form_info_separate", "Separate", "", "IDS_HINT_SEPARATE", false);
	end
	if string.sub(filter, 4, 4) == "1" then
		add_item_to_popup_menu(menu, "sl_form_info_attack", "Attack", "", "IDS_HINT_ATTACK", true);
	else
		add_item_to_popup_menu(menu, "sl_form_info_attack", "Attack", "", "IDS_HINT_ATTACK", false);
	end
	if string.sub(filter, 5, 5) == "1" then
		add_item_to_popup_menu(menu, "sl_form_info_retreat", "IDS_Retreat", "", "IDS_HINT_AUTOBATTLE_RETREAT", true);
	--else
	--	add_item_to_popup_menu(menu, "sl_form_info_retreat", "IDS_Retreat", "", "IDS_HINT_AUTOBATTLE_RETREAT", false);
	end
end

----------------------------------------------------------
-- Forces --
----------------------------------------------------------
function make_forces_popup(menu, filter)

	add_item_to_popup_menu(menu, "sl_forces_set_transport_route", "IDS_SetTransportRoute", "", "IDS_HINT_SETTRANSPORTROUTE", (string.sub(filter, 4, 4) == "1"));
	
	if string.sub(filter, 2, 2) == "1" then
		add_item_to_popup_menu(menu, "sl_forces_show_info", "IDS_Information", "", "", true);
	else
		add_item_to_popup_menu(menu, "sl_forces_show_info", "IDS_Information", "", "", false);
	end
	if string.sub(filter, 3, 3) == "1" then
		add_item_to_popup_menu(menu, "sl_forces_go_to_location", "IDS_Go_To_Location", "", "", true);
	else
		add_item_to_popup_menu(menu, "sl_forces_go_to_location", "IDS_Go_To_Location", "", "", false);
	end 
	if string.sub(filter, 1, 1) == "1" then
		add_item_to_popup_menu(menu, "sl_forces_send_to_base", "IDS_SendToBase", "", "IDS_HINT_GOTOBASE", true);
	else
		add_item_to_popup_menu(menu, "sl_forces_send_to_base", "IDS_SendToBase", "", "IDS_HINT_GOTOBASE", false);
	end
	
end


----------------------------------------------------------
-- Formation actions --
----------------------------------------------------------
function sl_menuitem_separate_on_base()
	sl_play_sound("BaseFormationsSeparate", false)
	local interface = get_base_gui_interface()
	interface:separate_formation()
end

function sl_menuitem_attack()
	set_map_state("FormationAttack")
end

on_menuitem_patrol = ''
function sl_menuitem_patrol()
	local form = sl_get_selected_formation()
	if (form ~= nil) then
		sl_play_sound("FormationOnMapPatrol", false)
		form:patrol()
	end
	set_map_state("Starting")
	sl_deselect_formations()
	sl_select_formation(form)
	sl_set_cursor("SM/Cursors/Default")
	if(on_menuitem_patrol~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_menuitem_patrol)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

function sl_menuitem_reconnaissance()
	local form = sl_get_selected_formation()
	form:make_reconnaissance()
	set_map_state("Starting")
	sl_deselect_formations()
--	sl_select_formation(form)
	sl_set_cursor("SM/Cursors/Default")
end

function sl_menuitem_theory_training()
	sl_play_sound("BaseFormationsTraining1", false)	
	get_base_gui_interface():training("theory")
	sl_tutorial_flags['theory_training_select'] = true
end
function sl_menuitem_shooting_training()
	sl_play_sound("BaseFormationsTraining2", false)	
	get_base_gui_interface():training("shooting")
end
function sl_menuitem_hard_training()
	sl_play_sound("BaseFormationsTraining3", false)	
	get_base_gui_interface():training("hard")
	sl_tutorial_flags['hard_training_select'] = true
end

function sl_menuitem_rest()
	sl_play_sound("BaseFormationsRest", false)	
	local interface = get_base_gui_interface()
	interface:rest()
end

function sl_menuitem_manoeuvres()
end


function sl_menuitem_leave_base()
	sl_play_sound("BaseFormationsLeaveBase", false)
	local interface = get_base_gui_interface()
	interface:remove_formation()
end

function sl_menuitem_go_to_base()
	local form = sl_get_selected_formation()
	if (form ~= nil) then
		sl_play_sound("FormationOnMapGoToBase", false)
		form:cancel_actions()
		form:go_to_base(invalid_base_id)
	end
	set_map_state("Starting")
	sl_deselect_formations()
	sl_select_formation(form)
	sl_set_cursor("SM/Cursors/Default")
end

function sl_menuitem_show_transport_route_gui()
	local form = sl_get_selected_formation()
	if (form ~= nil) then
		sl_play_sound("BaseFormationsSetRoutes", false)
		sl_show_transport_route_gui(true, form)
	end
end

function sl_menuitem_go_to_base_and_report()
	local form = sl_get_selected_formation()
	if (form ~= nil) then
		sl_play_sound("FormationOnMapGoToBaseAndSign", false)
		form:go_to_base_and_report(invalid_base_id)
	end
	set_map_state("Starting")
	sl_deselect_formations()
	sl_select_formation(form)
	sl_set_cursor("SM/Cursors/Default")
end

function sl_menuitem_cancel_report_go_to_base()
	local form = sl_get_selected_formation()
	if (form ~= nil) then
		sl_play_sound("FormationOnMapGoToBase", false)
		form:sl_menuitem_cancel_report_go_to_base(0)
	end
	set_map_state("Starting")
	sl_deselect_formations()
	sl_select_formation(form)
	sl_set_cursor("SM/Cursors/Default")
end

function sl_menuitem_air_attack()
	local form = sl_get_selected_formation()
	if (form ~= nil) then
		sl_play_sound("FormationOnMapAirAttack", false)
		form:sl_menuitem_air_attack()
	end
end


function sl_menuitem_escort()
	sl_play_sound("FormationOnMapEscort", false)
	set_map_state("FormationEscort")
end
--function sl_menuitem_supply()
--	set_map_state("FormationSupply")
--end

on_menuitem_zone_capture = ''
function sl_menuitem_zone_capture()
	set_map_state("ZoneCapture")
	sl_play_sound("FormationOnMapCreateBase", false)
	
	if(on_menuitem_zone_capture~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_menuitem_zone_capture)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

function sl_menuitem_stop_formation()
	local form = sl_get_selected_formation()
	if (form ~= nil) then
		sl_play_sound("FormationOnMapStop", false)
		form:stop()
		sl_deselect_formations()
		sl_select_formation(form)
		sl_set_cursor("SM/Cursors/Default")
	end
end

function sl_menuitem_stop_launching_missiles_from_formation()
	local form = sl_get_selected_formation()
	if (form ~= nil) then
		sl_play_sound("FormationOnMapStopMissiles", false)
		form:cancel_all_launch_tasks()
	end
end

function sl_menuitem_launch_missile_from_formation()
	local form = sl_get_selected_formation()
	if (form ~= nil) then
		sl_play_sound("FormationOnMapLaunchMissiles", false)
		form:select_missile()
	end
end

function sl_menuitem_show_form_info()
	sl_play_sound("BaseFormationsInfo", false)
	local form = sl_get_selected_formation()
	if (form ~= nil) then
		sl_play_sound("FormationOnMapShowInfo", false)
		form:show_info()
	end
end


----------------------------------------------------------
-- Zone actions --
----------------------------------------------------------
function sl_found_base_btn()
	local zone = sl_get_selected_zone()
	if not(zone == nil) and zone:get_base() == nil then
		zone:found_base(sl_get_my_player_id(),false)
	end
	hide_overlay("SL/ZoneInfoOverlay")
	sl_call_disposable_handler()
end


----------------------------------------------------------
-- Hide task information overlay
----------------------------------------------------------
function sl_close_task_info()
	sl_play_sound("HideTaskInfoOverlay", false)
	hide_overlay("SL/TaskInfo")
end

----------------------------------------------------------
-- Hide task historical info overlay
----------------------------------------------------------
--[[
function sl_close_historic_message()
	hide_overlay("SL/HistoricMessage")
end
]]

----------------------------------------------------------
-- Show task information overlay
----------------------------------------------------------
function sl_main_task_btn()
	sl_show_task_info_overlay()
end

----------------------------------------------------------
-- Battle Dialog --
----------------------------------------------------------
on_battle_auto_btn = ''
function sl_battle_auto_btn(battleId)
	sl_hide_battle_gui()
	if sl_get_time_scale() ~= pause then
		sl_main_pausebtn()
	end
	if(on_battle_auto_btn~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_battle_auto_btn)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

function sl_battle_detailedauto_btn(battleId)
	if sl_get_time_scale() ~= pause then
		sl_main_pausebtn()
	end
	sl_begin_battle_detailedauto(battleId)
end

function sl_battle_manual_btn(battleId)
	sl_hide_battle_gui()
	sl_main_pausebtn()
	sl_begin_manual_battle(battleId)
end

on_battle_end_close_btn = ''
function sl_battle_end_close_btn(battleId)
	sl_hide_battle_gui()
	if(on_battle_end_close_btn~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_battle_end_close_btn)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end


----------------------------------------------------------
-- Misc --
----------------------------------------------------------
function sl_close_end_message_btn()
	--hide_overlay("SL/EndMessage")
	sl_deactivate_strateg_level(1)
end

function sl_set_fish_ambient(country, r, g, b, a)
	set_material_ambient(country .. "_Cone", r, g, b, a)
	--set_material_ambient(country .. "_Stand", r, g, b, a)
	set_material_ambient(country .. "_Battleship_Fish", r, g, b, a)
	set_material_ambient(country .. "_Cruiser_Fish", r, g, b, a)
	set_material_ambient(country .. "_Transport_Fish", r, g, b, a)
	set_material_ambient(country .. "_Destroyer_Fish", r, g, b, a)
	set_material_ambient(country .. "_Fighter_Fish", r, g, b, a)
	set_material_ambient(country .. "_Bomber_Fish", r, g, b, a)
	set_material_ambient(country .. "_Submarine_Fish", r, g, b, a)
	set_material_ambient(country .. "_AircraftCarrier_Fish", r, g, b, a)
end


function sl_set_fish_diffuse(country, r, g, b)
	local a = 1.0
	set_material_diffuse(country .. "_Cone", r, g, b, a)
	set_material_diffuse(country .. "_Stand", r, g, b, a)
	set_material_diffuse(country .. "_Battleship_Fish", r, g, b, a)
	set_material_diffuse(country .. "_Cruiser_Fish", r, g, b, a)
	set_material_diffuse(country .. "_Transport_Fish", r, g, b, a)
	set_material_diffuse(country .. "_Destroyer_Fish", r, g, b, a)
	set_material_diffuse(country .. "_Fighter_Fish", r, g, b, a)
	set_material_diffuse(country .. "_Bomber_Fish", r, g, b, a)
	set_material_diffuse(country .. "_Submarine_Fish", r, g, b, a)
	set_material_diffuse(country .. "_AircraftCarrier_Fish", r, g, b, a)
end

function sl_set_fish_specular(country, aR, aG, aB, aA)
	set_material_specular(country .. "_Cone", aR, aG, aB, aA)
	set_material_specular(country .. "_Stand", aR, aG, aB, aA)
	set_material_specular(country .. "_Battleship_Fish", aR, aG, aB, aA)
	set_material_specular(country .. "_Cruiser_Fish", aR, aG, aB, aA)
	set_material_specular(country .. "_Transport_Fish", aR, aG, aB, aA)
	set_material_specular(country .. "_Destroyer_Fish", aR, aG, aB, aA)
	set_material_specular(country .. "_Fighter_Fish", aR, aG, aB, aA)
	set_material_specular(country .. "_Bomber_Fish", aR, aG, aB, aA)
	set_material_specular(country .. "_Submarine_Fish", aR, aG, aB, aA)
	set_material_specular(country .. "_AircraftCarrier_Fish", aR, aG, aB, aA)
end


----------------------------------------------------------
-- Formation Info --
----------------------------------------------------------
function sl_formation_info_close_btn()
	sl_play_sound("BaseFormationsInfoClose", false)
	sl_formation_info_hide();
end

sl_is_form_info_show_tree = true
function sl_formation_info_shtree_btn()
	treeH = ge_get ("SL/FormationInfo/TreePanel"):get_height () + 5
	panelH = ge_get ("SL/FormationInfoPanel"):get_height ()
	mainPanelH = ge_get ("SL/FormationInfo/MainPanel"):get_height ()
	if sl_is_form_info_show_tree then
		sl_is_form_info_show_tree = false
		ge_get ("SL/FormationInfoPanel"):set_height (panelH - treeH)
		ge_get ("SL/FormationInfo/MainPanel"):set_height (mainPanelH - treeH)
		ge_get ("SL/FormationInfo/TreePanel"):hide ()
	else
		sl_is_form_info_show_tree = true
		ge_get ("SL/FormationInfoPanel"):set_height (panelH + treeH)
		ge_get ("SL/FormationInfo/MainPanel"):set_height (mainPanelH + treeH)
		ge_get ("SL/FormationInfo/TreePanel"):show ()
	end
end

-----------------------------------------------------------------------------
function sl_mission_info_close()
	sl_play_sound("HideMissionInfoOverlay", false)
	
	hide_overlay("TL/MissionInfo")
	sl_main_pausebtn()
end
-----------------------------------------------------------------------------
set_on_mouse_clicked ("TL/MissionInfo/OK", "sl_mission_info_close")


function sl_base_tactic_btn()
	tl_show_msg_box_center("IDS_StrategSwitchToTacticBase", 1, "MsgBox/Yes|sl_base_tactic_btn_go()")
end

function sl_oe_3d_btn()
	tl_show_msg_box_center("IDS_StrategSwitchToTacticUnit", 1, "MsgBox/Yes|sl_oe_3d_btn_go()")
end


require ("res://sl_base_gui.lua")
require ("res://sl_production_gui.lua")
require ("res://sl_technology_gui.lua")
require ("res://sl_building_gui.lua")
require ("res://sl_rack_gui.lua")
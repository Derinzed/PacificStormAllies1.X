------------------------------------------------------------------------------
-- Copyright (c) Lesta Studio, 2004
------------------------------------------------------------------------------


-- ВНИМАНИЕ!!! Вызов sl_base_close_btn() будет работать только в том случае,
-- если не задизаблена соответствующая кнопка в интерфейсе базы.

function sl_base_close_btn(interface)

	if not ge_get("sl_base_close_btn"):is_enabled() then
		return
	end

	hide_overlay("SL/PeopleTransfer")
	interface:hide()
	current_page = main_page
	show_overlay(current_page,false)
--	if sl_get_time_scale() == pause then
--		sl_main_pausebtn()
--	end
end


function sl_base_help_btn(interface)
	get_base_gui_interface():show_help()
end

function SL_Base_BasePeople_TransferBtn(interface)
	sl_play_sound("BasePeoplesMove", false)
	interface:show_people_transfer_dlg("base")
end

function SL_Base_UnitPeople_TransferBtn(interface)
	sl_play_sound("BasePeoplesMove", false)
	interface:show_people_transfer_dlg("unit")
end


function SL_Base_UnitPeople_Crew_TransferToBaseBtn(interface)
	sl_play_sound("BasePeoplesMove", false)
	interface:show_people_transfer_fromcrew_dlg()
end

function SL_Base_UnitPeople_Crew_AssignFromBaseBtn(interface)
	sl_play_sound("BasePeoplesMove", false)
	interface:show_people_transfer_tocrew_dlg()
end


function SL_Base_MainPanel_Navigation_Prev(interface)
	sl_play_sound("BasePeoplesPrevBase", false)
	interface:goto_prev_base()
end

function SL_Base_MainPanel_Navigation_Next(interface)
	sl_play_sound("BasePeoplesNextBase", false)
	interface:goto_next_base()
end

function sl_base_formations_btn(interface)
	interface:set_active_page("Formations")
	ge_get("SL/Base/Formations"):show()
	ge_get("SL/Base/FormationsPanel"):show()
	ge_get("SL/Base/StorePanel"):hide()
	ge_get("SL/Base/PeoplePanel"):hide()
	ge_get("SL/Base/BuildingPanel"):hide()
	ge_get("SL/Base/InfoPanel"):hide()
	sl_set_button_press_state("sl_base_formations_btn", true)
	sl_set_button_press_state("sl_base_materials_btn", false)
	sl_set_button_press_state("sl_base_people_btn", false)
	sl_set_button_press_state("sl_base_building_btn", false)
	sl_set_button_press_state("sl_base_info_btn", false)
end

on_base_materials_click = ''
function sl_base_materials_btn(interface)
	interface:set_active_page("Store")
	ge_get("SL/Base/Formations"):show()
	ge_get("SL/Base/FormationsPanel"):hide()
	ge_get("SL/Base/StorePanel"):show()
	ge_get("SL/Base/PeoplePanel"):hide()
	ge_get("SL/Base/BuildingPanel"):hide()
	ge_get("SL/Base/InfoPanel"):hide()
	sl_set_button_press_state("sl_base_formations_btn", false)
	sl_set_button_press_state("sl_base_materials_btn", true)
	sl_set_button_press_state("sl_base_people_btn", false)
	sl_set_button_press_state("sl_base_building_btn", false)
	sl_set_button_press_state("sl_base_info_btn", false)

	if (on_base_materials_click~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_base_materials_click)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

on_base_people_click = ''
function sl_base_people_btn(interface)
	interface:set_active_page("People")
	ge_get("SL/Base/Formations"):show()
	ge_get("SL/Base/FormationsPanel"):hide()
	ge_get("SL/Base/StorePanel"):hide()
	ge_get("SL/Base/PeoplePanel"):show()
	ge_get("SL/Base/BuildingPanel"):hide()
	ge_get("SL/Base/InfoPanel"):hide()
	sl_set_button_press_state("sl_base_formations_btn", false)
	sl_set_button_press_state("sl_base_materials_btn", false)
	sl_set_button_press_state("sl_base_people_btn", true)
	sl_set_button_press_state("sl_base_building_btn", false)
	sl_set_button_press_state("sl_base_info_btn", false)

	if (on_base_people_click~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_base_people_click)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

on_base_building_click = ''
function sl_base_building_btn(interface)
	interface:set_active_page("Building")
	ge_get("SL/Base/Formations"):hide()
	ge_get("SL/Base/FormationsPanel"):hide()
	ge_get("SL/Base/StorePanel"):hide()
	ge_get("SL/Base/PeoplePanel"):hide()
	ge_get("SL/Base/BuildingPanel"):show()
	ge_get("SL/Base/InfoPanel"):hide()
	sl_set_button_press_state("sl_base_formations_btn", false)
	sl_set_button_press_state("sl_base_materials_btn", false)
	sl_set_button_press_state("sl_base_people_btn", false)
	sl_set_button_press_state("sl_base_building_btn", true)
	sl_set_button_press_state("sl_base_info_btn", false)

	if (on_base_building_click~='') then
		local func, errmsg;
		func, errmsg = loadstring(on_base_building_click)
		if func==nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

on_base_info_click = ''
function sl_base_info_btn(interface)
	interface:set_active_page("Info")
	ge_get("SL/Base/Formations"):hide()
	ge_get("SL/Base/FormationsPanel"):hide()
	ge_get("SL/Base/StorePanel"):hide()
	ge_get("SL/Base/PeoplePanel"):hide()
	ge_get("SL/Base/BuildingPanel"):hide()
	ge_get("SL/Base/InfoPanel"):show()
	sl_set_button_press_state("sl_base_formations_btn", false)
	sl_set_button_press_state("sl_base_materials_btn", false)
	sl_set_button_press_state("sl_base_people_btn", false)
	sl_set_button_press_state("sl_base_building_btn", false)
	sl_set_button_press_state("sl_base_info_btn", true)

	if (on_base_info_click ~= '') then
		local func, errmsg;
		func, errmsg = loadstring(on_base_info_click)
		if func == nil then
			log_message(errmsg)
			return
		end
		func()
	end
end

----------------------------------------------------------
-- Popups --
----------------------------------------------------------
function make_base_formation_popup(menu, filter)

	add_item_to_popup_menu(menu, "sl_base_menuitem_set_transport_route", "IDS_SetTransportRoute", "", "IDS_HINT_SETTRANSPORTROUTE", string.sub(filter, 15, 15) == "1")
	add_item_to_popup_menu(menu, "sl_menuitem_base_show_form_info", "IDS_FormInfo", "", "IDS_HINT_FORMINFO", string.sub(filter, 11, 11) == "1")
	add_item_to_popup_menu(menu, "sl_menuitem_disband", "Disband", "", "IDS_HINT_DISBAND", string.sub(filter, 1, 1) == "1")
	add_item_to_popup_menu(menu, "sl_menuitem_rest", "Rest", "", "IDS_HINT_REST", string.sub(filter, 6, 6) == "1")

	-- Тренировки
	if string.sub(filter, 5, 5) ~= "2" then
		add_item_to_popup_menu(menu, "sl_menuitem_hard_training", "IDS_HardTraining", "", "IDS_HINT_HARDTRAINING", string.sub(filter, 5, 5) == "1")
	end

	if string.sub(filter, 4, 4) ~= "2" then
		add_item_to_popup_menu(menu, "sl_menuitem_shooting_training", "IDS_ShootingTraining", "", "IDS_HINT_SHOOTINGTRAINING", string.sub(filter, 4, 4) == "1")
	end

	if string.sub(filter, 3, 3) ~= "2" then
		add_item_to_popup_menu(menu, "sl_menuitem_theory_training", "IDS_TheoryTraining", "", "IDS_HINT_THEORYTRAINING", string.sub(filter, 3, 3) == "1")
	end

	add_item_to_popup_menu(menu, "sl_menuitem_select_ammo", "IDS_Select_Ammo", "", "IDS_HINT_SELECT_AMMO", string.sub(filter, 8, 8) == "1")
	add_item_to_popup_menu(menu, "sl_menuitem_select_modification", "IDS_Change_Modification", "", "IDS_HINT_CHANGE_MODIFICATION", string.sub(filter, 10, 10) == "1")
	add_item_to_popup_menu(menu, "sl_menuitem_reinforce", "Reinforce", "", "IDS_HINT_REINFORCE", string.sub(filter, 2, 2) == "1")
	add_item_to_popup_menu(menu, "sl_menuitem_join_to_form_for_transportation", "IDS_JoinToFormForTransportation", "", "IDS_HINT_JOIN_FOR_TRANSPORTATION", string.sub(filter, 13, 13) == "1")
	add_item_to_popup_menu(menu, "sl_menuitem_disband_form_transportation", "IDS_DisbandTransportation", "", "IDS_HINT_DISBAND_TRANSPORTATION", string.sub(filter, 14, 14) == "1")
	add_item_to_popup_menu(menu, "sl_menuitem_join_to_form_on_base", "IDS_JoinToForm", "", "IDS_HINT_JOIN", string.sub(filter, 12, 12) == "1")
	add_item_to_popup_menu(menu, "sl_menuitem_separate_on_base", "Separate", "", "IDS_HINT_SEPARATE", string.sub(filter, 7, 7) == "1")
	add_item_to_popup_menu(menu, "sl_menuitem_leave_base", "LeaveBase", "", "IDS_HINT_LEAVEBASE", string.sub(filter, 9, 9) == "1")

end

function make_base_person_popup(menu, filter)
	if string.sub(filter, 1, 1) == "1" then
		add_item_to_popup_menu(menu, "sl_menuitem_appoint_commander", "Appoint_Commander", "", "IDS_HINT_APPOINT_COMMANDER", true);
	end
	if string.sub(filter, 2, 2) == "1" then
		add_item_to_popup_menu(menu, "sl_menuitem_appoint_general_commander", "Appoint_General_Commander", "", "IDS_HINT_APPOINT_GENERAL_COMMANDER", true);
	end
	if string.sub(filter, 3, 3) == "1" then
		add_item_to_popup_menu(menu, "sl_menuitem_move_person_on_unit", "Move_On_Unit", "", "IDS_HINT_MOVE_ON_UNIT", true);
	end
end

function make_formation_person_popup(menu, filter)
	if string.sub(filter, 1, 1) == "1" then
		add_item_to_popup_menu(menu, "sl_menuitem_appoint_commander", "Appoint_Commander", "", "IDS_HINT_APPOINT_COMMANDER", true);
	end
	if string.sub(filter, 2, 2) == "1" then
		add_item_to_popup_menu(menu, "sl_menuitem_appoint_general_commander", "Appoint_General_Commander", "", "IDS_HINT_APPOINT_GENERAL_COMMANDER", true);
	end
	if string.sub(filter, 3, 3) == "1" then
		add_item_to_popup_menu(menu, "sl_menuitem_move_person_on_base", "Move_On_Base", "", "IDS_HINT_MOVE_ON_BASE", true);
	end
end


function sl_menuitem_launch_missile()
	base = sl_get_base(sl_get_selected_base_id())
	if base ~= nil then
		base:select_missile()
	end
end


function sl_menuitem_stop_launching_missiles()
	base = sl_get_base(sl_get_selected_base_id())
	if base ~= nil then
		base:cancel_all_launch_tasks()
	end
end


function sl_make_base_popup(menu, filter)

	sl_play_sound("SLMakeBasePopup", false) 
	
	add_item_to_popup_menu(
		menu,
		"sl_menuitem_to_make_main_base",
		"IDS_MakeMainBase",
		"",
		"IDS_HINT_MAKEMAINBASE",
		string.sub(filter, 1, 1) == "1"
	)

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_stop_launching_missiles",
		"IDS_StopLaunchingMissiles",
		"",
		"IDS_HINT_STOP_LAUNCHNG_MISSILES",
		string.sub(filter, 2, 2) == "1"
	)

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_launch_missile",
		"IDS_LaunchMissile",
		"",
		"IDS_HINT_LAUNCH_MISSILE",
		string.sub(filter, 3, 3) == "1"
	)

	if (string.sub(filter, 4, 4) == "1") then
		add_item_to_popup_menu(
			menu,
			"sl_menuitem_full_base_ai_off",
			"IDS_FullBaseAIOff",
			"",
			"IDS_HINT_FULL_BASE_AI_OFF",
			true
		)
	else
		add_item_to_popup_menu(
			menu,
			"sl_menuitem_full_base_ai_on",
			"IDS_FullBaseAIOn",
			"",
			"IDS_HINT_FULL_BASE_AI_ON",
			string.sub(filter, 5, 5) == "1"
		)
	end

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_to_build_base",
		"IDS_BaseBuildings",
		"",
		"IDS_HINT_BASEBUILDINGS",
		true
	)

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_to_regulate_people",
		"IDS_RegulatePeople",
		"",
		"IDS_HINT_REGULATEPEOPLE",
		true
	)

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_to_regulate_reserves",
		"IDS_RegulateReserves",
		"",
		"IDS_HINT_REGULATERESERVES",
		true
	)

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_to_regulate_formations",
		"IDS_RegulateFormations",
		"",
		"IDS_HINT_REGULATEFORMATIONS",
		true
	)
end


function sl_make_form_types_list_popup(menu)
	add_item_to_popup_menu(menu, "sl_menuitem_add_form_to_production", "IDS_AddFormToProduction", "", "IDS_HINT_ADD_FORM_TO_PRODUCTION", true);
	add_item_to_popup_menu(menu, "sl_menuitem_make_new_formation", "IDS_MakeNewFormation", "", "IDS_STRATEG_BASE_TYPE_FORMATION_CREATE", true);
end


function sl_make_supply_popup(menu)
	sl_play_sound("BaseStoreLoadPopup", false)	
	add_item_to_popup_menu(menu, "sl_menuitem_load_supply_oil", "IDS_LOAD_SUPPLY_OIL", "", "IDS_HINT_LOAD_SUPPLY_OIL", true);
	add_item_to_popup_menu(menu, "sl_menuitem_load_supply_ammos", "IDS_LOAD_SUPPLY_AMMOS", "", "IDS_HINT_LOAD_SUPPLY_AMMOS", true);
	add_item_to_popup_menu(menu, "sl_menuitem_load_own_ammos", "IDS_LOAD_OWN_AMMOS", "", "IDS_HINT_LOAD_OWN_AMMOS", true);
end


----------------------------------------------------------

function sl_menuitem_to_build_base()
	sl_play_sound("BasePopupBuildings", false)
	get_gui_page(base_page):show("Building")
end
function sl_menuitem_to_regulate_people()
	sl_play_sound("BasePopupPeople", false)
	get_gui_page(base_page):show("People")
end
function sl_menuitem_to_regulate_reserves()
	sl_play_sound("BasePopupStore", false)
	get_gui_page(base_page):show("Store")
end
function sl_menuitem_to_regulate_formations()
	sl_play_sound("BasePopupFormations", false)
	get_gui_page(base_page):show("Formations")
end

function sl_menuitem_full_base_ai_on()
	base = sl_get_base(sl_get_selected_base_id())
	if base ~= nil then
		sl_play_sound("BasePopupFullAIEnable", false)
		base:full_ai_control(true)
	end
end

function sl_menuitem_full_base_ai_off()
	base = sl_get_base(sl_get_selected_base_id())
	if base ~= nil then
		sl_play_sound("BasePopupFullAIDisable", false)
		base:full_ai_control(false)
	end
end

function sl_menuitem_to_form_escort()
end



----------------------------------------------------------
-- People Transfer Dialog --
----------------------------------------------------------
m_seamen = 0	m_pilots = 1	m_soldiers = 2	m_engineers = 3

function sl_people_transfer_cancel_btn(dlg)
	sl_play_sound("BasePeoplesMoveButtons", false)
	dlg:hide()
end

function sl_people_transfer_apply_btn(dlg)
	sl_play_sound("BasePeoplesMoveButtons", false)
	dlg:transfer()
end

function sl_people_transfer_all_btn(dlg)
	sl_play_sound("BasePeoplesMoveButtons", false)
	dlg:all_kind()
end

function sl_people_transfer_seamen_btn(dlg)
	sl_play_sound("BasePeoplesMoveBookmarks", false)
	dlg:activate_page(m_seamen)
	sl_set_button_press_state("sl_people_transfer_seamen_btn", true)
	sl_set_button_press_state("sl_people_transfer_pilots_btn", false)
	sl_set_button_press_state("sl_people_transfer_soldiers_btn", false)
	sl_set_button_press_state("sl_people_transfer_engineers_btn", false)
end

function sl_people_transfer_pilots_btn(dlg)
	sl_play_sound("BasePeoplesMoveBookmarks", false)
	dlg:activate_page(m_pilots)
	sl_set_button_press_state("sl_people_transfer_pilots_btn", true)
	sl_set_button_press_state("sl_people_transfer_seamen_btn", false)
	sl_set_button_press_state("sl_people_transfer_soldiers_btn", false)
	sl_set_button_press_state("sl_people_transfer_engineers_btn", false)
end

function sl_people_transfer_soldiers_btn(dlg)
	sl_play_sound("BasePeoplesMoveBookmarks", false)
	dlg:activate_page(m_soldiers)
	sl_set_button_press_state("sl_people_transfer_soldiers_btn", true)
	sl_set_button_press_state("sl_people_transfer_seamen_btn", false)
	sl_set_button_press_state("sl_people_transfer_pilots_btn", false)
	sl_set_button_press_state("sl_people_transfer_engineers_btn", false)
end

function sl_people_transfer_engineers_btn(dlg)
	sl_play_sound("BasePeoplesMoveBookmarks", false)
	dlg:activate_page(m_engineers)
	sl_set_button_press_state("sl_people_transfer_engineers_btn", true)
	sl_set_button_press_state("sl_people_transfer_seamen_btn", false)
	sl_set_button_press_state("sl_people_transfer_pilots_btn", false)
	sl_set_button_press_state("sl_people_transfer_soldiers_btn", false)
end
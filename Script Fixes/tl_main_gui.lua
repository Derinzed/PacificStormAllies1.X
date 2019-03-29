------------------------------------------------------------------------------
-- Copyright (c) Lesta Studio, 2004
------------------------------------------------------------------------------

require ("res://common.lua")
log_message ("Executing GUI script tl_main_gui.lua")
------------------------------------------------------------------------------
__shift_down = false
__ctrl_down = false
__curpos = {}
__selection_visible = false
------------------------------------------------------------------------------
function tl_main_gui_begin_selection (evt)
	__selection_visible = true
	tl_begin_selection (evt)
	__shift_down = evt:is_shift_down ()
	__ctrl_down = evt:is_control_down ()
end
-----------------------------------------------------------------------------
function tl_main_gui_continue_selection (evt)
	tl_continue_selection (evt)
	__shift_down = evt:is_shift_down ()
	__ctrl_down = evt:is_control_down ()
end
-----------------------------------------------------------------------------
function tl_main_gui_end_selection (evt)
	__selection_visible = false

	tl_end_selection (evt)

	if ((not __shift_down) and (not __ctrl_down)) then
		tl_unselect_all (tl_get_my_player ())
	end

	tl_select_by_rect (UF_SELECTABLE, false, __ctrl_down)
end
-----------------------------------------------------------------------------
function tl_main_gui_mouse_pressed (evt)
	__curpos = tovector ({x=evt:get_x ();y=evt:get_y ();z=evt:get_z ()})
	if evt:is_button_down (ME_BTN_MBUTTON0) then
		tl_main_gui_begin_selection (evt)
	else
		if evt:is_button_down (ME_BTN_MBUTTON1) then
			--log_message ("X: "..__curpos.x.."  Y: "..__curpos.y.."  Z: "..__curpos.z)
			tl_send_units_to_point (__curpos , 0)
		end
	end
end
-----------------------------------------------------------------------------
function tl_main_gui_mouse_dragged (evt)
	if __selection_visible and evt:is_button_down (ME_BTN_MBUTTON0) then
		tl_main_gui_continue_selection (evt)
	end
	__curpos = tovector ({x=evt:get_x ();y=evt:get_y ();z=evt:get_z ()})
end
-----------------------------------------------------------------------------
function tl_main_gui_mouse_released (evt)
	if __selection_visible then
		tl_main_gui_end_selection (evt)
	end
end
-----------------------------------------------------------------------------
function tl_main_gui_unit_button_pressed (evt)
	tl_unit_button_pressed (evt)
end
-----------------------------------------------------------------------------
function tl_main_gui_group_selection (name)
	tl_group_selection (tl_get_my_player (), name)
end
-----------------------------------------------------------------------------
function tl_main_gui_select_group (name)
	if (tl_can_select_groups ()) then
		tl_unselect_all (tl_get_my_player ())
		tl_select_group (tl_get_my_player (), name)
	end
end
-----------------------------------------------------------------------------
function tl_main_gui_minimap_click (evt)
	--if evt:is_button_down (ME_BTN_MBUTTON0) then
		tl_handle_minimap_click (evt:get_x (), evt:get_y ())
	--end
end
-----------------------------------------------------------------------------
function tl_main_gui_minimap_press (evt)
	if evt:is_button_down (ME_BTN_MBUTTON0) then
		tl_handle_minimap_click (evt:get_x (), evt:get_y ())
	end
	if evt:is_button_down (ME_BTN_MBUTTON1) then
		tl_handle_minimap_right_click (evt:get_x (), evt:get_y ())
	end
end
-----------------------------------------------------------------------------
__mmap_scales = {0.75, 1., 2., 4.}
__cur_mmap_scale = 2
-----------------------------------------------------------------------------
function tl_main_gui_minimap_zoom_in (evt)
	if __cur_mmap_scale < table.getn (__mmap_scales) then
		tl_play_sound("MinimapEnlarge", false)
		__cur_mmap_scale = __cur_mmap_scale+1
		tl_set_minimap_scale (__mmap_scales[__cur_mmap_scale])
		tl_add_message (
			tl_i18n ("IDS_MINIMAP_SCALE")..towstring (" "..__mmap_scales[__cur_mmap_scale]),
			MSGID_MINIMAP_SCALE
		)
	end
end
-----------------------------------------------------------------------------
function tl_main_gui_minimap_zoom_out (evt)
	if __cur_mmap_scale > 1 then
		tl_play_sound("MinimapMiniaturize", false)
		__cur_mmap_scale = __cur_mmap_scale-1
		tl_set_minimap_scale (__mmap_scales[__cur_mmap_scale])
		tl_add_message (
			tl_i18n ("IDS_MINIMAP_SCALE")..towstring (" "..__mmap_scales[__cur_mmap_scale]),
			MSGID_MINIMAP_SCALE
		)
	end
end
-----------------------------------------------------------------------------
function tl_main_gui_hide_minimap ()
	tl_show_minimap (false)
	tl_play_sound("MinimapHide", false)
end
-----------------------------------------------------------------------------
function tl_main_gui_show_minimap ()
	tl_show_minimap (true)
	tl_play_sound("MinimapShow", false)
end
-----------------------------------------------------------------------------
function tl_main_gui_is_mm_visible ()
	return ge_get ("TL/Main/Minimap"):is_visible ()
end
-----------------------------------------------------------------------------
function tl_main_gui_toggle_minimap ()
	if tl_main_gui_is_mm_visible () then
		tl_main_gui_hide_minimap ()
	else
		tl_main_gui_show_minimap ()
	end
end
-----------------------------------------------------------------------------
function tl_main_gui_home_camera ()
	local center = tl_get_map_center ()
	tl_move_camera_to ({x=center.x; z=center.z})
end
-----------------------------------------------------------------------------
function tl_mission_info_close ()
	hide_overlay ("TL/MissionInfo")
	tl_set_paused (tl_is_was_paused (), false)
	tl_set_modal_dialog_visible (false)
	tl_set_was_paused (false)
end
-----------------------------------------------------------------------------
function tl_main_gui_toggle_message_log ()
	tl_show_message_log (not tl_message_log_is_visible ())
end
-----------------------------------------------------------------------------
function tl_main_gui_toggle_more_unit_info ()
	local show = not tl_more_unit_info_is_visible ()
	if show and tl_hl_info_is_visible() then
		tl_hl_info_show(false)
	end
	tl_show_more_unit_info(show)
end
-----------------------------------------------------------------------------
function tl_main_gui_toggle_hl_unit_info ()
	local show = not tl_hl_info_is_visible ()
	if show and tl_more_unit_info_is_visible() then
		tl_show_more_unit_info (false)
	end
	tl_hl_info_show(show)
end
-----------------------------------------------------------------------------
function tl_main_gui_hide_message_log ()
	tl_show_message_log (false)
end
-----------------------------------------------------------------------------

set_on_mouse_clicked ("TL/Main/Minimap/Circles1", "tl_show_ranges")
set_on_mouse_clicked ("TL/Main/Minimap/Circles2", "tl_show_ranges")

set_on_mouse_clicked ("TL/Main/Minimap/Circles1Dn", "tl_hide_ranges")
set_on_mouse_clicked ("TL/Main/Minimap/Circles2Dn", "tl_hide_ranges")

set_on_mouse_clicked ("TL/Main/Minimap/FireDirection1", "tl_show_directions")
set_on_mouse_clicked ("TL/Main/Minimap/FireDirection2", "tl_show_directions")

set_on_mouse_clicked ("TL/Main/Minimap/FireDirection1Dn", "tl_hide_directions")
set_on_mouse_clicked ("TL/Main/Minimap/FireDirection2Dn", "tl_hide_directions")

set_on_mouse_pressed ("TL/Main/MainPanel", "tl_main_gui_mouse_pressed")
set_on_mouse_dragged ("TL/Main/MainPanel", "tl_main_gui_mouse_dragged")
set_on_mouse_released ("TL/Main/MainPanel", "tl_main_gui_mouse_released")

set_on_mouse_pressed ("TL/Main/Minimap", "tl_main_gui_minimap_press")
set_on_mouse_dragged ("TL/Main/Minimap", "tl_main_gui_minimap_press")

set_on_mouse_clicked ("TL/Main/Minimap/Hide", "tl_main_gui_hide_minimap")
set_on_mouse_clicked ("TL/Main/Minimap/Show", "tl_main_gui_show_minimap")

set_on_mouse_clicked ("TL/Main/Minimap/Pause1", "toggle_pause")
set_on_mouse_clicked ("TL/Main/Minimap/Pause2", "toggle_pause")

set_on_mouse_clicked ("TL/Main/Minimap/DecreaseGameSpeed1", "tl_decrease_game_speed")
set_on_mouse_clicked ("TL/Main/Minimap/DecreaseGameSpeed2", "tl_decrease_game_speed")

set_on_mouse_clicked ("TL/Main/Minimap/IncreaseGameSpeed1", "tl_increase_game_speed")
set_on_mouse_clicked ("TL/Main/Minimap/IncreaseGameSpeed2", "tl_increase_game_speed")

set_on_mouse_clicked ("TL/Main/Minimap/Menu1", "tl_toggle_game_menu")
set_on_mouse_clicked ("TL/Main/Minimap/Menu2", "tl_toggle_game_menu")

set_on_mouse_clicked ("TL/Main/Minimap/MissionInfo1", "tl_show_mission_info")
set_on_mouse_clicked ("TL/Main/Minimap/MissionInfo2", "tl_show_mission_info")
set_on_mouse_clicked ("TL/MissionInfo/OK", "tl_mission_info_close")

set_on_mouse_clicked ("TL/Main/Minimap/ZoomIn2", "tl_main_gui_minimap_zoom_in")
set_on_mouse_clicked ("TL/Main/Minimap/ZoomOut2", "tl_main_gui_minimap_zoom_out")

set_on_mouse_clicked ("TL/Main/Minimap/Strateg1", "make_exit_to_strateg_command")
set_on_mouse_clicked ("TL/Main/Minimap/Strateg2", "make_exit_to_strateg_command")

set_on_mouse_clicked ("TL/Main/Minimap/Desant1", "tl_desant_toggle")
set_on_mouse_clicked ("TL/Main/Minimap/Desant2", "tl_desant_toggle")

set_on_mouse_clicked ("TL/Main/Minimap/Log1", "tl_main_gui_toggle_message_log");
set_on_mouse_clicked ("TL/Main/Minimap/Log2", "tl_main_gui_toggle_message_log");

set_on_mouse_clicked ("TL/Main/Minimap/Reinforcement1", "tl_toggle_reinforcement");
set_on_mouse_clicked ("TL/Main/Minimap/Reinforcement2", "tl_toggle_reinforcement");

set_on_mouse_clicked ("TL/Main/MessageLog/Close", "tl_main_gui_hide_message_log");

set_on_mouse_clicked ("TL/BattleBase/CloseWnd", "tl_desant_close")

set_on_mouse_clicked ("TL/Main/UnitInfo", "tl_toggle_camera_tracking");
set_on_mouse_clicked ("TL/Main/UnitInfo/ShowMore", "tl_main_gui_toggle_more_unit_info");
set_on_mouse_clicked ("TL/Main/UnitInfo/RetreatUnit", "tl_main_gui_retreat_selected");
set_on_mouse_clicked ("TL/Main/UnitInfo/ShowHLInfo", "tl_main_gui_toggle_hl_unit_info");
set_on_mouse_clicked ("TL/Main/UnitInfo/ShipDirectControl", "tl_main_gui_ship_direct_control");

set_on_mouse_clicked ("TL/Main/ShipDirectControlPanel/BigGuns", "tl_toggle_big_guns_control");
set_on_mouse_clicked ("TL/Main/ShipDirectControlPanel/MediumGuns", "tl_toggle_medium_guns_control");
set_on_mouse_clicked ("TL/Main/ShipDirectControlPanel/TorpedoTubes", "tl_toggle_torpedo_tubes_control");

set_on_mouse_clicked ("TL/Main/MoreUnitInfo/Close", "tl_main_gui_toggle_more_unit_info");
set_on_mouse_clicked ("TL/Main/UnitInfo/Use", "tl_toggle_direct_control");

log_message ("Leaving tl_main_gui.lua")

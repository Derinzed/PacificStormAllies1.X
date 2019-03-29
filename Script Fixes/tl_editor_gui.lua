------------------------------------------------------------------------------
-- Copyright (c) Lesta Studio, 2004
------------------------------------------------------------------------------

require ("res://common.lua")
require ("res://tl_editor_rivers.lua")
require ("res://tl_editor_forests.lua")
log_message ("Executing GUI script tl_editor_gui.lua")

------------------------------------------------------------------------------
-- Сохранение/загрузка

function tl_save_units_prompt_ok ()
	hide_overlay ("TL/Prompt")
	tl_save_units (ge_get ("tl_gui_prompt_text"):get_caption ())
end

function tl_save_units_prompt ()
	set_on_mouse_clicked ("tl_gui_prompt_ok", "tl_save_units_prompt_ok")
	ge_get ("tl_gui_prompt_caption"):set_caption ("Save Units")
	ge_get ("tl_gui_prompt_label"):set_caption ("File name:")

	local lbx = get_listbox ("tl_gui_mselect_list")
	ge_get ("tl_gui_prompt_text"):set_caption (lbx:get_selected_caption ())

	show_overlay ("TL/Prompt", true)
end

function tl_load_units_prompt_ok ()
	hide_overlay ("TL/Prompt")
	tl_restore_units (ge_get ("tl_gui_prompt_text"):get_caption ())
end

function tl_load_units_prompt ()
	set_on_mouse_clicked ("tl_gui_prompt_ok", "tl_load_units_prompt_ok")
	ge_get ("tl_gui_prompt_caption"):set_caption ("Load Units")
	ge_get ("tl_gui_prompt_label"):set_caption ("File name:")

	local lbx = get_listbox ("tl_gui_mselect_list")
	ge_get ("tl_gui_prompt_text"):set_caption (lbx:get_selected_caption ())

	show_overlay ("TL/Prompt", true)
end

------------------------------------------------------------------------------
-- Обновление списка выделенных объектов

function tl_editor_update_selected_units_list ()
	local lbx = get_listbox ("TL/Editor/SelectedUnits/List")
	local objects = tl_get_selected_objects ()
	local object_count = table.getn (objects)

	lbx:clear ()
	for i = 1, object_count do
		lbx:add_item (objects[i]:get_proto_name () .." - ".. objects[i]:get_save_name ())
	end

	tl_gui_editor_update_unit_info ()
end

------------------------------------------------------------------------------
-- Обновление списка ландшафтов

function tl_editor_update_terrain_list ()
	local lbx = get_listbox ("TL/Editor/Terrains/List")
	local terrains = tl_get_terrains ()
	local terrain_count = table.getn (terrains)

	lbx:clear ()
	for i = 1, terrain_count do
		lbx:add_item (terrains[i]:get_name ())
	end

	tl_gui_editor_update_terrain_info ()
end

------------------------------------------------------------------------------
-- Диалог создания юнита

function tl_gui_editor_new_units_click ()
	ge_get ("TL/Editor/CreateObjectDialog/Objects"):hide ()
	ge_get ("TL/Editor/CreateObjectDialog/Units"):show ()
	set_button_press_state ("tl_gui_editor_new_units", true)
	set_button_press_state ("tl_gui_editor_new_objects", false)
end

function tl_gui_editor_new_objects_click ()
	ge_get ("TL/Editor/CreateObjectDialog/Objects"):show ()
	ge_get ("TL/Editor/CreateObjectDialog/Units"):hide ()
	set_button_press_state ("tl_gui_editor_new_units", false)
	set_button_press_state ("tl_gui_editor_new_objects", true)
end

function tl_add_unit_ok_scr ()
	tl_add_unit_ok (false)
	hide_overlay ("TL/Editor/AddUnit")
end

function tl_add_unit_change_player_click ()
	local current_player_ge = ge_get ("tl_gui_editor_current_player_value")
	if (current_player_ge:get_caption () == "0") then
		current_player_ge:set_caption ("1")
	else
		current_player_ge:set_caption ("0")
	end
end

function tl_gui_show_new_object_dialog (evt)
	tl_add_unit_ok (true)
	show_overlay ("TL/Editor/CreateObjectDialog", true)
end

function tl_ship_unit_list_ok_scr ()
	local list_box = get_listbox ("tl_gui_airplane_unit_list")
	list_box:unselect ()
end

function tl_airplane_unit_list_ok_scr ()
	local list_box = get_listbox ("tl_gui_ship_unit_list")
	list_box:unselect ()
end

function tl_gui_hide_new_object_dialog (evt)
	hide_overlay ("TL/Editor/CreateObjectDialog")
end

------------------------------------------------------------------------------
-- Создание нового юнита/объекта

function tl_gui_create_unit (evt)
	hide_overlay ("TL/Editor/CreateObjectDialog")
	local obj_name = get_listbox ("TL/Editor/NewObjectList"):get_selected_caption ()

	local obj = OBJECT["EditorObjects"]:get (obj_name)

	local v = tovector (tl_get_camera_pos(nil)) + tovector (tl_get_camera_dir ())*100.
	tl_create_static_object (obj["Template"]:get_value (), v.x, v.y, v.z)
	tl_unselect_all (tl_get_my_player ())
end

------------------------------------------------------------------------------
-- Удаление юнитов/объектов

function tl_gui_delete_unit (evt)
	local objects = tl_get_selected_objects ()
	local object_count = table.getn (objects)
	for i = 1, object_count do
		tl_remove_object (objects[i]:get_name ())
	end
end

------------------------------------------------------------------------------
-- Клонирование юнитов/объектов

function tl_gui_clone_unit (evt)
	tl_clone_selection ()
end

------------------------------------------------------------------------------

__selection_visible = false

------------------------------------------------------------------------------

function tl_gui_editor_toggle_building ()
	local cbx = get_checkbox ("TL/Editor/UnitInfo/IsBuilding")
	local lbx = get_listbox ("TL/Editor/SelectedUnits/List")
	if lbx ~= nil and cbx ~= nil then
		local indexes = lbx:get_selected_indexes ()
		local num_indexes = table.getn (indexes)
		for i = 1, num_indexes do
			local objcap = lbx:get_item_caption (indexes[i])
			local nidx = string.find (objcap, " - ", 1, true)
			if nidx ~= nil then
				local objname = string.sub (objcap, nidx+3)
				local object = tl_get_object (objname)
				if object ~= nil then
					object:set_building (cbx:get_state ())
				end
			end -- if
		end -- for
	end -- if
end -- function

------------------------------------------------------------------------------
-- Обновление панели с информацией о выделенном объекте

function tl_gui_editor_update_unit_info ()
	local lbx = get_listbox ("TL/Editor/SelectedUnits/List")
	local cbx = get_checkbox ("TL/Editor/UnitInfo/IsBuilding")

	local objcap = lbx:get_selected_caption ()
	local nidx = string.find (objcap, " - ", 1, true)
	if nidx == nil then
		return
	end
	local objname = string.sub (objcap, nidx+3)

	local object = tl_get_object (objname)

	if object ~= nil then
		ge_get ("TL/Editor/Unit/Rename"):show ()
		ge_get ("TL/Editor/UnitInfo/Name"):set_caption (object:get_save_name ())
		ge_get ("TL/Editor/UnitInfo/Type"):set_caption (object:get_type ())
		local pos = object:get_position ()
		ge_get ("TL/Editor/UnitInfo/PosX"):set_caption (pos.x)
		ge_get ("TL/Editor/UnitInfo/PosY"):set_caption (pos.y)
		ge_get ("TL/Editor/UnitInfo/PosZ"):set_caption (pos.z)
		if cbx ~= nil then
			cbx:set_state (object:is_building ())
		end
	else
		ge_get ("TL/Editor/Unit/Rename"):hide ()
		ge_get ("TL/Editor/UnitInfo/Name"):set_caption ("")
		ge_get ("TL/Editor/UnitInfo/Type"):set_caption ("")
		ge_get ("TL/Editor/UnitInfo/PosX"):set_caption ("")
		ge_get ("TL/Editor/UnitInfo/PosY"):set_caption ("")
		ge_get ("TL/Editor/UnitInfo/PosZ"):set_caption ("")
		if cbx ~= nil then
			cbx:set_state (false)
		end
	end
end

-----------------------------------------------------------------------------
-- Переименование

function tl_editor_unit_on_rename_all ()
	set_on_mouse_clicked ("tl_gui_prompt_ok", "tl_rename_all_unit_prompt_ok")
	ge_get ("tl_gui_prompt_caption"):set_caption ("Rename unit")
	ge_get ("tl_gui_prompt_label"):set_caption ("Unit name:")
	ge_get ("tl_gui_prompt_text"):set_caption ("")
	show_overlay ("TL/Prompt", true)
end

function tl_rename_all_unit_prompt_ok ()
	hide_overlay ("TL/Prompt")
	local newname = ge_get ("tl_gui_prompt_text"):get_caption ()
	tl_rename_all_selected (newname)
	tl_editor_update_selected_units_list ()
end

function tl_editor_unit_on_rename ()
	set_on_mouse_clicked ("tl_gui_prompt_ok", "tl_rename_unit_prompt_ok")
	ge_get ("tl_gui_prompt_caption"):set_caption ("Rename unit")
	ge_get ("tl_gui_prompt_label"):set_caption ("Unit name:")
	ge_get ("tl_gui_prompt_text"):set_caption ("")
	show_overlay ("TL/Prompt", true)
end

function tl_rename_unit_prompt_ok ()
	hide_overlay ("TL/Prompt")
	local newname = ge_get ("tl_gui_prompt_text"):get_caption ()
	tl_rename_all_selected (newname)
	tl_editor_update_selected_units_list ()
end

-----------------------------------------------------------------------------

function tl_gui_editor_update_terrain_info ()
	local lbx = get_listbox ("TL/Editor/Terrains/List")
	local terrain = tl_get_terrain (lbx:get_selected_caption (), false)
	if terrain ~= nil then
		ge_get ("TL/Editor/TerrainInfo/Name"):set_caption (terrain:get_name ())
		local pos = terrain:get_position ()
		ge_get ("TL/Editor/TerrainInfo/X"):set_caption (tostring (pos.x))
		ge_get ("TL/Editor/TerrainInfo/Y"):set_caption (tostring (pos.y))
		ge_get ("TL/Editor/TerrainInfo/Z"):set_caption (tostring (pos.z))
	else
		ge_get ("TL/Editor/TerrainInfo/X"):set_caption ("")
		ge_get ("TL/Editor/TerrainInfo/Y"):set_caption ("")
		ge_get ("TL/Editor/TerrainInfo/Z"):set_caption ("")
	end
end

-----------------------------------------------------------------------------

__shift_down = false
__alt_down = false
__curpos = {}

-----------------------------------------------------------------------------
-- Начать выделение

function tl_editor_begin_selection (evt)
	if evt:is_button_down (ME_BTN_MBUTTON0) then
		__selection_visible = true
		tl_begin_selection (evt)
		__shift_down = false
	end
end

-----------------------------------------------------------------------------
-- Продолжить выделение (растягивание рамки)

function tl_editor_continue_selection (evt)
	if __selection_visible and evt:is_button_down (ME_BTN_MBUTTON0) then
		tl_continue_selection (evt)
		__shift_down = evt:is_shift_down ()
		__alt_down = evt:is_alt_down ()
	end
end

-----------------------------------------------------------------------------
-- Закончить выделение

function tl_editor_end_selection (evt)
	if __selection_visible then
		__selection_visible = false
		tl_end_selection (evt)
		if not __shift_down and not __alt_down then
			tl_unselect_all (tl_get_my_player ())
		end
		tl_select_by_rect (UF_EDITABLE, __alt_down, false)
		tl_editor_update_selected_units_list ()
	end
end

-----------------------------------------------------------------------------
-- Возвращает название выделенной оси для вращения/перемещения

function tl_editor_get_axis ()
	if ge_get ("tl_gui_editor_ylock_selected"):is_visible () then
		return "y"
	else
		if ge_get ("tl_gui_editor_zlock_selected"):is_visible () then
			return "z"
		end
	end
	return "x"
end

-----------------------------------------------------------------------------
-- Перемещение объектов

function tl_editor_move_units (evt)
	local curpos = tovector ({x=evt:get_x ();y=evt:get_y ();z=evt:get_z ()})
	local delta = curpos-__curpos
	local axis = tl_editor_get_axis ()
	local multiplier = 25
	if evt:is_shift_down () then
		multiplier = 1
	else
		if evt:is_control_down () then
			multiplier = 5
		end
	end
	local cam_dir = tl_get_camera_dir ()
	cam_dir.y = 0
	cam_dir = normalise (cam_dir)
	local dpos = {x=0;y=0;z=0}
	if axis=="y" then
		dpos.y = -delta.y*15*multiplier
	else
		local Ox = crossproduct (cam_dir, {x=0;y=1;z=0})
		dpos.x = (Ox.x*delta.x-cam_dir.x*delta.y)*15*multiplier
		dpos.z = (Ox.z*delta.x-cam_dir.z*delta.y)*15*multiplier
	end
	tl_selection_drag_move ("TLUnit", dpos)
	tl_selection_drag_move ("StaticObject", dpos)
end

-----------------------------------------------------------------------------
-- Перемещение куска ландшафта

function tl_editor_move_terrain (evt)
	local curpos = tovector ({x=evt:get_x ();y=evt:get_y ();z=evt:get_z ()})
	local delta = curpos-__curpos
	local axis = tl_editor_get_axis ()
	local multiplier = 25
	if evt:is_shift_down () then
		multiplier = 1
	else
		if evt:is_control_down () then
			multiplier = 5
		end
	end
	local cam_dir = tl_get_camera_dir ()
	cam_dir.y = 0
	cam_dir = normalise (cam_dir)
	local terrain = tl_get_terrain (
		get_listbox ("TL/Editor/Terrains/List"):get_selected_caption ()
	)
	local pos = terrain:get_position ()
	if axis=="y" then
		pos.y = pos.y-delta.y*15*multiplier
	else
		local Ox = crossproduct (cam_dir, {x=0;y=1;z=0})
		pos.x = pos.x+(Ox.x*delta.x-cam_dir.x*delta.y)*15*multiplier
		pos.z = pos.z+(Ox.z*delta.x-cam_dir.z*delta.y)*15*multiplier
	end
	terrain:set_position (pos)
	tl_gui_editor_update_terrain_info ()
end

-----------------------------------------------------------------------------
-- Вращение объектов

function tl_editor_rotate_units (evt)
	local curpos = tovector ({x=evt:get_x ();y=evt:get_y ();z=evt:get_z ()})
	local delta = curpos-__curpos
	local axis = tl_editor_get_axis ()
	local multiplier = 25
	if evt:is_shift_down () then
		multiplier = 1
	else
		if evt:is_control_down () then
			multiplier = 5
		end
	end
	local angle = delta.y*50*multiplier
	if evt:is_alt_down () then
		if axis=="y" then
			tl_editor_group_yaw (angle)
		else
			if axis=="x" then
				tl_editor_group_pitch (angle)
			else
				if axis=="z" then
					tl_editor_group_roll (angle)
				end
			end
		end
	else
		if axis=="y" then
			tl_selection_drag_yaw ("TLUnit", angle)
			tl_selection_drag_yaw ("StaticObject", angle)
		else
			if axis=="x" then
				tl_selection_drag_pitch ("TLUnit", angle)
				tl_selection_drag_pitch ("StaticObject", angle)
			else
				if axis=="z" then
					tl_selection_drag_roll ("TLUnit", angle)
					tl_selection_drag_roll ("StaticObject", angle)
				end
			end
		end
	end
end

-----------------------------------------------------------------------------
-- Обработка нажатия кнопки мышки

function tl_editor_mainpanel_on_pressed (evt)
	__curpos = tovector ({x=evt:get_x ();y=evt:get_y ();z=evt:get_z ()})
	if ge_get ("tl_gui_editor_select_selected"):is_visible () then
		if __info_modes[__cur_info_mode] == "rivers" then
			if __river_cm then
				tl_editor_construct_river (evt)
			else
				tl_editor_begin_selection (evt)
			end
		else
			if __info_modes[__cur_info_mode] == "forests" then
				tl_editor_make_trees (evt)
			else
				tl_editor_begin_selection (evt)
			end
		end
	else
		if
			ge_get ("tl_gui_editor_move_selected"):is_visible ()
			or
			ge_get ("tl_gui_editor_rotate_selected"):is_visible ()
		then
			if __info_modes[__cur_info_mode] == "none" then
				tl_selection_drag_start ("StaticObject")
				tl_selection_drag_start ("TLUnit")
			end
		end
	end
end

-----------------------------------------------------------------------------
-- Обработка перемещения курсора

function tl_editor_mainpanel_on_dragged (evt)
	if ge_get ("tl_gui_editor_select_selected"):is_visible () then
		tl_editor_continue_selection (evt)
	else
		if ge_get ("tl_gui_editor_move_selected"):is_visible () then
			if __info_modes[__cur_info_mode] == "terrain" then
				tl_editor_move_terrain (evt)
			else
				if __info_modes[__cur_info_mode] == "rivers" then
					tl_editor_move_river_cp (evt)
				else
					tl_editor_move_units (evt)
				end
			end
		else
			if ge_get ("tl_gui_editor_rotate_selected"):is_visible () then
				tl_editor_rotate_units (evt)
			end
		end
	end
	__curpos = tovector ({x=evt:get_x ();y=evt:get_y ();z=evt:get_z ()})
end

-----------------------------------------------------------------------------
-- Обработка отпускания кнопки мышки

function tl_editor_mainpanel_on_released (evt)

	if not __selection_visible then
		tl_editor_stop_making_trees (evt)

		if
			ge_get ("tl_gui_editor_move_selected"):is_visible ()
			or
			ge_get ("tl_gui_editor_rotate_selected"):is_visible ()
		then
			if __info_modes[__cur_info_mode] == "none" then
				tl_selection_drag_end ("StaticObject")
				tl_selection_drag_end ("TLUnit")
			end
		end
		return
	end
	if ge_get ("tl_gui_editor_select_selected"):is_visible () then
		if __info_modes[__cur_info_mode] == "rivers" and not __river_cm then
			local lbx = get_listbox ("TL/Editor/Rivers/List")
			local river = tl_get_river (lbx:get_selected_caption ())
			if river ~= nil then
				river:select_by_rect (__shift_down)
				__selection_visible = false
				tl_end_selection (evt)
			end
		else
			tl_editor_end_selection (evt)
		end
	end
end

-----------------------------------------------------------------------------

function tl_gui_editor_check_xz ()
	local xlock  = ge_get ("tl_gui_editor_xlock_selected"):is_visible ()
	local ylock  = ge_get ("tl_gui_editor_ylock_selected"):is_visible ()
	local zlock  = ge_get ("tl_gui_editor_zlock_selected"):is_visible ()
	local move   = ge_get ("tl_gui_editor_move_selected"):is_visible ()
	local rotate = ge_get ("tl_gui_editor_rotate_selected"):is_visible ()

	if move==true then
		if ylock~=true then
			ge_get ("tl_gui_editor_xlock_selected"):show ()
			ge_get ("tl_gui_editor_zlock_selected"):show ()
			tl_add_message ("XZ axises selected together")
		end
	else
		if rotate==true then
			if xlock==true then
				ge_get ("tl_gui_editor_zlock_selected"):hide ()
			end
		else
			ge_get ("tl_gui_editor_xlock_selected"):hide ()
			ge_get ("tl_gui_editor_ylock_selected"):hide ()
			ge_get ("tl_gui_editor_zlock_selected"):hide ()
		end
	end
end

-----------------------------------------------------------------------------

function tl_gui_editor_select_on_click ()
	ge_get ("tl_gui_editor_select_selected"):show ()
	ge_get ("tl_gui_editor_move_selected"):hide ()
	ge_get ("tl_gui_editor_rotate_selected"):hide ()
	tl_add_message ("Selection mode activated")
	tl_gui_editor_check_xz ()
	tl_set_cursor ("TL/GUI/Cursor/Default")
end

-----------------------------------------------------------------------------

function tl_gui_editor_move_on_click ()
	ge_get ("tl_gui_editor_select_selected"):hide ()
	ge_get ("tl_gui_editor_move_selected"):show ()
	ge_get ("tl_gui_editor_rotate_selected"):hide ()
	tl_add_message ("Translation mode activated")
	tl_gui_editor_check_xz ()
	tl_set_cursor ("TL/GUI/Cursor/EditorMove")
end

-----------------------------------------------------------------------------

function tl_gui_editor_rotate_on_click ()
	ge_get ("tl_gui_editor_select_selected"):hide ()
	ge_get ("tl_gui_editor_move_selected"):hide ()
	ge_get ("tl_gui_editor_rotate_selected"):show ()
	tl_add_message ("Rotation mode activated")
	tl_gui_editor_check_xz ()
	tl_set_cursor ("TL/GUI/Cursor/EditorRotate")
end

-----------------------------------------------------------------------------

function tl_gui_editor_xlock_on_click ()
	ge_get ("tl_gui_editor_xlock_selected"):show ()
	ge_get ("tl_gui_editor_ylock_selected"):hide ()
	ge_get ("tl_gui_editor_zlock_selected"):hide ()
	tl_add_message ("X axis selected")
	tl_gui_editor_check_xz ()
end

-----------------------------------------------------------------------------

function tl_gui_editor_ylock_on_click ()
	ge_get ("tl_gui_editor_xlock_selected"):hide ()
	ge_get ("tl_gui_editor_ylock_selected"):show ()
	ge_get ("tl_gui_editor_zlock_selected"):hide ()
	tl_add_message ("Y axis selected")
	tl_gui_editor_check_xz ()
end

-----------------------------------------------------------------------------

function tl_gui_editor_zlock_on_click ()
	ge_get ("tl_gui_editor_xlock_selected"):hide ()
	ge_get ("tl_gui_editor_ylock_selected"):hide ()
	ge_get ("tl_gui_editor_zlock_selected"):show ()
	tl_add_message ("Z axis selected")
	tl_gui_editor_check_xz ()
end

-----------------------------------------------------------------------------
-- !!! UGLY HACK !!!
-- TODO: Устанавливать видимость в определении оверлея

ge_get ("tl_gui_editor_select_selected"):show ()
ge_get ("tl_gui_editor_move_selected"):hide ()
ge_get ("tl_gui_editor_rotate_selected"):hide ()
ge_get ("tl_gui_editor_xlock_selected"):hide ()
ge_get ("tl_gui_editor_ylock_selected"):hide ()
ge_get ("tl_gui_editor_zlock_selected"):hide ()

------------------------------------------------------------------------------

function tl_editor_group_selection (name)
	tl_group_selection (tl_get_my_player (), name)
end

------------------------------------------------------------------------------

function tl_editor_select_group (name)
	tl_unselect_all (tl_get_my_player ())
	tl_select_group (tl_get_my_player (), name)
	units = tl_get_group_units (tl_get_my_player (), name)
	local unit_count = table.getn (units)
	for i = 1, unit_count do
		units[i]:show_axes (true)
	end
	tl_editor_update_selected_units_list ()
end

------------------------------------------------------------------------------
-- Выравнивание объекта по ландшафту

function tl_editor_align_to_terrain ()
	if __info_modes[__cur_info_mode] == "rivers" then
		local lbx = get_listbox ("TL/Editor/Rivers/List")
		local river = tl_get_river (lbx:get_selected_caption ())
		if river ~= nil then
			river:align_to_terrain (-1, 1)
		end
	else
		local objects = tl_get_selected_objects ()
		local object_count = table.getn (objects)
		if object_count>0 then
			tl_editor_undo_block ()
		end
		for i = 1, object_count do
			local p = objects[i]:get_position ()
			p.y = 1000
			local queryResult = tl_terrain_ray_query (p, {x=0;y=-1;z=0}, true)
			if queryResult.intersects then
				if queryResult.point.y<0 then
					queryResult.point.y = 0
				end
				objects[i]:set_position (queryResult.point)
				CONSOLE:println ("Intersection found")
				CONSOLE:println ("x="..queryResult.point.y.." y="..queryResult.point.y.." z="..queryResult.point.z)
			else
				p.y = 0
				objects[i]:set_position (p)
				CONSOLE:println ("Intersection is not found")
				CONSOLE:println ("x="..p.y.." y="..p.y.." z="..p.z)
			end
		end
	end
end

------------------------------------------------------------------------------

__info_modes = {
	"none";
	"unit";
	"terrain";
	"rivers";
	"forests";
}
__cur_info_mode = 1

------------------------------------------------------------------------------

function tl_editor_info_none_show ()
end

------------------------------------------------------------------------------

function tl_editor_info_none_hide ()
end

------------------------------------------------------------------------------

function tl_editor_info_unit_show ()
	ge_get ("TL/Editor/SelectedUnits"):show ()
	ge_get ("TL/Editor/UnitInfo"):show ()
end

------------------------------------------------------------------------------

function tl_editor_info_unit_hide ()
	ge_get ("TL/Editor/SelectedUnits"):hide ()
	ge_get ("TL/Editor/UnitInfo"):hide ()
end

------------------------------------------------------------------------------

function tl_editor_info_terrain_show ()
	tl_editor_update_terrain_list ()
	ge_get ("TL/Editor/Terrains"):show ()
	ge_get ("TL/Editor/TerrainInfo"):show ()
end

------------------------------------------------------------------------------

function tl_editor_info_terrain_hide ()
	ge_get ("TL/Editor/Terrains"):hide ()
	ge_get ("TL/Editor/TerrainInfo"):hide ()
end

------------------------------------------------------------------------------

function tl_editor_info_rivers_show ()
	tl_editor_update_rivers_list ()
	ge_get ("TL/Editor/Rivers"):show ()
	ge_get ("TL/Editor/RiverInfo"):show ()
end

------------------------------------------------------------------------------

function tl_editor_info_rivers_hide ()
	ge_get ("TL/Editor/Rivers"):hide ()
	ge_get ("TL/Editor/RiverInfo"):hide ()
	local lbx = get_listbox ("TL/Editor/Rivers/List")
	local river = tl_get_river (lbx:get_selected_caption ())
	if river ~= nil then
		river:unselect ()
	end
end

------------------------------------------------------------------------------

function tl_editor_info_forests_show ()
	tl_editor_update_forests_list ()
	ge_get ("TL/Editor/Forests"):show ()
	ge_get ("TL/Editor/ForestInfo"):show ()
end

------------------------------------------------------------------------------

function tl_editor_info_forests_hide ()
	ge_get ("TL/Editor/Forests"):hide ()
	ge_get ("TL/Editor/ForestInfo"):hide ()
end

------------------------------------------------------------------------------

function tl_editor_switch_info ()
	local func, errmsg
	func, errmsg = loadstring (
		"tl_editor_info_"..__info_modes[__cur_info_mode].."_hide ()"
	)
	if func==nil then
		log_message (errmsg)
		return
	end
	func ()
	__cur_info_mode = math.mod (__cur_info_mode, table.getn (__info_modes))+1
	func, errmsg = loadstring (
		"tl_editor_info_"..__info_modes[__cur_info_mode].."_show ()"
	)
	if func==nil then
		log_message (errmsg)
		return
	end
	func ()
end

------------------------------------------------------------------------------
-- Сохранение/загрузка выбранных юнитов

function tl_save_selection_prompt_ok ()
	hide_overlay ("TL/Prompt")
	local units = tl_get_selected_units (tl_get_my_player ())
	local unit_count = table.getn (units)
	if unit_count == 0 then
		return
	end
	local file_name = ge_get ("tl_gui_prompt_text"):get_caption ()
	local selection_obj = OBJECT:create (TYPEID.object, file_name)
	local avg_pos = {x=0;y=0;z=0}
	for i = 1, unit_count do
		local pos = units[i]:get_position ()
		avg_pos.x = avg_pos.x + pos.x
		avg_pos.y = avg_pos.y + pos.y
		avg_pos.z = avg_pos.z + pos.z
	end
	avg_pos.x = avg_pos.x/unit_count
	avg_pos.y = avg_pos.y/unit_count
	avg_pos.z = avg_pos.z/unit_count
	for i = 1, unit_count do
		local unit_obj = selection_obj:create (TYPEID.object, units[i]:get_name ())
		unit_obj:create (TYPEID.string, "Prototype"):set_value (
			units[i]:get_prototype ()["OriginalPrototype"]:get_value ()
		)
		local pos = units[i]:get_position ()
		local pos_obj = unit_obj:create (TYPEID.object, "Position")
		pos_obj:create (TYPEID.float, "X"):set_value (tostring (pos.x-avg_pos.x))
		pos_obj:create (TYPEID.float, "Y"):set_value (tostring (pos.y-avg_pos.y))
		pos_obj:create (TYPEID.float, "Z"):set_value (tostring (pos.z-avg_pos.z))
	end
	save_object ("../data/maps/"..file_name..".ugr", selection_obj)
	OBJECT:remove (file_name)
end

------------------------------------------------------------------------------

function tl_save_selection_prompt ()
	set_on_mouse_clicked ("tl_gui_prompt_ok", "tl_save_selection_prompt_ok")
	ge_get ("tl_gui_prompt_caption"):set_caption ("Save Selection")
	ge_get ("tl_gui_prompt_label"):set_caption ("File name:")
	show_overlay ("TL/Prompt", true)
end

------------------------------------------------------------------------------

function tl_save_units_for_mission_scr ()
	set_on_mouse_clicked ("tl_gui_prompt_ok", "tl_save_units_for_mission")
	ge_get ("tl_gui_prompt_caption"):set_caption ("Save units for mission")
	ge_get ("tl_gui_prompt_label"):set_caption ("File name:")
	show_overlay ("TL/Prompt", true)
end

------------------------------------------------------------------------------

function tl_load_mission_scr ()
	set_on_mouse_clicked ("tl_gui_prompt_ok", "tl_load_mission_from_file")
	ge_get ("tl_gui_prompt_caption"):set_caption ("Load mission")
	ge_get ("tl_gui_prompt_label"):set_caption ("File name:")
	show_overlay ("TL/Prompt", true)
end

function tl_save_mission_info_scr ()
	tl_create_mission_info_cancel ()
	set_on_mouse_clicked ("tl_gui_prompt_ok", "tl_save_mission_info_ok")
	ge_get ("tl_gui_prompt_caption"):set_caption ("Save mission info")
	ge_get ("tl_gui_prompt_label"):set_caption ("File name:")
	show_overlay ("TL/Prompt", true)
end

function tl_mission_info_begin_click ()
	local lbx = get_listbox ("TL/Editor/BeginMission/listField")
	tl_create_mission_info (1, lbx:get_selected_caption ())
end

function tl_mission_info_end_click ()
	local lbx = get_listbox ("TL/Editor/EndMission/listField")
	tl_create_mission_info (2, lbx:get_selected_caption ())
end

function tl_mission_info_win_click ()
	local lbx = get_listbox ("TL/Editor/WinMission/listField")
	tl_create_mission_info (3, lbx:get_selected_caption ())
end

function tl_mission_info_func_click ()
	local lbx = get_listbox ("TL/Editor/FuncList/listField")
	tl_create_mission_info (4, lbx:get_selected_caption ())
end

function tl_create_mission_info_cancel ()
	hide_overlay ("TL/Editor/CreateMission")
	__create_mis_dlg_ = false
end

------------------------------------------------------------------------------
-- Создание диалога для заполнения инфы о миссии

__create_mis_dlg_ = false

function tl_create_mission_info_scr ()
	if __create_mis_dlg_ == false then
		set_on_mouse_clicked ("tl_gui_editor_mis_ok", "tl_save_mission_info_scr")
		set_on_mouse_clicked ("tl_gui_editor_mis_cancel", "tl_create_mission_info_cancel")
		set_on_mouse_clicked ("TL/Editor/BeginMission/listField", "tl_mission_info_begin_click")
		set_on_mouse_clicked ("TL/Editor/EndMission/listField", "tl_mission_info_end_click")
		set_on_mouse_clicked ("TL/Editor/WinMission/listField", "tl_mission_info_win_click")
		set_on_mouse_clicked ("TL/Editor/FuncList/listField", "tl_mission_info_func_click")
		ge_get ("tl_gui_editor_mis_caption"):set_caption ("Create mission info")
		tl_create_mission_info (0, "")
		show_overlay ("TL/Editor/CreateMission", true)
		__create_mis_dlg_ = true
	end
end

------------------------------------------------------------------------------

function tl_load_selection_prompt_ok ()
	hide_overlay ("TL/Prompt")
	local file_name = ge_get ("tl_gui_prompt_text"):get_caption ()
	file_name = "../data/maps/"..file_name..".ugr"
	local selection_obj = restore_object (file_name)
	if selection_obj==nil then
		log_message ("Can't load file "..file_name.."!!!")
		return
	end
	local objects = selection_obj:get_attributes ()
	local objects_count = table.getn (objects)
	local v = tovector (tl_get_camera_pos(nil)) + tovector (tl_get_camera_dir ())*100.
	tl_unselect_all (tl_get_my_player ())
	for i = 1, objects_count do
		local pos = {}
		pos.x = v.x + tonumber (objects[i]["Position.X"]:get_value ())
		pos.y = v.y + tonumber (objects[i]["Position.Y"]:get_value ())
		pos.z = v.z + tonumber (objects[i]["Position.Z"]:get_value ())
		local u = tl_create_unit (objects[i]["Prototype"]:get_value (), get_unique_string (), pos.x, pos.y, pos.z)
		tl_select_unit (tl_get_my_player (), u:get_name ())
		u:show_axes (true)
	end
	OBJECT:remove (selection_obj:get_name ())
end

------------------------------------------------------------------------------

function tl_load_selection_prompt ()
	set_on_mouse_clicked ("tl_gui_prompt_ok", "tl_load_selection_prompt_ok")
	ge_get ("tl_gui_prompt_caption"):set_caption ("Load Selection")
	ge_get ("tl_gui_prompt_label"):set_caption ("File name:")
	show_overlay ("TL/Prompt", true)
end

------------------------------------------------------------------------------

y_bias = 0.1

function tl_editor_shuffle_y_pos_selected ()
	local objects = tl_get_selected_objects ()
	local object_count = table.getn (objects)

	for i = 1, object_count do
		local pos = objects[i]:get_position ()
		pos.y = pos.y + math.random (-y_bias, y_bias)
		objects[i]:set_position (pos)
	end
end

------------------------------------------------------------------------------
function tl_editor_shuffle_y_pos_all ()
	local objects = tl_get_all_objects ()
	local object_count = table.getn (objects)

	for i = 1, object_count do
		local pos = objects[i]:get_position ()
		pos.y = pos.y + math.random (-y_bias, y_bias)
		objects[i]:set_position (pos)
	end
end

------------------------------------------------------------------------------

__editor_visible = false

function tl_show_editor ()
	log_message ("tl_show_editor ()")
	show_overlay ("TL/Editor", false)
	__editor_visible = true
	unbind_group ("TL/EditorBindings")
	begin_group ("TL/EditorBindings")
		
		-- Режим выделения
		bind_key (KC_V, "tl_gui_editor_select_on_click ()", 250)
		
		-- Снятие выделения
		bind_key (KC_B, "tl_unselect_all (tl_get_my_player ());tl_editor_update_selected_units_list ()", 250)
		
		-- Режим перемещения
		bind_key (KC_T, "tl_gui_editor_move_on_click ()", 250)
		
		-- Режим вращения
		bind_key (KC_R, "tl_gui_editor_rotate_on_click ()", 250)
		
		-- Клонирование
		bind_key (KC_C, "tl_gui_clone_unit ()", 250)
		
		-- Новый юнит
		bind_key (KC_N, "tl_gui_show_new_object_dialog ()", 250)
		
		-- Удаление
		bind_key (KC_DELETE, "tl_gui_delete_unit ()", 250)
		
		-- Выбор осей
		bind_key (KC_X, "tl_gui_editor_xlock_on_click ()", 250)
		bind_key (KC_Y, "tl_gui_editor_ylock_on_click ()", 250)
		bind_key (KC_Z, "tl_gui_editor_zlock_on_click ()", 250)
		
		-- Группировка
		bind_key ({KC_LCONTROL, KC_1}, "tl_editor_group_selection (\"default_1\")", 250)
		bind_key ({KC_LCONTROL, KC_2}, "tl_editor_group_selection (\"default_2\")", 250)
		bind_key ({KC_LCONTROL, KC_3}, "tl_editor_group_selection (\"default_3\")", 250)
		bind_key ({KC_LCONTROL, KC_4}, "tl_editor_group_selection (\"default_4\")", 250)
		bind_key ({KC_LCONTROL, KC_5}, "tl_editor_group_selection (\"default_5\")", 250)
		bind_key ({KC_LCONTROL, KC_6}, "tl_editor_group_selection (\"default_6\")", 250)
		bind_key ({KC_LCONTROL, KC_7}, "tl_editor_group_selection (\"default_7\")", 250)
		bind_key ({KC_LCONTROL, KC_8}, "tl_editor_group_selection (\"default_8\")", 250)
		bind_key ({KC_LCONTROL, KC_9}, "tl_editor_group_selection (\"default_9\")", 250)
		bind_key ({KC_LCONTROL, KC_0}, "tl_editor_group_selection (\"default_0\")", 250)
		
		-- Выделение группы
		bind_key (KC_1, "tl_editor_select_group (\"default_1\")", 250)
		bind_key (KC_2, "tl_editor_select_group (\"default_2\")", 250)
		bind_key (KC_3, "tl_editor_select_group (\"default_3\")", 250)
		bind_key (KC_4, "tl_editor_select_group (\"default_4\")", 250)
		bind_key (KC_5, "tl_editor_select_group (\"default_5\")", 250)
		bind_key (KC_6, "tl_editor_select_group (\"default_6\")", 250)
		bind_key (KC_7, "tl_editor_select_group (\"default_7\")", 250)
		bind_key (KC_8, "tl_editor_select_group (\"default_8\")", 250)
		bind_key (KC_9, "tl_editor_select_group (\"default_9\")", 250)
		bind_key (KC_0, "tl_editor_select_group (\"default_0\")", 250)
		
		-- заполнить информацию о миссии
		bind_key ({KC_LCONTROL, KC_F5}, "tl_save_units_for_mission_scr ()", 250)
		bind_key ({KC_LCONTROL, KC_F6}, "tl_create_mission_info_scr ()", 250)
		bind_key ({KC_LCONTROL, KC_F7}, "tl_load_mission_scr ()", 250)
		bind_key ({KC_LCONTROL, KC_F2}, "tl_save_selection_prompt ()", 250)
		bind_key ({KC_LCONTROL, KC_F3}, "tl_load_selection_prompt ()", 250)
		bind_key ({KC_LCONTROL, KC_T}, "tl_editor_align_to_terrain ()", 250)
		
		-- Всякая ботва
		bind_key (KC_TAB, "tl_editor_switch_info ()", 250)
		bind_key (KC_F2, "tl_save_units_prompt ()", 250)
		bind_key (KC_F3, "tl_load_units_prompt ()", 250)
		
		-- Показать/спрятать интерфейс редактора
		-- bind_key (KC_F9, "if __editor_visible then tl_hide_editor () else tl_show_editor () end", 250)
		
		-- Перезагрузка редактора
		bind_key ({KC_LCONTROL, KC_END}, "switch_module (\"TacticLevel\")", 250)
		bind_key ({KC_RCONTROL, KC_END}, "switch_module (\"TacticLevel\")", 250)
		
		-- Показать ландшафт без альфы
		--bind_key ({KC_LCONTROL, KC_F12, priority=1}, "tl_switch_terrain_alpha ()", 250)

		bind_key ({KC_LCONTROL, KC_LSHIFT, KC_LMENU, KC_N}, "tl_editor_shuffle_y_pos_selected ()", 250)

		bind_key ({KC_LCONTROL, KC_TAB}, "tl_editor_get_invalid(1)", 250)
		bind_key ({KC_LCONTROL, KC_LSHIFT, KC_TAB}, "tl_editor_get_invalid(-1)", 250)

	end_group ()
end

------------------------------------------------------------------------------

function tl_hide_editor ()
	hide_overlay ("TL/Editor")
	__editor_visible = false
	unbind_group ("TL/EditorBindings")
	tl_unselect_all (tl_get_my_player ())
	tl_set_cursor ("TL/GUI/Cursor/Default")
end

------------------------------------------------------------------------------

function tl_add_plane_airstrip_dlg_cancel ()
	hide_overlay ("TL/Editor/AddPlaneAirstripDialog")
end

------------------------------------------------------------------------------

function tl_add_plane_airstrip_dlg ()
	set_on_mouse_clicked ("tl_gui_add_ok", "tl_add_plane_airstrip_dlg_ok")
	set_on_mouse_clicked ("tl_gui_add_cancel", "tl_add_plane_airstrip_dlg_cancel")
	ge_get ("tl_gui_addplane_count_text"):set_caption ("")
	show_overlay ("TL/Editor/AddPlaneAirstripDialog", false)
end

------------------------------------------------------------------------------

function tl_editor_get_invalid(dir)
	if dir ~= -1 then
		dir = 1
	end
	mis_log_message("dir = "..dir)

	local prev = nil
	for i, obj in ipairs(tl_get_selected_objects()) do
		local next = obj:get_name()
		if prev == nil or prev < next then
			prev = next
		end
	end
	
	tl_unselect_all(tl_get_my_player())
	
	local objects = tl_get_all_objects()
	local object_count = table.getn(objects)
	if object_count < 1 then
		return
	end

	local camdist = 100
	
	if prev == nil then
		if dir > 0 then
			prev = object_count + 1
		else
			prev = 0
		end
	else
		for i, obj in ipairs(objects) do
			if obj:get_name() == prev then
				camdist = tovector(obj:get_position()) - tovector(tl_get_camera_pos(nil))
				camdist = math.sqrt(camdist.x*camdist.x + camdist.y*camdist.y + camdist.z*camdist.z);
				prev = i
				break
			end
		end
	end
	mis_log_message("prev = "..prev)
	local next = prev
	while true do
		next = next + dir
		if next == prev then break end
		if next > object_count then
			next = 1
		elseif next < 1 then
			next = object_count
		end
		mis_log_message("next = "..next)

		local obj = objects[next]
		local pos = obj:get_position()
		local diff = pos.y - tl_get_height_at(pos.x,pos.z) 
		if math.abs(diff) > 10 then
			mis_log_message("object's \""..obj:get_name().."\" height difference is "..diff.." at {"..pos.x..","..pos.z.."}")
			local unit = tl_get_unit(obj:get_name())
			if unit ~= nil then
				tl_select_unit(tl_get_my_player(), obj:get_name())
				local sel = tl_get_selected_objects()
				if table.getn(sel) < 1 then
					obj = nil
				end
			else
				tl_select_object(obj:get_name())
			end
			if obj ~= nil then
				tl_move_camera_to(tovector(pos) - tovector(tl_get_camera_dir())*camdist)
				return
			end
		end
	end
end

------------------------------------------------------------------------------
-- Подцепляем события

set_on_mouse_clicked ("TL/Editor/SelectedUnits/List", "tl_gui_editor_update_unit_info")
set_on_mouse_clicked ("TL/Editor/Terrains/List", "tl_gui_editor_update_terrain_info")
set_on_mouse_clicked ("TL/Editor/Rivers/List", "tl_gui_editor_update_river_info")
set_on_mouse_clicked ("TL/Editor/Forests/List", "tl_gui_editor_update_forest_info")

set_on_mouse_clicked ("TL/Editor/Unit/Nomove", "tl_gui_editor_do_select_no_move")
set_on_mouse_clicked ("TL/Editor/Unit/Canmove", "tl_gui_editor_do_select_can_move")

set_on_mouse_clicked ("TL/Editor/UnitInfo/IsBuilding", "tl_gui_editor_toggle_building")

enable_events ("tl_gui_editor_select")
enable_events ("tl_gui_editor_move")
enable_events ("tl_gui_editor_rotate")

enable_events ("tl_gui_editor_xlock")
enable_events ("tl_gui_editor_ylock")
enable_events ("tl_gui_editor_zlock")

set_on_mouse_pressed ("TL/Editor/MainPanel", "tl_editor_mainpanel_on_pressed")
set_on_mouse_dragged ("TL/Editor/MainPanel", "tl_editor_mainpanel_on_dragged")
set_on_mouse_released ("TL/Editor/MainPanel", "tl_editor_mainpanel_on_released")

set_on_mouse_clicked ("TL/Editor/Unit/Rename", "tl_editor_unit_on_rename")
set_on_mouse_clicked ("TL/Editor/Unit/RenameAll", "tl_editor_unit_on_rename_all")

--set_on_mouse_clicked ("tl_gui_editor_plane_to_airstrip", "tl_add_plane_airstrip_dlg")

set_on_mouse_clicked ("tl_gui_editor_new", "tl_gui_show_new_object_dialog")
set_on_mouse_clicked ("tl_gui_editor_clone", "tl_gui_clone_unit")
set_on_mouse_clicked ("tl_gui_editor_delete", "tl_gui_delete_unit")
set_on_mouse_clicked ("tl_gui_editor_new_cancel", "tl_gui_hide_new_object_dialog")
set_on_mouse_clicked ("tl_gui_editor_add_unit_cancel", "tl_gui_hide_new_object_dialog")
set_on_mouse_clicked ("tl_gui_editor_new_ok", "tl_gui_create_unit")
set_on_mouse_clicked ("tl_gui_editor_add_unit_ok", "tl_add_unit_ok_scr")
--set_on_mouse_clicked ("tl_gui_ship_unit_list", "tl_ship_unit_list_ok_scr")
--set_on_mouse_clicked ("tl_gui_airplane_unit_list", "tl_airplane_unit_list_ok_scr")
set_on_mouse_clicked ("tl_gui_editor_add_unit_change_player", "tl_add_unit_change_player_click")
set_on_mouse_clicked ("tl_gui_editor_new_units", "tl_gui_editor_new_units_click")
set_on_mouse_clicked ("tl_gui_editor_new_objects", "tl_gui_editor_new_objects_click")
set_button_press_state ("tl_gui_editor_new_objects", true)

set_on_mouse_clicked ("tl_gui_prompt_cancel", "tl_gui_prompt_cancel")

tl_editor_switch_river_cm ()


-----------------------------------------------------------------------------


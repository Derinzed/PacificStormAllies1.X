------------------------------------------------------------------------------
-- Copyright (c) Lesta Studio, 2003
------------------------------------------------------------------------------

log_message ("Executing TL init script tlinit.lua")

require ("res://common.lua")
require ("res://tl_common.lua")
require ("res://tl_load_map.lua")
require ("res://tl_save_map.lua")
require ("res://tl_select_map.lua")
--For MovieEditor
require("res://tl_movie_editor.lua")

-- disable all light buttons
set_light_gui_element ('TL/Main/ActionBtn/TopLeft', false)
set_light_gui_element ('TL/Main/ActionBtn/Top', false)
set_light_gui_element ('TL/Main/ActionBtn/TopRight', false)
set_light_gui_element ('TL/Main/ActionBtn/Bottom', false)
set_light_gui_element ('TL/Main/ActionBtn/BottomLeft', false)
set_light_gui_element ('TL/Main/ActionBtn/BottomRight', false)
set_light_gui_element ('TL/Main/ActionBtn/Left', false)
set_light_gui_element ('TL/Main/ActionBtn/Center', false)
set_light_gui_element ('TL/Main/ActionBtn/Right', false)
set_light_gui_element ('TL/Main/UnitInfo/Use', false)
set_light_gui_element ('TL/Main/Minimap/Hide', false)
set_light_gui_element ('TL/Main/Minimap/Pause2', false)
set_light_gui_element ('TL/Main/Minimap/Menu2', false)
set_light_gui_element ('TL/Main/Minimap/MissionInfo2', false)
--set_light_gui_element ('TL/Main/Minimap/Retreat2', false)
set_light_gui_element ('TL/Main/Minimap/Strateg2', false)
set_light_gui_element ('TL/Main/Minimap/Show', false)
set_light_gui_element ('TL/Main/Minimap/Pause1', false)
set_light_gui_element ('TL/Main/Minimap/Menu1', false)
set_light_gui_element ('TL/Main/Minimap/MissionInfo1', false)
set_light_gui_element ("GameMenu/Return", false)
set_script_func ('')
set_script_func_mouse ('')


--set_light_gui_element ('TL/Main/Minimap/Retreat1', false)
--set_light_gui_element ('TL/Main/Minimap/Strateg1', false)

game_timer_pos_y = 20
game_timer_pos_x = 220

function m ()
--[[
	tl_add_nine_planes ('A6M',{pid=0;pos={x=-14973;y=500;z=300};dir={x=-131;y=0;z=3};dist=30;dmove=4000;kamikadze=true})
	tl_add_nine_planes ('D4Y',{pid=0;pos={x=-15000;y=500;z=500};dir={x=-131;y=0;z=3};dist=30;dmove=4000;kamikadze=true})

	tl_add_romb_plane ("A6M",{pid=0;pos={x=-10815;y=500;z=33};dir={x=-131;y=0;z=3};dist=30;dmove=40;kamikadze=true})
	tl_add_romb_plane ("D4Y",{pid=0;pos={x=-10815;y=500;z=133};dir={x=-131;y=0;z=3};dist=30;dmove=40;kamikadze=true})
	tl_set_sky_dome_texture ("SkyDomeMission")

	tl_link_camera_to_last_plane (0)
]]
	showProgress (10)
	tl_add_romb_plane ('B5N',{pid=0;pos={x=0;y=500;z=0};dir={x=1;y=0;z=1};dist=30;dmove=40})
	tl_add_romb_plane ('B5N',{pid=0;pos={x=300;y=700;z=300};dir={x=1;y=0;z=1};dist=30;dmove=40})
	__create_ai_unit (1,'benson', 1):set_position ({x=1000;y=0;z=1000})
	__create_ai_unit (1,'benson', 1):set_position ({x=1200;y=0;z=1200})
	hideProgress ()
--[[
	local pr = tl_get_progress_bar ()
	tl_set_paused (true, true)
	pr:set_position (0, 0)
	pr:set_visible (true)
	tl_add_nine_planes ('A6M',{pid=0;pos={x=0;y=500;z=0};dir={x=1;y=0;z=1};dist=30;dmove=50000})
	pr:set_visible (false)
	tl_set_paused (false, false)
]]
end

function sendUnitsInAttack (units, attackunits)
	local unit_count = table.getn (units)
	for i=1, unit_count do
		units[i]:attack_targets (attackunits)
	end
end

function vSC()
	obj = tl_get_shadow_color ()
	log_message (obj.r.." "..obj.g.." "..obj.b.." "..obj.a)
end

--CONSOLE:show (true) -- для отладки
update_progress (.0)


------------------------------------------------------------------------------
-- Вывод в консоль имени используемого рендерера
------------------------------------------------------------------------------

success, msg = pcall (

  function ()

    log_message (
      "Loader.Release.RenderSystem = "..CONFIG["Loader.Release.RenderSystem"]:get_value ()
    )

  end

)

if not success then
  log_message (debug.traceback ("ERROR: "..msg))
end


------------------------------------------------------------------------------
-- Инициализация комбинаций клавиш.
------------------------------------------------------------------------------

success, msg = pcall (loadfile ("../data/scripts/tl_keybindings.lua"))

if not success then
  log_message (debug.traceback ("ERROR: "..msg))
end


------------------------------------------------------------------------------
-- Инициализация всего остального.
------------------------------------------------------------------------------

-- Загружаем TLMaps
restore_object (CONFIG["TLevel.PathToMaps"]:get_value ().."tlmaps.xml")

gui_initscript = CONFIG["TLevel.GUIInitScript"]:get_value ()

if (EDITOR_MODE==true) then
	gui_initscript = CONFIG["TLevel.EditorInitScript"]:get_value ()
	restore_object ("res://editorobjects.xml")
end

log_message ("Initialising GUI...")

success, msg = pcall (loadfile (gui_initscript))

if not success then
  log_message (debug.traceback ("ERROR: "..msg))
end

------------------------------------------------------------------------------
-- Прячем консоль.
------------------------------------------------------------------------------

--CONSOLE:hide ()

------------------------------------------------------------------------------
-- Создание юнита.
------------------------------------------------------------------------------
ai_root_name = "AI_ROOT_"
ai_root_0 = tl_create_ai_node (0, nil, "", ai_root_name..0)
ai_root_1 = tl_create_ai_node (1, nil, "", ai_root_name..1)
ai_root_2 = tl_create_ai_node (2, nil, "", ai_root_name..2)
ai_root_3 = tl_create_ai_node (3, nil, "", ai_root_name..3)
ai_root_4 = tl_create_ai_node (4, nil, "", ai_root_name..4)
ai_root_5 = tl_create_ai_node (5, nil, "", ai_root_name..5)
ai_root_6 = tl_create_ai_node (6, nil, "", ai_root_name..6)
ai_root_7 = tl_create_ai_node (7, nil, "", ai_root_name..7)

--create new ai order
function __create_ai_order (player_id)
  if player_id == 2 then
    ai_root_2 = tl_create_ai_node (2, nil, "", autoname ())
  end
  if player_id == 1 then
    ai_root_1 = tl_create_ai_node (1, nil, "", autoname ())
  end
  if player_id == 0 then
    ai_root_0 = tl_create_ai_node (0, nil, "", autoname ())
  end
end

function __create_all_japan_units (ax, ay, az)
--japan ships
	un = __create_ai_unit (1, 'yamato', 1)
	un:set_position ({x=ax+0;y=ay;z=az+0})

	un = __create_ai_unit (1, 'agano', 1)
	un:set_position ({x=ax+500;y=ay;z=az+0})

	un = __create_ai_unit (1, 'akagi', 1)
	un:set_position ({x=ax+500;y=ay;z=az+500})

	un = __create_ai_unit (1, 'akitsuki', 1)
	un:set_position ({x=ax;y=ay;z=az+500})

	__create_ai_unit (1, 'Daihatsu', 1)
	__create_ai_unit (1, 'desbot_jap', 1)
	__create_ai_unit (1, 'transport_jap', 1)
	__create_ai_unit (1, 'mogami', 1)
	__create_ai_unit (1, 'evarts_jap', 1)
	__create_ai_unit (1, 'taiho', 1)
	__create_ai_unit (1, 'zuikaku', 1)
--japan airplanes
	__create_ai_unit (1, 'a6m', 0)
	__create_ai_unit (1, 'a7m', 0)
	__create_ai_unit (1, 'b5n', 0)
	__create_ai_unit (1, 'b7a', 0)
	__create_ai_unit (1, 'd3a', 0)
	__create_ai_unit (1, 'd4y', 0)
	__create_ai_unit (1, 'f1m', 0)
	__create_ai_unit (1, 'g4m', 0)
	__create_ai_unit (1, 'g8n', 0)
	__create_ai_unit (1, 'h8k', 0)
	__create_ai_unit (1, 'j7w', 0)
	__create_ai_unit (1, 'ki21', 0)
	__create_ai_unit (1, 'ki43', 0)
	__create_ai_unit (1, 'ki61', 0)
	__create_ai_unit (1, 'ki84', 0)
	__create_ai_unit (1, 'n1k', 0)
	__create_ai_unit (1, 'p1y', 0)
end


function __create_all_usa_units ()
--usa ships
	__create_ai_unit (1, 'baltimor', 1)
	__create_ai_unit (1, 'benson', 1)
	__create_ai_unit (1, 'casablanca', 1)
	__create_ai_unit (1, 'cleveland', 1)
	__create_ai_unit (1, 'colorado', 1)
	__create_ai_unit (1, 'esseks', 1)
	__create_ai_unit (1, 'evarts', 1)
	__create_ai_unit (1, 'fletcher', 1)
	__create_ai_unit (1, 'iowa', 1)
	__create_ai_unit (1, 'desbot_usa', 1)
	__create_ai_unit (1, 'lexington', 1)
	__create_ai_unit (1, 'transport_usa', 1)
	__create_ai_unit (1, 'tanker_usa', 1)
--usa airplanes
	__create_ai_unit (1, 'b24', 0)
	__create_ai_unit (1, 'b17', 0)
	__create_ai_unit (1, 'b25at', 0)
	__create_ai_unit (1, 'b29', 0)
	__create_ai_unit (1, 'f4f', 0)
	__create_ai_unit (1, 'f4u', 0)
	__create_ai_unit (1, 'f6f', 0)
	__create_ai_unit (1, 'os2u', 0)
	__create_ai_unit (1, 'p38', 0)
	__create_ai_unit (1, 'p39', 0)
	__create_ai_unit (1, 'p40', 0)
	__create_ai_unit (1, 'p47', 0)
	__create_ai_unit (1, 'p51', 0)
	__create_ai_unit (1, 'p80', 0)
	__create_ai_unit (1, 'pby', 0)
	__create_ai_unit (1, 'sb2c', 0)
	__create_ai_unit (1, 'sbd', 0)
	__create_ai_unit (1, 'tbf', 0)
end

function __create_all_england_units()
--uk ships
	__create_ai_unit (1, 'dorsetshire', 1)
	__create_ai_unit (1, 'hood', 1)
	__create_ai_unit (1, 'fiji', 1)
	__create_ai_unit (1, 'eclipse', 1)
	__create_ai_unit (1, 'tribal', 1)
	__create_ai_unit (1, 'safari', 1)
	__create_ai_unit (1, 'kinggeorg', 1)
	__create_ai_unit (1, 'illustrious', 1)
--uk airplanes
	__create_ai_unit (1, 'b24', 0)
end


-- this function used for add new unit to current ai order
function __create_ai_unit (player_id, template, is_ship)
	local ai_root = ai_root_0
	if player_id == 1 then ai_root = ai_root_1 end
	if player_id == 2 then ai_root = ai_root_2 end
	if player_id == 3 then ai_root = ai_root_3 end
	if player_id == 4 then ai_root = ai_root_4 end
	if player_id == 5 then ai_root = ai_root_5 end
	if player_id == 6 then ai_root = ai_root_6 end	
	if player_id == 7 then ai_root = ai_root_7 end
	
	local v = tovector (tl_get_camera_pos(nil)) - tovector (tl_get_camera_dir ())*100.
	local v2 = tovector (tl_get_camera_pos(nil)) + tovector (tl_get_camera_dir ())*100.
	if (v.y < 0) then
		v.y = 0
	end

	--local unitname = autoname ()

	local unitName = template..'__'
	unitName = unitName..(autoname ())
	local unnode = tl_create_ai_node (player_id, ai_root, template, unitName)
	unnode:assign_position (v.x, v.y, v.z)
	local unit = tl_get_unit (unitName)
	if (is_ship==1) then
		unit:convert_to_ship ()
	end
	if (is_ship==1) then
		v2.y=0
	end
	if (is_ship ~= 1) then
		if (v2.y < 50) then
			v2.y = 50
		end
	end
	unnode:assign_position (v2.x, v2.y, v2.z)
	return unit
end

function __create_ai_unit_reload(player_id, template, is_ship)
	tl_remove_template(template)
	__create_ai_unit(player_id, template, is_ship)
end


-- this function used for add new unit to current ai order
function __create_ai_unit_with_pos (player_id, template, is_ship, pos)
	local ai_root = ai_root_0
	if player_id == 1 then ai_root = ai_root_1 end
	if player_id == 2 then ai_root = ai_root_2 end
	if player_id == 3 then ai_root = ai_root_3 end
	if player_id == 4 then ai_root = ai_root_4 end
	if player_id == 5 then ai_root = ai_root_5 end
	if player_id == 6 then ai_root = ai_root_6 end
	if player_id == 7 then ai_root = ai_root_7 end

	--local unitname = autoname ()

	local unitName = template..'__'
	unitName = unitName..(autoname ())
	local unnode = tl_create_ai_node_with_pos (player_id, ai_root, template, unitName, pos)
	--unnode:assign_position (pos['x'], pos['y'], pos['z'])
	local unit = tl_get_unit (unitName)
	if (is_ship==1) then
		unit:convert_to_ship ()
	end
	if (is_ship==1) then
		pos['y']=0
	end
	if (is_ship ~= 1) then
		if (pos['y'] < 50) then
			pos['y'] = 50
		end
	end
	unnode:assign_position (pos['x'], pos['y'], pos['z'])
	return unit
end

function __create_plane (playerid, template, x, y, z, relx, rely, relz )
  unit_node=tl_create_ai_node (playerid, ai_root_0, template, autoname ())
  unit = tl_get_unit (lastname ())
  unit_node:assign_position (x, y, z)
 -- unit:set_orientation (alpha, beta, gamma)
  unit:move_relative ( {x=relx; y=rely; z=relz} , true)
  return unit
end

function planes_wave (playerid, x, y, z, dx, dy, dz)
	__create_plane (playerid, 'A6M', x, y, z, -x, 0, -z)
	__create_plane (playerid, 'A6M', x+10, y, z+10, -x, 0, -z)
	__create_plane (playerid, 'A6M', x-10, y, z+10, -x, 0, -z)
	__create_plane (playerid, 'A6M', x-20, y, z+20, -x, 0, -z)
	__create_plane (playerid, 'A6M', x+20, y, z+20, -x, 0, -z)
	__create_plane (playerid, 'A6M', x-30, y, z+30, -x, 0, -z)
	__create_plane (playerid, 'A6M', x+30, y, z+30, -x, 0, -z)
	__create_plane (playerid, 'A6M', x-10, y, z+30, -x, 0, -z)
	__create_plane (playerid, 'A6M', x+10, y, z+30, -x, 0, -z)
end

function gogogo (playerid, x, y, z)
   tl_move_camera_to ({x=x+500;y=y+200;z=z+500})

__create_plane (playerid, 'A6M', x+905  , 400 , z+895.2, -x, 0, -z)
__create_plane (playerid, 'A6M', x+968.2, 400 , z+688.5, -x, 0, -z)
__create_plane (playerid, 'A6M', x+947  , 400 , z+671.5, -x, 0, -z)
__create_plane (playerid, 'A6M', x+631.7, 400 , z+748.3, -x, 0, -z)
__create_plane (playerid, 'A6M', x+958.8, 400 , z+711.9, -x, 0, -z)
__create_plane (playerid, 'A6M', x+610.5, 400 , z+731.2, -x, 0, -z)
__create_plane (playerid, 'A6M', x+837  , 400 , z+536.3, -x, 0, -z)
__create_plane (playerid, 'A6M', x+815.8, 400 , z+519.3, -x, 0, -z)
__create_plane (playerid, 'A6M', x+827.6, 400 , z+559.7, -x, 0, -z)
__create_plane (playerid, 'A6M', x+500.5, 400 , z+596.1, -x, 0, -z)
__create_plane (playerid, 'A6M', x+479.3, 400 , z+579  , -x, 0, -z)
__create_plane (playerid, 'A6M', x+491.1, 400 , z+619.4,  -x, 0, -z)
__create_plane (playerid, 'A6M', x+622.3, 400 , z+771.6,  -x, 0, -z)
__create_plane (playerid, 'A6M', x+914.4, 400 , z+871.8, -x, 0, -z)
__create_plane (playerid, 'A6M', x+893.1, 400 , z+854.8, -x, 0, -z)
__create_plane (playerid, 'B5N', x+557.1, 396.5, z+760.9,  -x, 0, -z)
__create_plane (playerid, 'B5N', x+520.6, 396.5, z+733.4,  -x, 0, -z)
__create_plane (playerid, 'B5N', x+537.3, 396.5, z+800 ,  -x, 0, -z)
__create_plane (playerid, 'B5N', x+461.7, 396.5, z+699.7, -x, 0, -z)
__create_plane (playerid, 'B5N', x+425.2, 396.5, z+672.2,  -x, 0, -z)
__create_plane (playerid, 'B5N', x+442  , 396.5, z+738.8,  -x, 0, -z)
__create_plane (playerid, 'B5N', x+825.7, 396.5, z+792.9,  -x, 0, -z)
__create_plane (playerid, 'B5N', x+786.7, 396.5, z+759.2,  -x, 0, -z)
__create_plane (playerid, 'B5N', x+885.6, 396.5, z+709.6,  -x, 0, -z)
__create_plane (playerid, 'B5N', x+849.1, 396.5, z+682.1,  -x, 0, -z)
__create_plane (playerid, 'A6M', x+577.8, 400 , z+931.6,  -x, 0, -z)
__create_plane (playerid, 'A6M', x+556.6, 400, z+914.6,  -x, 0, -z)
__create_plane (playerid, 'B5N', x+497.1, 400, z+844.2,  -x, 0, -z)
__create_plane (playerid, 'B5N', x+458.1, 400, z+810.4,  -x, 0, -z)
__create_plane (playerid, 'B5N', x+865.9, 400, z+748.7,  -x, 0, -z)
__create_plane (playerid, 'B5N', x+790.3, 400, z+648.4, -x, 0, -z)
__create_plane (playerid, 'B5N', x+753.8, 400, z+620.9, -x, 0, -z)
__create_plane (playerid, 'B5N', x+770.6, 400, z+687.5,  -x, 0, -z)
__create_plane (playerid, 'B5N', x+805.9, 400, z+832 ,  -x, 0, -z)
__create_plane (playerid, 'B5N', x+477.3, 400, z+883.3,  -x, 0, -z)
__create_plane (playerid, 'A6M', x+568.4, 396.5, z+954.9,  -x, 0, -z)

end

begin_group ("TL/BINDKEYS/ADDUNITS")
	bind_key ({KC_LMENU, KC_LCONTROL, KC_W, KC_P}, " qtvr_selected()", 2400)

	--japan ships
	bind_key ({KC_LMENU, KC_1}, " __create_ai_unit (1, 'Yamato', 1)", 400)
	bind_key ({KC_LMENU, KC_2}, " __create_ai_unit (1, 'Agano', 1)", 400)
	bind_key ({KC_LMENU, KC_3}, " __create_ai_unit (1, 'Akagi', 1)", 400)
	bind_key ({KC_LMENU, KC_4}, " __create_ai_unit (1, 'Akizuki', 1)", 400)
	bind_key ({KC_LMENU, KC_5}, " __create_ai_unit (1, 'Daihatsu', 1)", 400)
	bind_key ({KC_LMENU, KC_6}, " __create_ai_unit (1, 'Kazahaia', 1)", 400)
	bind_key ({KC_LMENU, KC_7}, " __create_ai_unit (1, 'Hokoku', 1)", 400)
	bind_key ({KC_LMENU, KC_8}, " __create_ai_unit (1, 'Mogami', 1)", 400)
	bind_key ({KC_LMENU, KC_9}, " __create_ai_unit (1, 'Shimushu', 1)", 400)
	bind_key ({KC_LMENU, KC_NUMPAD0}, " __create_ai_unit (1, 'Taiho', 1)", 400)
	bind_key ({KC_LMENU, KC_NUMPAD1}, " __create_ai_unit (1, 'Zuikaku', 1)", 400)
	bind_key ({KC_LMENU, KC_NUMPAD2}, " __create_ai_unit (1, 'Kagero', 1)", 400)
	bind_key ({KC_LMENU, KC_NUMPAD3}, " __create_ai_unit (1, 'Nagato', 1)", 400)
	bind_key ({KC_LMENU, KC_NUMPAD4}, " __create_ai_unit (1, 'I58', 1)", 400)

	--japan airplanes
	bind_key ({KC_RMENU, KC_1}, " __create_ai_unit (1, 'A6M', 0)", 100)
	bind_key ({KC_RMENU, KC_2}, " __create_ai_unit (1, 'A7M', 0)", 100)
	bind_key ({KC_RMENU, KC_3}, " __create_ai_unit (1, 'B5N', 0)", 100)
	bind_key ({KC_RMENU, KC_4}, " __create_ai_unit (1, 'B7A', 0)", 100)
	bind_key ({KC_RMENU, KC_5}, " __create_ai_unit (1, 'D3A', 0)", 100)
	bind_key ({KC_RMENU, KC_6}, " __create_ai_unit (1, 'D4Y', 0)", 100)
	bind_key ({KC_RMENU, KC_7}, " __create_ai_unit (1, 'F1M', 0)", 100)
	bind_key ({KC_RMENU, KC_8}, " __create_ai_unit (1, 'G4M', 0)", 100)
	bind_key ({KC_RMENU, KC_9}, " __create_ai_unit (1, 'G8N', 0)", 100)
	bind_key ({KC_RMENU, KC_0}, " __create_ai_unit (1, 'J7W', 0)", 100)
	bind_key ({KC_RMENU, KC_NUMPAD0}, " __create_ai_unit (1, 'H8K', 0)", 100)
	bind_key ({KC_RMENU, KC_NUMPAD1}, " __create_ai_unit (1, 'J7W', 0)", 100)
	bind_key ({KC_RMENU, KC_NUMPAD2}, " __create_ai_unit (1, 'Ki-21', 0)", 100)
	bind_key ({KC_RMENU, KC_NUMPAD3}, " __create_ai_unit (1, 'Ki-43', 0)", 100)
	bind_key ({KC_RMENU, KC_NUMPAD4}, " __create_ai_unit (1, 'Ki-61', 0)", 100)
	bind_key ({KC_RMENU, KC_NUMPAD5}, " __create_ai_unit (1, 'Ki-84', 0)", 100)
	bind_key ({KC_RMENU, KC_NUMPAD6}, " __create_ai_unit (1, 'N1K-J', 0)", 100)
	bind_key ({KC_RMENU, KC_NUMPAD7}, " __create_ai_unit (1, 'P1Y', 0)", 100)

	--usa airplanes
	bind_key ({KC_RSHIFT, KC_1}, " __create_ai_unit (1, 'B-24', 0)", 100)
	bind_key ({KC_RSHIFT, KC_2}, " __create_ai_unit (1, 'B-17', 0)", 100)
	bind_key ({KC_RSHIFT, KC_3}, " __create_ai_unit (1, 'B-25-AT', 0)", 100)
	bind_key ({KC_RSHIFT, KC_4}, " __create_ai_unit (1, 'B-29', 0)", 100)
	bind_key ({KC_RSHIFT, KC_5}, " __create_ai_unit (1, 'F4F', 0)", 100)
	bind_key ({KC_RSHIFT, KC_6}, " __create_ai_unit (1, 'F4U', 0)", 100)
	bind_key ({KC_RSHIFT, KC_7}, " __create_ai_unit (1, 'F6F', 0)", 100)
	bind_key ({KC_RSHIFT, KC_8}, " __create_ai_unit (1, 'OS2U', 0)", 100)
	bind_key ({KC_RSHIFT, KC_9}, " __create_ai_unit (1, 'P-38', 0)", 100)
	bind_key ({KC_RSHIFT, KC_NUMPAD0}, " __create_ai_unit (1, 'P-39', 0)", 100)
	bind_key ({KC_RSHIFT, KC_NUMPAD1}, " __create_ai_unit (1, 'P-40', 0)", 100)
	bind_key ({KC_RSHIFT, KC_NUMPAD2}, " __create_ai_unit (1, 'P-47', 0)", 100)
	bind_key ({KC_RSHIFT, KC_NUMPAD3}, " __create_ai_unit (1, 'P-51', 0)", 100)
	bind_key ({KC_RSHIFT, KC_NUMPAD4}, " __create_ai_unit (1, 'P-80', 0)", 100)
	bind_key ({KC_RSHIFT, KC_NUMPAD5}, " __create_ai_unit (1, 'PBY', 0)", 100)
	bind_key ({KC_RSHIFT, KC_NUMPAD6}, " __create_ai_unit (1, 'SB2C', 0)", 100)
	bind_key ({KC_RSHIFT, KC_NUMPAD7}, " __create_ai_unit (1, 'SBD', 0)", 100)
	bind_key ({KC_RSHIFT, KC_NUMPAD8}, " __create_ai_unit (1, 'TBF', 0)", 100)

	--usa ships
	bind_key ({KC_LSHIFT, KC_1}, " __create_ai_unit (1, 'Baltimor', 1)", 1000)
	bind_key ({KC_LSHIFT, KC_2}, " __create_ai_unit (1, 'Benson', 1)", 1000)
	bind_key ({KC_LSHIFT, KC_3}, " __create_ai_unit (1, 'Casablanca', 1)", 1000)
	bind_key ({KC_LSHIFT, KC_4}, " __create_ai_unit (1, 'Clivlend', 1)", 1000)
	bind_key ({KC_LSHIFT, KC_5}, " __create_ai_unit (1, 'Colorado', 1)", 1000)
	bind_key ({KC_LSHIFT, KC_6}, " __create_ai_unit (1, 'Essex', 1)", 1000)
	bind_key ({KC_LSHIFT, KC_7}, " __create_ai_unit (1, 'Evarts', 1)", 1000)
	bind_key ({KC_LSHIFT, KC_8}, " __create_ai_unit (1, 'Fletcher', 1)", 1000)
	bind_key ({KC_LSHIFT, KC_9}, " __create_ai_unit (1, 'Iowa', 1)", 1000)
	bind_key ({KC_LSHIFT, KC_0}, " __create_ai_unit (1, 'LCT5', 1)", 1000)
	bind_key ({KC_LSHIFT, KC_NUMPAD0}, " __create_ai_unit (1, 'Lexington', 1)", 1000)
	bind_key ({KC_LSHIFT, KC_NUMPAD1}, " __create_ai_unit (1, 'Liberty', 1)", 1000)
	bind_key ({KC_LSHIFT, KC_NUMPAD2}, " __create_ai_unit (1, 'Simarron', 1)", 1000)
	bind_key ({KC_LSHIFT, KC_NUMPAD3}, " __create_ai_unit (1, 'Gato', 1)", 1000)
	
	
	--usa ships player 0
	bind_key ({KC_LCONTROL, KC_1}, " __create_ai_unit (0, 'Baltimor', 1)", 1000)
	bind_key ({KC_LCONTROL, KC_2}, " __create_ai_unit (0, 'Benson', 1)", 1000)
	bind_key ({KC_LCONTROL, KC_3}, " __create_ai_unit (0, 'Casablanca', 1)", 1000)
	bind_key ({KC_LCONTROL, KC_4}, " __create_ai_unit (0, 'Clivlend', 1)", 1000)
	bind_key ({KC_LCONTROL, KC_5}, " __create_ai_unit (0, 'Colorado', 1)", 1000)
	bind_key ({KC_LCONTROL, KC_6}, " __create_ai_unit (0, 'Essex', 1)", 1000)
	bind_key ({KC_LCONTROL, KC_7}, " __create_ai_unit (0, 'Evarts', 1)", 1000)
	bind_key ({KC_LCONTROL, KC_8}, " __create_ai_unit (0, 'Fletcher', 1)", 1000)
	bind_key ({KC_LCONTROL, KC_9}, " __create_ai_unit (0, 'Iowa', 1)", 1000)
	bind_key ({KC_LCONTROL, KC_0}, " __create_ai_unit (0, 'LCT5', 1)", 1000)
	bind_key ({KC_LCONTROL, KC_NUMPAD0}, " __create_ai_unit (0, 'Lexington', 1)", 1000)
	bind_key ({KC_LCONTROL, KC_NUMPAD1}, " __create_ai_unit (0, 'Liberty', 1)", 1000)
	bind_key ({KC_LCONTROL, KC_NUMPAD2}, " __create_ai_unit (0, 'Simarron', 1)", 1000)
	bind_key ({KC_LCONTROL, KC_NUMPAD3}, " __create_ai_unit (0, 'Gato', 1)", 1000)

	--usa airplanes player 0
	bind_key ({KC_RCONTROL, KC_1}, " __create_ai_unit (0, 'B-24', 0)", 100)
	bind_key ({KC_RCONTROL, KC_2}, " __create_ai_unit (0, 'B-17', 0)", 100)
	bind_key ({KC_RCONTROL, KC_3}, " __create_ai_unit (0, 'B-25', 0)", 100)
	bind_key ({KC_RCONTROL, KC_4}, " __create_ai_unit (0, 'B-29', 0)", 100)
	bind_key ({KC_RCONTROL, KC_5}, " __create_ai_unit (0, 'F4F', 0)", 100)
	bind_key ({KC_RCONTROL, KC_6}, " __create_ai_unit (0, 'F4U', 0)", 100)
	bind_key ({KC_RCONTROL, KC_7}, " __create_ai_unit (0, 'F6F', 0)", 100)
	bind_key ({KC_RCONTROL, KC_8}, " __create_ai_unit (0, 'OS2U', 0)", 100)
	bind_key ({KC_RCONTROL, KC_9}, " __create_ai_unit (0, 'P-38', 0)", 100)

	bind_key ({KC_LCONTROL, KC_NUMPAD4}, " __create_ai_unit (0, 'Kinggeorg', 1)", 1000)
	bind_key ({KC_LCONTROL, KC_NUMPAD5}, " __create_ai_unit (0, 'I400', 1)", 1000)
	bind_key ({KC_LCONTROL, KC_NUMPAD6}, " __create_ai_unit (0, 'Spit5c', 0)", 1000)
	bind_key ({KC_LCONTROL, KC_NUMPAD7}, " __create_ai_unit (0, 'M6A', 0)", 1000)

	--all ships and airplanes
	--bind_key ({KC_RMENU, KC_RCONTROL, KC_RSHIFT, KC_J}, " __create_all_japan_units (1000, 1000, 1000)", 4000)
	--bind_key ({KC_RMENU, KC_RCONTROL, KC_RSHIFT, KC_U}, " __create_all_usa_units ()", 4000)
	--bind_key ({KC_RMENU, KC_RCONTROL, KC_RSHIFT, KC_E}, " __create_all_england_units ()", 4000)

	--add new ai order. after this new units will be added here
	--bind_key ({KC_LMENU, KC_3}, " __create_ai_order (1)", 400)
	--bind_key ({KC_LSHIFT, KC_3}, " __create_ai_order (0)", 400)

	bind_key ({KC_LSHIFT, KC_G}, " gogogo (-2000, 400,-2000)", 4000)
	bind_key ({KC_LCONTROL, KC_F11}, "tl_toggle_render_stats ()", 1000)
	bind_key (KC_F10, "show_camera_pos ()", 1000)

	bind_key ({KC_LSHIFT, KC_LCONTROL, KC_A}, " tl_create_explosion ('NuclearBomb', {x=0;y=0;z=0})", 2000)
end_group ()


-- can use this, for interface enabling when camera move done
function enable_interface ()
	tl_disable_interface (false)
end

begin_group ("TL/BINDKEYS")
end_group ()
------------------------------------------------------------------------------
__u = nil
__cd = nil
__frameNo = 0
__rows = 10
__columns = 30

__oldCC = nil
__oldDM = nil

__limits = {ramin = -45, ramax = 45, camin = 0, camax = 360}
------------------------------------------------------------------------------

tl_enable_landing_window (true)
tl_enable_kamikaze_mode (true)

log_message ("Leaving tlinit.lua")

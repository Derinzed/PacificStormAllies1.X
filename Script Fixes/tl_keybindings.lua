------------------------------------------------------------------------------
-- Copyright (c) Lesta Studio, 2004
------------------------------------------------------------------------------

require ("res://common.lua")

log_message ("tlkeybindings.lua: loading key bindings for Tactic Level...")

------------------------------------------------------------------------------
-- Пауза
------------------------------------------------------------------------------

function toggle_pause ()
	tl_play_sound("MinimapPause", false)
	if tl_is_paused () == true then
		tl_set_paused (false, false)
	else
		tl_set_paused (true, false)
	end
end

------------------------------------------------------------------------------
-- Окошко клавиш по F1
------------------------------------------------------------------------------
--function show_help() -- если в самолете и не тренировочная миссия
--  tl_set_paused(true,true)
--
  --if (tl_get_active_cc()=="CCPlane") then
--    tl_show_msg_box("plane_help_string", 0, "MsgBox/OK|tl_set_paused(false,true)")
--  else
  --  tl_show_msg_box("tactic_level_hotkeys", 0, "MsgBox/OK|tl_set_paused(false,true)")
  --end
--end

------------------------------------------------------------------------------
-- Позиция камеры
------------------------------------------------------------------------------

function show_camera_pos(event)
	local pos = tl_get_camera_pos(event)
	CONSOLE:println ("--------------------------------------------------------")
	if(pos['length']~=nil) then
		CONSOLE:println ("Distance : "..pos['length'])
		pos = pos['pos']
	end
	CONSOLE:println ("X : "..pos.x)
	CONSOLE:println ("Y : "..pos.y)
	CONSOLE:println ("Z : "..pos.z)
	CONSOLE:println ("--------------------------------------------------------")
	CONSOLE:show ()
end

------------------------------------------------------------------------------
-- Контроллеры камеры
------------------------------------------------------------------------------

function tl_cc_god_view ()
    if (tl_get_active_cc()~="CCPlane") then
	  tl_activate_cc ("CCGodView")
	end
end

function tl_cc_free_look ()
    if (tl_get_active_cc()~="CCPlane") then
		tl_activate_cc ("CCFreeLook")
	end
end

------------------------------------------------------------------------------
-- Статистика рендера
------------------------------------------------------------------------------

__tl_render_stats_visible = false

function tl_show_render_stats ()
	show_overlay ("TL/RenderStats",false)
	__tl_render_stats_visible = true;
	__tl_update_render_stats ()
end

function tl_hide_render_stats ()
	hide_overlay ("TL/RenderStats")
	__tl_render_stats_visible = false
end

function tl_toggle_render_stats ()
	if __tl_render_stats_visible then
		tl_hide_render_stats ()
	else
		tl_show_render_stats ()
	end
end

function __tl_update_render_stats ()
	local stats = get_stats ()
	ge_get ("TL/RenderStats/FPS"):set_caption (string.format ("%5.2f", tonumber (stats.current_fps)))	
	ge_get ("TL/RenderStats/Triangles"):set_caption (tostring (stats.triangle_count))
	ge_get ("TL/RenderStats/Renders"):set_caption (tostring (stats.render_count))
	ge_get ("TL/RenderStats/FreeMemory"):set_caption (tostring (stats.free_memory))
	ge_get ("TL/RenderStats/GraphUpdates"):set_caption (tostring (stats.num_graph_updates))
	ge_get ("TL/RenderStats/vb_count"):set_caption (tostring (stats.vb_count))
	ge_get ("TL/RenderStats/ib_count"):set_caption (tostring (stats.ib_count))
	if __tl_render_stats_visible then
		set_timeout ("__tl_update_render_stats ()", 0.01)
	end
end

------------------------------------------------------------------------------
function __get_point_under_cursor()
	local p=tl_get_point_under_cursor()
	CONSOLE:show(true)

	if p~=nil then
		log_message ("Intersection point: X:"..p.x.." Y:"..p.y.." Z:"..p.z)
	else
		log_message ("WHERE IS THIS FUCKING TERRAIN?!")
	end
end
------------------------------------------------------------------------------
function tl_decrease_game_speed ()
	local spd = tl_get_game_speed ()
	if spd>0.125 then
		spd = spd/2
		tl_play_sound("MinimapSpeed-", false)
		tl_set_game_speed (spd)
	end
end
------------------------------------------------------------------------------
function tl_increase_game_speed ()
	local spd = tl_get_game_speed ()
	if spd<16 then
		spd = spd*2
		tl_play_sound("MinimapSpeed+", false)
		tl_set_game_speed (spd)
	end
end
------------------------------------------------------------------------------
--здесь сочетания клавиш для тактического уровня
begin_group("TL/BINDKEYS")
	--bind_key({KC_LCONTROL, KC_LSHIFT, KC_N},"__get_point_under_cursor()", 1000)

	--bind_key (KC_F, "toggle_fog ()", 250)
	--bind_key ({KC_LSHIFT, KC_F10}, "show_camera_pos({setpoint=true})", 1000)
	--bind_key ({KC_LSHIFT,KC_LCONTROL,KC_F10}, "show_camera_pos({length=true})", 1000)

	--bind_key (KC_O, "tl_cc_god_view ()", 600)
	--bind_key (KC_P, "tl_cc_free_look ()", 600)
	
	--bind_key ({KC_LCONTROL,KC_B}, "generate_building_info ()", 3600)	

	bind_key (VKC_DECREASE_GAME_SPEED, "tl_decrease_game_speed ()", 250)
	bind_key (VKC_INCREASE_GAME_SPEED, "tl_increase_game_speed ()", 250)
	
	--bind_key (KC_M, "tl_main_gui_toggle_minimap ()", 100)
	
--	bind_key (KC_HOME, "tl_main_gui_home_camera ()", 100)
		
	-- потом сделать проверку на видимость миникарты
	bind_key ({KC_LCONTROL, VKC_MINIMAP_ZOOM_IN}, "tl_main_gui_minimap_zoom_in ()", 250)
	bind_key ({KC_RCONTROL, VKC_MINIMAP_ZOOM_IN}, "tl_main_gui_minimap_zoom_in ()", 250)
	bind_key ({KC_LCONTROL, VKC_MINIMAP_ZOOM_OUT}, "tl_main_gui_minimap_zoom_out ()", 250)
	bind_key ({KC_RCONTROL, VKC_MINIMAP_ZOOM_OUT}, "tl_main_gui_minimap_zoom_out ()", 250)
		
	-- Группировка
	--bind_key ({KC_LCONTROL, KC_1}, "tl_main_gui_group_selection (\"default_1\")", 100)
	--bind_key ({KC_LCONTROL, KC_2}, "tl_main_gui_group_selection (\"default_2\")", 100)
	--bind_key ({KC_LCONTROL, KC_3}, "tl_main_gui_group_selection (\"default_3\")", 100)
	--bind_key ({KC_LCONTROL, KC_4}, "tl_main_gui_group_selection (\"default_4\")", 100)
	--bind_key ({KC_LCONTROL, KC_5}, "tl_main_gui_group_selection (\"default_5\")", 100)
	--bind_key ({KC_LCONTROL, KC_6}, "tl_main_gui_group_selection (\"default_6\")", 100)
	--bind_key ({KC_LCONTROL, KC_7}, "tl_main_gui_group_selection (\"default_7\")", 100)
	--bind_key ({KC_LCONTROL, KC_8}, "tl_main_gui_group_selection (\"default_8\")", 100)
	--bind_key ({KC_LCONTROL, KC_9}, "tl_main_gui_group_selection (\"default_9\")", 100)
	--bind_key ({KC_LCONTROL, KC_0}, "tl_main_gui_group_selection (\"default_0\")", 100)
		
	-- Выделение группы
	--bind_key (KC_1, "tl_main_gui_select_group (\"default_1\")", 100)
	--bind_key (KC_2, "tl_main_gui_select_group (\"default_2\")", 100)
	--bind_key (KC_3, "tl_main_gui_select_group (\"default_3\")", 100)
	--bind_key (KC_4, "tl_main_gui_select_group (\"default_4\")", 100)
	--bind_key (KC_5, "tl_main_gui_select_group (\"default_5\")", 100)
	--bind_key (KC_6, "tl_main_gui_select_group (\"default_6\")", 100)
	--bind_key (KC_7, "tl_main_gui_select_group (\"default_7\")", 100)
	--bind_key (KC_8, "tl_main_gui_select_group (\"default_8\")", 100)
	--bind_key (KC_9, "tl_main_gui_select_group (\"default_9\")", 100)
	--bind_key (KC_0, "tl_main_gui_select_group (\"default_0\")", 100)
	
	-- Биндинг кнопки на перезагрузку менеджера систем частиц
	--bind_key ({KC_1, KC_2}, "reparse_particle_manager ()")
    --bind_key (KC_F1, "show_help()")
	--bind_key ({KC_LCONTROL, KC_O}, "show_overlay (\"TL/Options\",false)", 250)
end_group()
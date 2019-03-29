------------------------------------------------------------------------------
-- Copyright (c) Lesta Studio, 2004
------------------------------------------------------------------------------

log_message ("tlcommon.lua")

------------------------------------------------------------------------------
-- Вспомогательные функции тактического уровня
------------------------------------------------------------------------------

------------------------------------------------------------------------------
__tl_uname_tpl = "autoname"
__tl_ucounter = 0
------------------------------------------------------------------------------
function autoname ()
    __tl_ucounter = __tl_ucounter+1
    return __tl_uname_tpl..__tl_ucounter
end
------------------------------------------------------------------------------
function lastname ()
    return __tl_uname_tpl..__tl_ucounter
end
------------------------------------------------------------------------------
function tl_gui_prompt_cancel ()
	hide_overlay ("TL/Prompt")
end
------------------------------------------------------------------------------
__autosave_timeout = 30
__autosave_enabled = false
------------------------------------------------------------------------------
function enable_autosave (timeout)
	if timeout ~= nil then
		__autosave_timeout = timeout*60
	end
	__autosave_enabled = true
	set_timeout ("show_overlay (\"TL/Autosave\",false)", __autosave_timeout-0.5)
	set_timeout ("__autosave ()", __autosave_timeout)
	log_message ("Autosave enabled. Timeout: "..timeout.." min.")
end
------------------------------------------------------------------------------
function disable_autosave ()
	__autosave_enabled = false
	log_message ("Autosave disabled.")
end
------------------------------------------------------------------------------
function __autosave ()
	if __autosave_enabled then
		tl_save_units ("autosave")
		hide_overlay ("TL/Autosave")
		set_timeout ("show_overlay (\"TL/Autosave\",false)", __autosave_timeout-0.5)
		set_timeout ("__autosave ()", __autosave_timeout)
	end
end
------------------------------------------------------------------------------
function showProgress (uncnt)
	local pr = tl_get_progress_bar()
	tl_set_paused (true,true)
	pr:set_position (0,0)
	pr:set_visible (true)
	if (uncnt~=nil) then
		pr:set_current_max(1/uncnt)
	end
end
------------------------------------------------------------------------------
function hideProgress ()
	local pr = tl_get_progress_bar()
	pr:set_visible (false)
	tl_set_paused (false, false)
end

------------------------------------------------------------------------------
function qtvr_plane (unit_type)

	local u = __create_ai_unit (0, unit_type, 0)
	tl_select_unit (tl_get_my_player(), u:get_name ())

	__rows = 10
	__limits.ramax = 45

	qtvr (1.75)

end
------------------------------------------------------------------------------
function qtvr_ship (unit_type)

	local u = __create_ai_unit (0, unit_type, 1)
	tl_select_unit (tl_get_my_player(), u:get_name ())

	__rows = 5
	__limits.ramax = -5

	qtvr (2.)

end
------------------------------------------------------------------------------
function qtvr (camdist)
	
	__cd = camdist
	
	local units = tl_get_selected_units (tl_get_my_player())
	local unit_count = table.getn (units)
	
	if unit_count == 0 then
		CONSOLE:println ("There are no selected units!")
		return
	end

	tl_unselect_all (tl_get_my_player())
	__u = units[1]

	__frameNo = 0

    __oldCC = tl_get_active_cc ()
    __oldDM = tl_get_debug_mode ()

    tl_set_debug_mode (true)
	tl_activate_cc ("CCFreeLook")
	tl_set_paused (true, false)

	CONSOLE:hide (true)
	hide_overlay ("TL/Main")

	local rw = math.floor (__frameNo/__columns)
	local cl = math.mod (__frameNo,__columns)
	tl_set_qtvr_cam (__u:get_name (), rw, cl, __rows, __columns, __limits, __cd)

	set_timeout ("qtvr_render_next_frame ()", 1)

end
------------------------------------------------------------------------------
function qtvr_render_next_frame ()

	local rw = math.floor (__frameNo/__columns)
	local cl = math.mod (__frameNo,__columns)

	tl_set_qtvr_cam (__u:get_name (), rw, cl, __rows, __columns, __limits, __cd)
    take_screenshot ("../screenshots/qtvr_"..__u:get_template_name ().."_%04d.tga")

	__frameNo = __frameNo + 1

	if __frameNo<__rows*__columns then
		set_timeout ("qtvr_render_next_frame ()", 2)
	else
		tl_set_debug_mode (__oldDM)
		tl_set_paused (false, false)
		tl_activate_cc (__oldCC)
		show_overlay ("TL/Main")
	end

end

------------------------------------------------------------------------------
function qtvr_selected ()
	__rows = 1
	__columns = 15
	__limits = {ramin = -20, ramax = -19, camin = 0, camax = 360}
	__timeout = 0.3

	qtvrselected (1.)

end
------------------------------------------------------------------------------
function qtvrselected (camdist)
	
	__cd = camdist
	
	local units = tl_get_selected_units (tl_get_my_player())
	local unit_count = table.getn (units)
	
	if unit_count == 0 then
		CONSOLE:println ("There are no selected units!")
		return
	end

	tl_unselect_all (tl_get_my_player())
	__u = units[1]
	
	__frameNo = 0

	tl_link_camera_to_unit(__u:get_name())
	
    __oldCC = tl_get_active_cc ()
    __oldDM = tl_get_debug_mode ()

    tl_set_debug_mode (true)
	--tl_activate_cc ("CCFreeLook")

	CONSOLE:hide (true)
	hide_overlay ("TL/Main")
	hide_overlay ("TL/Main2")
	tl_set_paused (false, false)

	local rw = math.floor (__frameNo/__columns)
	local cl = math.mod (__frameNo,__columns)
	tl_set_qtvr_cam (__u:get_name (), rw, cl, __rows, __columns, __limits, __cd)

	set_timeout ("qtvr_render_next_frameselected ()", __timeout)

end
------------------------------------------------------------------------------
function qtvr_render_next_frameselected ()

	local rw = math.floor (__frameNo/__columns)
	local cl = math.mod (__frameNo,__columns)

	tl_set_qtvr_cam (__u:get_name (), rw, cl, __rows, __columns, __limits, __cd)
    take_screenshot ("../screenshots/qtvr_"..__u:get_template_name ().."_%04d.tga")

	__frameNo = __frameNo + 1

	if __frameNo<__rows*__columns then
		set_timeout ("qtvr_render_next_frameselected ()", __timeout)
	else
		tl_set_debug_mode (__oldDM)
		tl_set_paused (false, false)
		tl_activate_cc (__oldCC)
		show_overlay ("TL/Main", false)
		show_overlay ("TL/Main2", false)
	end

end



------------------------------------------------------------------------------
function tl_adjust_sea_params (params, dist2cyclone, dist2clouds)
	-- params.strength - Амплитуда волны
	-- params.scale - Масштаб шума
	-- params.falloff - Коэффициент затухания для амплитуды каждой следующей октавы
	-- params.animspeed - Скорость анимации
	-- params.timemulti - Множитель скорости для каждой следующей октавы
	-- params.watercolour - Цвет воды
	-- dist2cyclone - Расстояние до ближайшего циклона либо -1, если циклонов нет
	-- dist2clouds - Расстояние до ближайшей области облачности либо -1, если облаков нет

	--[[
	params.watercolour.r = 1
	params.watercolour.g = .5
	params.watercolour.b = 0
	]]

	return params -- обязательно возвращаем параметры обратно
end
------------------------------------------------------------------------------

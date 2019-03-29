------------------------------------------------------------------------------
-- Copyright (c) Lesta Studio, 2004
------------------------------------------------------------------------------

require ("res://common.lua")
log_message ("Executing GUI script tl_select_map.lua")

------------------------------------------------------------------------------

function tl_mapselect_ok ()

	local success, msg

	log_message("Entering function tl_mapselect_ok ()")

	hide_overlay ("TL/MapSelect")
	local lbx = get_listbox ("tl_gui_mselect_list")

	local map = OBJECT["TLMaps"][lbx:get_selected_caption ()]
	
	CONSOLE:show (true) -- для отладки
	tl_load_map (map["File"]:get_value ())
	CONSOLE:hide ()

	if (EDITOR_MODE==true) then
		success, msg = pcall (

			function ()
			
				enable_autosave (20)
				tl_load_units_prompt ()
				tl_show_editor ()

			end -- function
		)

		if not success then
			log_message (debug.traceback("ERROR: "..msg))
		end
	end

	log_message("tl_mapselect_ok: Leaving function body...")
end

------------------------------------------------------------------------------

function tl_mapselect_cancel ()
	hide_overlay ("TL/MapSelect")
end

------------------------------------------------------------------------------

function tl_mapselect_show_image ()
	local success, msg = pcall (

		function ()
			local lbx = get_listbox ("tl_gui_mselect_list")
			local map = OBJECT["TLMaps"][lbx:get_selected_caption ()]
			ge_get ("tl_gui_mselect_mapview"):set_material (map["SmallImage"]:get_value ())
		end -- function
	)

	if not success then
		log_message (debug.traceback("ERROR: "..msg))
	end
end

------------------------------------------------------------------------------

function tl_select_map ()
	local maps = OBJECT["TLMaps"]:get_attributes ()
	local map_count = table.getn (maps)
	local lbx = get_listbox ("tl_gui_mselect_list")
	
	lbx:clear ();	
	for i = 1, map_count do
		lbx:add_item (maps[i]:get_name ())
	end

	set_on_mouse_clicked ("tl_gui_mselect_ok", "tl_mapselect_ok")
	set_on_mouse_clicked ("tl_gui_mselect_list", "tl_mapselect_show_image")

	show_overlay ("TL/MapSelect", true)
end

------------------------------------------------------------------------------

log_message ("Leaving tl_select_map.lua")

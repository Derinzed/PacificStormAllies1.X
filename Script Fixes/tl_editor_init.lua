------------------------------------------------------------------------------
-- Copyright (c) Lesta Studio, 2004
------------------------------------------------------------------------------

require ("res://tl_editor_gui.lua")

log_message ("Initialising editor GUI...")

------------------------------------------------------------------------------
-- Выбор карты.
------------------------------------------------------------------------------
tl_select_map ()

success, msg = pcall (

	function ()

		-- Запихиваем все доступные редактору объекты в листбокс
		local lbx = get_listbox ("TL/Editor/NewObjectList")
		local editor_objects = OBJECT["EditorObjects"]:get_attributes ()
		local objects_count = table.getn (editor_objects)

		lbx:clear ()
		for i = 1, objects_count do
			lbx:add_item (editor_objects[i]:get_name ())
			log_message ("Editor object added to list: "..editor_objects[i]:get_name ())
		end

	end	
)

if not success then
	log_message (debug.traceback("ERROR: "..msg))
end

success, msg = pcall (

	function ()
		tl_set_msg_line_prefix ("TL/Editor/Message")
	end	
)

if not success then
	log_message (debug.traceback("ERROR: "..msg))
end

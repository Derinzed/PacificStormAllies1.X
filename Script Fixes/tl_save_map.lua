-- Copyright (c)2004 Lesta Studio

------------------------------------------------------------------------------
-- Загрузка карты тактического уровня.
------------------------------------------------------------------------------

function tl_save_map (map_name, map_file)

	local map, success, msg

	map = OBJECT:create ("object", map_name)
	log_message ("tl_save_map: Creating map object "..map_name)

	-- Скайбокс.

	--[[
	map:create ("string", "SkyBox"):set_value (tl_get_skybox ())
	log_message ("tl_save_map: skybox - "..tl_get_skybox ())
	]]

	-- Туман.

	local fog = tl_get_fog ()
	log_message ("tl_save_map: Fog...")

	local fog_obj = map:create ("object", "Fog")
	fog_obj:create ("string", "Type"):set_value (fog.type)
	fog_obj:create ("float", "Param1"):set_value (fog.param1)
	fog_obj:create ("float", "Param2"):set_value (fog.param2)

	local colour_obj = fog_obj:create ("object", "Colour")
	colour_obj:create ("float", "R"):set_value (fog.r)
	colour_obj:create ("float", "G"):set_value (fog.g)
	colour_obj:create ("float", "B"):set_value (fog.b)
	colour_obj:create ("float", "A"):set_value (fog.a)

	CONSOLE:println (
		fog.type..
		" r="..fog.r..
		" g="..fog.g..
		" b="..fog.b..
		" a="..fog.a
	)

	CONSOLE:println ("fog_param1="..fog.param1.." fog_param2="..fog.param2)

	-- Сохраняем юниты.
	
	success, msg = pcall (

		function ()
		
			local units_obj = map:create ("object", "Units")
			local units = tl_get_all_units ()
			local unit_count = table.getn (units)
			
			for i = 1, unit_count do
			
				local unit_obj = units_obj:create ("object", units[i]:get_name ())
				unit_obj:create ("string", "Template"):set_value (units[i]:get_template_name ())
				
				local pos = units[i]:get_position ()
				local position_obj = unit_obj:create ("object", "Position")
				position_obj:create ("float", "X"):set_value (pos.x)
				position_obj:create ("float", "Y"):set_value (pos.y)
				position_obj:create ("float", "Z"):set_value (pos.z)
				
				local orientation_obj = unit_obj:create ("object", "Orientation")
				orientation_obj:create ("float", "X"):set_value (-1)
				orientation_obj:create ("float", "Y"):set_value (0)
				orientation_obj:create ("float", "Z"):set_value (1)
			
			end -- for
			
		end
	)

	if not success then
		log_message ("ERROR: "..msg)
	end

	-- Сохраняем и удаляем объект с картой.

	log_message ("tl_save_map: saving map...")
	save_object (CONFIG["TLevel.PathToMaps"]:get_value ()..map_file, map)
	log_message ("tl_save_map: removing temporary objects...")
	OBJECT:remove (map_name)

end
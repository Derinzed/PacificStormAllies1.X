-- Copyright(c) Lesta Studio, 2004

require ("res://common.lua")
log_message ("Executing script tl_load_map.lua")

load_static = true


------------------------------------------------------------------------------
-- Загрузка карты из карты высот.
------------------------------------------------------------------------------

function tl_load_from_heightmap (terrain)

	CONSOLE:println ("Loading terrain fom heightmap.")

	if (terrain["Size"] ~= nil) then
		CONSOLE:println ("    Size attribute used.")
		dimensions = obj2vec (terrain["Size"])
		dimensions.is_size = true
	else
		CONSOLE:println ("    Scale attribute used.")
		dimensions = obj2vec (terrain["Scale"])
	end

	if (terrain["HeightMap"] ~= nil) then
		tl_create_terrain_from_heightmap (
			terrain:get_name (),
			terrain["HeightMap"]:get_value(),
			terrain["Material"]:get_value(),
			tonumber (terrain["PathMapSize"]:get_value()),
			obj2vec (terrain["Position"]),
			dimensions
		)
	end

	-- Создаем объекты на ландшафте

	if (load_static==true) then
		local objects
		local obj_count = 0
		if (terrain["Objects"] ~= nil) then
			objects = terrain["Objects"]:get_attributes ()
			obj_count = table.getn (objects)
		end
		for j = 1, obj_count do
			local terrain_obj = objects[j]
			local pos = terrain_obj["Position"]
			local obj = tl_create_terrain_object (
				terrain_obj["Template"]:get_value(),
				terrain_obj:get_name (),
				terrain:get_name (),
				tonumber (terrain_obj["Type"]:get_value()),
				tonumber (pos["X"]:get_value()),
				tonumber (pos["Y"]:get_value()),
				tonumber (pos["Z"]:get_value())
			)
			local orientation = terrain_obj["Orientation"]
			obj:set_rotation ({
				roll = tonumber (orientation["X"]:get_value()),
				pitch = tonumber (orientation["Y"]:get_value()),
				yaw = tonumber (orientation["Z"]:get_value())
			})
		end -- for
	end -- if

end -- function tl_load_from_heightmap


------------------------------------------------------------------------------
-- Загрузка карты из сетки.
------------------------------------------------------------------------------

function tl_load_from_mesh(terrain)

	CONSOLE:println ("Loading terrain fom mesh.")

	tl_create_terrain_from_mesh(
		terrain:get_name (),
		terrain["TopMesh"]:get_value(),
		terrain["BottomMesh"]:get_value(),
		tonumber (terrain["PathMapSize"]:get_value()),
		tonumber (terrain["HeightMapSize"]:get_value()),
		obj2vec (terrain["Scale"])
	)

end -- function tl_load_from_mesh


------------------------------------------------------------------------------
-- Загрузка карты тактического уровня.
------------------------------------------------------------------------------

function tl_load_map (map_file)

	local map, success, msg

	--------------------------------------------------------------------------
	-- Грузим объект с картой.
	--------------------------------------------------------------------------

	map = restore_object (map_file)

	tl_set_map_name (map["File"]:get_value())

	log_message ("tl_load_map: Loading map "..map:get_name ())

	--------------------------------------------------------------------------
	-- Создание ландшафта.
	--------------------------------------------------------------------------

	success, msg = pcall (

		function ()

			log_message ("tl_load_map: Creating terrains...")
			update_progress (.15)

			local terrains = map["Terrains"]:get_attributes ()
			local terrain_count = table.getn (terrains)

			for i = 1, terrain_count do

				local dimensions
				local terrain = terrains[i]

				if (terrain["Type"] == nil or terrain["Type"]:get_value() == "HeightMap") then
					tl_load_from_heightmap (terrain)
				else
					if (terrain["Type"]:get_value() == "Mesh") then
						tl_load_from_mesh(terrain)
					end
				end

				CONSOLE:println ("    "..terrains[i]:get_name ())
				update_progress (.15+.5*i/terrain_count)
			end -- for
		end -- function
	)

	if not success then
		log_message (debug.traceback("ERROR: "..msg))
	end

	--------------------------------------------------------------------------
	-- Создание окружения.
	--------------------------------------------------------------------------

	--[[

	log_message ("tl_load_map: Creating environment...")
	success, msg = pcall (

		function ()
			if map["Environment"] ~= nil then
				tl_create_environment (map["Environment"]:get_value())
			else
				tl_create_environment ("res://sunny1.env")

			end -- if
			update_progress (.95)
		end

	)

	if not success then
		log_message (debug.traceback("ERROR: "..msg))
	end

	]]

	--------------------------------------------------------------------------
	-- Загрузка объектов и юнитов.
	--------------------------------------------------------------------------

	if (load_static==true) then

	log_message ("tl_load_map: Loading objects...")
	success, msg = pcall (
		function ()
			if not EDITOR_MODE then
				tl_restore_units (map["Objects"]:get_value())
			end
		end
	)

	if not success then
		log_message (debug.traceback("ERROR: "..msg))
	end

	end -- if

	--------------------------------------------------------------------------
	-- Создание областей.
	--------------------------------------------------------------------------

	log_message ("tl_load_map: Loading areas...")
	success, msg = pcall (
		function ()

			local areas = map["Areas"]:get_attributes ()
			local area_count = table.getn (areas)

			for i = 1, area_count do
				local area = areas[i]

				local area_name = area:get_name ()
				local area_type = area["Type"]:get_value()
				local area_appearance = area["Appearance"]:get_value()

				local a = tl_create_area (area_name, area_type, area_appearance);

				a:set_dimensions (
					tonumber (area["Dimensions.D1"]:get_value()),
					tonumber (area["Dimensions.D2"]:get_value())
				)

				a:set_position (
					tonumber (area["Position.X"]:get_value()),
					tonumber (area["Position.Z"]:get_value())
				)

				a:get_appearance ():set_colour (
					tonumber (area["Colour.R"]:get_value()),
					tonumber (area["Colour.G"]:get_value()),
					tonumber (area["Colour.B"]:get_value()),
					tonumber (area["Colour.A"]:get_value())
				)

			end -- for

		end
	)

	if not success then
		log_message (debug.traceback("ERROR: "..msg))
	end

	--------------------------------------------------------------------------
	-- Установка направлений отхода.
	--------------------------------------------------------------------------

	success, msg = pcall (
		function ()

			tl_set_attackers_WD {
				x = tonumber (map["WithdrawingDirections.Attackers.X"]:get_value()),
				z = tonumber (map["WithdrawingDirections.Attackers.Z"]:get_value())
			}

			tl_set_defenders_WD {
				x = tonumber (map["WithdrawingDirections.Defenders.X"]:get_value()),
				z = tonumber (map["WithdrawingDirections.Defenders.Z"]:get_value())
			}

		end
	)

	if not success then
		log_message (debug.traceback("ERROR: "..msg))
	end

	--------------------------------------------------------------------------
	-- Удаляем объект с картой.
	--------------------------------------------------------------------------

	OBJECT:remove (map:get_name ())

	log_message ("tl_load_map: Leaving function body.")
end

log_message ("Leaving tl_load_map.lua")

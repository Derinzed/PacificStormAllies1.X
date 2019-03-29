log_message ("sl_japan_player_init.lua ")

sl_set_fuel_percent(1)

----------------------------------------------------------------------------------------
-- Начатое производство
----------------------------------------------------------------------------------------

sl_japan_player:add_to_production("Ships.Yamato.Prototype", 1, 0.9)
sl_japan_player:add_to_production("Ships.Taiho.Prototype", 1, 0.7)

sl_usa_player:add_to_production("Airplanes.A6M.Prototype", 20, 0.01)
sl_usa_player:add_to_production("Airplanes.B5N.Prototype", 20, 0.01)
sl_usa_player:add_to_production("Airplanes.D3A.Prototype", 20, 0.01)
sl_usa_player:add_to_production("Airplanes.Ki-21.Prototype", 10, 0.01)
sl_usa_player:add_to_production("Airplanes.Ki-43.Prototype", 10, 0.01)


----------------------------------------------------------------------------------------
-- Токио Base29
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Airport", "", 1, "Base29")
sl_japan_player:set_building_upgrade("Airport", 3, "Base29")

sl_japan_player:add_building("Port", "", 1, "Base29")
sl_japan_player:set_building_upgrade("Port", 3, "Base29")

sl_japan_player:add_building("Tank", "", 8, "Base29")
sl_japan_player:set_building_upgrade("Tank", 2, "Base29")

sl_japan_player:add_building("Store", "", 6, "Base29")
sl_japan_player:set_building_upgrade("Store", 2, "Base29")

sl_japan_player:add_building("House", "", 42, "Base29")
sl_japan_player:set_building_upgrade("House", 2, "Base29")

sl_japan_player:add_building("Bunker", "", 2, "Base29")
sl_japan_player:set_building_upgrade("Bunker", 2, "Base29")

sl_japan_player:add_building("Mine", "", 7, "Base29")
sl_japan_player:set_building_upgrade("Mine", 2, "Base29")

sl_japan_player:add_building("Hospital", "", 2, "Base29")
sl_japan_player:set_building_upgrade("Hospital", 2, "Base29")

sl_japan_player:add_building("Church", "", 2, "Base29")
sl_japan_player:set_building_upgrade("Church", 2, "Base29")

sl_japan_player:add_building("Defence", "", 1, "Base29")
sl_japan_player:set_building_upgrade("Defence", 2, "Base29")

--sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 2, "Base29")
--sl_japan_player:set_building_upgrade("RadioStation", 2, "Base29")

sl_japan_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 8, "Base29")
--sl_japan_player:set_building_upgrade("AAGun", 2, "Base29")

sl_japan_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 6, "Base29")
--sl_japan_player:set_building_upgrade("AAGun", 2, "Base29")

sl_japan_player:add_building("Artillery", "Turrets.Main_Turret_203x2_Mogami.Main_Turret_203x2_Mogami", 2, "Base29")
--sl_japan_player:set_building_upgrade("Artillery", 2, "Base29")

sl_japan_player:add_building("ShootingRange", "", 1, "Base29")

base = get_base("Base29")
base:add_cargo("Resources", "Oil", 100000, 0)
base:add_cargo("Ammos", "Ammo", 15000, 0)
base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 100)
base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 100)

base:create_forces()

base:add_men("Soldiers", 3, 15400)
base:add_men("Seamen", 1, 2650)
base:add_men("Seamen", 2, 6500)
base:add_men("Seamen", 3, 4960)
base:add_men("Seamen", 4, 1320)
base:add_men("Pilots", 1, 1600)
base:add_men("Pilots", 2, 2300)
base:add_men("Pilots", 3, 1900)
base:add_men("Pilots", 4, 660)
base:add_men("Engineers", 2, 1400)
base:add_men("Engineers", 3, 2000)
base:add_men("Engineers", 4, 600)

----------------------------------------------------------------------------------------
-- Осака Base28
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Airport", "", 1, "Base28")
sl_japan_player:set_building_upgrade("Airport", 3, "Base28")

sl_japan_player:add_building("Port", "", 1, "Base28")
sl_japan_player:set_building_upgrade("Port", 3, "Base28")

sl_japan_player:add_building("Tank", "", 6, "Base28")
sl_japan_player:set_building_upgrade("Tank", 2, "Base28")

sl_japan_player:add_building("Store", "", 5, "Base28")
sl_japan_player:set_building_upgrade("Store", 2, "Base28")

sl_japan_player:add_building("House", "", 39, "Base28")
sl_japan_player:set_building_upgrade("House", 2, "Base28")

sl_japan_player:add_building("Bunker", "", 2, "Base28")
sl_japan_player:set_building_upgrade("Bunker", 2, "Base28")

sl_japan_player:add_building("Mine", "", 7, "Base28")
sl_japan_player:set_building_upgrade("Mine", 2, "Base28")

sl_japan_player:add_building("Hospital", "", 2, "Base28")
sl_japan_player:set_building_upgrade("Hospital", 2, "Base28")

sl_japan_player:add_building("Church", "", 2, "Base28")
sl_japan_player:set_building_upgrade("Church", 2, "Base28")

sl_japan_player:add_building("Defence", "", 2, "Base28")
sl_japan_player:set_building_upgrade("Defence", 2, "Base28")

--sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 2, "Base28")
--sl_japan_player:set_building_upgrade("RadioStation", 2, "Base28")

sl_japan_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 10, "Base28")
--sl_japan_player:set_building_upgrade("AAGun", 2, "Base28")

sl_japan_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 8, "Base28")
--sl_japan_player:set_building_upgrade("AAGun", 2, "Base28")

sl_japan_player:add_building("Artillery", "Turrets.Main_Turret_203x2_Mogami.Main_Turret_203x2_Mogami", 4, "Base28")
--sl_japan_player:set_building_upgrade("Artillery", 2, "Base28")

sl_japan_player:add_building("ShootingRange", "", 1, "Base28")

base = get_base("Base28")
base:add_cargo("Resources", "Oil", 50000, 0)
base:add_cargo("Ammos", "Ammo", 25000, 0)
base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 200)
base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 200)

base:create_forces()

base:add_men("Soldiers", 1, 9000)
base:add_men("Soldiers", 2, 8100)
base:add_men("Soldiers", 3, 2150)
base:add_men("Seamen", 1, 1550)
base:add_men("Seamen", 2, 3000)
base:add_men("Seamen", 3, 2600)
base:add_men("Seamen", 4, 1220)
base:add_men("Pilots", 1, 1500)
base:add_men("Pilots", 2, 2000)
base:add_men("Pilots", 3, 2500)
base:add_men("Pilots", 4, 600)
base:add_men("Engineers", 2, 1500)
base:add_men("Engineers", 3, 2000)
base:add_men("Engineers", 4, 600)

----------------------------------------------------------------------------------------
-- Ниигата Base19
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Airport", "", 1, "Base19")
sl_japan_player:set_building_upgrade("Airport", 2, "Base19")

sl_japan_player:add_building("Port", "", 1, "Base19")
sl_japan_player:set_building_upgrade("Port", 2, "Base19")

sl_japan_player:add_building("Tank", "", 1, "Base19")
sl_japan_player:set_building_upgrade("Tank", 2, "Base19")

sl_japan_player:add_building("Store", "", 1, "Base19")
sl_japan_player:set_building_upgrade("Store", 2, "Base19")

sl_japan_player:add_building("House", "", 7, "Base19")
sl_japan_player:set_building_upgrade("House", 2, "Base19")

--sl_japan_player:add_building("Bunker", "", 2, "Base19")
--sl_japan_player:set_building_upgrade("Bunker", 2, "Base19")

sl_japan_player:add_building("Mine", "", 1, "Base19")
sl_japan_player:set_building_upgrade("Mine", 2, "Base19")

sl_japan_player:add_building("Hospital", "", 4, "Base19")
sl_japan_player:set_building_upgrade("Hospital", 1, "Base19")

sl_japan_player:add_building("Church", "", 1, "Base19")
sl_japan_player:set_building_upgrade("Church", 1, "Base19")

--sl_japan_player:add_building("Defence", "", 1, "Base19")
--sl_japan_player:set_building_upgrade("Defence", 2, "Base19")

sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 1, "Base19")
sl_japan_player:set_building_upgrade("RadioStation", 2, "Base19")

sl_japan_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 6, "Base19")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base19")

sl_japan_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 4, "Base19")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base19")

sl_japan_player:add_building("Artillery", "Turrets.Main_Turret_203x2_Mogami.Main_Turret_203x2_Mogami", 2, "Base19")
--sl_japan_player:set_building_upgrade("Artillery", 1, "Base19")

sl_japan_player:add_building("ShootingRange", "", 1, "Base19")

base = get_base("Base19")
base:add_cargo("Resources", "Oil", 2000, 0)
base:add_cargo("Ammos", "Ammo", 5000, 0)
base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 50)
base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 50)

base:create_forces()

base:add_men("Soldiers", 1, 500)
base:add_men("Soldiers", 2, 500)
base:add_men("Seamen", 1, 1000)
base:add_men("Seamen", 2, 800)
base:add_men("Seamen", 3, 700)
base:add_men("Seamen", 4, 500)
base:add_men("Pilots", 1, 100)
base:add_men("Pilots", 2, 65)
base:add_men("Pilots", 3, 25)
base:add_men("Pilots", 4, 10)
base:add_men("Engineers", 2, 1000)
base:add_men("Engineers", 3, 1000)
base:add_men("Engineers", 4, 1000)

----------------------------------------------------------------------------------------
-- Порт-Артур Base36
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Airport", "", 1, "Base36")
sl_japan_player:set_building_upgrade("Airport", 3, "Base36")

sl_japan_player:add_building("Port", "", 1, "Base36")
sl_japan_player:set_building_upgrade("Port", 2, "Base36")

sl_japan_player:add_building("Tank", "", 4, "Base36")
sl_japan_player:set_building_upgrade("Tank", 2, "Base36")

sl_japan_player:add_building("Store", "", 3, "Base36")
sl_japan_player:set_building_upgrade("Store", 2, "Base36")

sl_japan_player:add_building("House", "", 32, "Base36")
sl_japan_player:set_building_upgrade("House", 2, "Base36")

sl_japan_player:add_building("Bunker", "", 2, "Base36")
sl_japan_player:set_building_upgrade("Bunker", 2, "Base36")

sl_japan_player:add_building("Mine", "", 1, "Base36")
sl_japan_player:set_building_upgrade("Mine", 2, "Base36")

sl_japan_player:add_building("Hospital", "", 3, "Base36")
sl_japan_player:set_building_upgrade("Hospital", 1, "Base36")

sl_japan_player:add_building("Church", "", 1, "Base36")
sl_japan_player:set_building_upgrade("Church", 1, "Base36")

sl_japan_player:add_building("Defence", "", 1, "Base36")
sl_japan_player:set_building_upgrade("Defence", 2, "Base36")

sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 1, "Base36")
sl_japan_player:set_building_upgrade("RadioStation", 2, "Base36")

sl_japan_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 6, "Base36")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base36")

sl_japan_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 4, "Base36")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base36")

sl_japan_player:add_building("Artillery", "Turrets.Main_Turret_203x2_Mogami.Main_Turret_203x2_Mogami", 2, "Base36")
--sl_japan_player:set_building_upgrade("Artillery", 1, "Base36")

--sl_japan_player:add_building("ShootingRange", "", 1, "Base36")

base = get_base("Base36")
base:add_cargo("Resources", "Oil", 2000, 0)
base:add_cargo("Ammos", "Ammo", 5000, 0)
base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 50)
base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 50)

base:create_forces()

base:add_men("Soldiers", 1, 3000)
base:add_men("Soldiers", 2, 10500)
base:add_men("Soldiers", 3, 15000)
base:add_men("Seamen", 1, 400)
base:add_men("Seamen", 2, 300)
base:add_men("Seamen", 3, 200)
base:add_men("Seamen", 4, 100)
base:add_men("Pilots", 1, 100)
base:add_men("Pilots", 2, 65)
base:add_men("Pilots", 3, 25)
base:add_men("Pilots", 4, 10)
base:add_men("Engineers", 2, 500)
base:add_men("Engineers", 3, 1000)
base:add_men("Engineers", 4, 1000)

----------------------------------------------------------------------------------------
-- Шанхай Base37
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Airport", "", 1, "Base37")
sl_japan_player:set_building_upgrade("Airport", 2, "Base37")

sl_japan_player:add_building("Port", "", 1, "Base37")
sl_japan_player:set_building_upgrade("Port", 1, "Base37")

sl_japan_player:add_building("Tank", "", 3, "Base37")
sl_japan_player:set_building_upgrade("Tank", 1, "Base37")

sl_japan_player:add_building("Store", "", 5, "Base37")
sl_japan_player:set_building_upgrade("Store", 1, "Base37")

sl_japan_player:add_building("House", "", 45, "Base37")
sl_japan_player:set_building_upgrade("House", 1, "Base37")

sl_japan_player:add_building("Hospital", "", 3, "Base37")
sl_japan_player:set_building_upgrade("Hospital", 1, "Base37")

sl_japan_player:add_building("Church", "", 2, "Base37")
sl_japan_player:set_building_upgrade("Church", 1, "Base37")

--sl_japan_player:add_building("Defence", "", 1, "Base37")
--sl_japan_player:set_building_upgrade("Defence", 2, "Base37")

sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 1, "Base37")
sl_japan_player:set_building_upgrade("RadioStation", 2, "Base37")

--sl_japan_player:add_building("ShootingRange", "", 1, "Base37")

base = get_base("Base37")
base:add_cargo("Resources", "Oil", 25000, 0)
base:add_cargo("Ammos", "Ammo", 8000, 0)
base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 90)
base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 90)
base:create_forces()

base:add_men("Soldiers", 1, 3000)
base:add_men("Soldiers", 2, 15000)
base:add_men("Soldiers", 3, 20500)
base:add_men("Seamen", 1, 1000)
base:add_men("Seamen", 2, 1000)
base:add_men("Seamen", 3, 1000)
base:add_men("Seamen", 4, 500)
base:add_men("Pilots", 1, 100)
base:add_men("Pilots", 2, 65)
base:add_men("Pilots", 3, 25)
base:add_men("Pilots", 4, 10)
base:add_men("Engineers", 2, 1000)
base:add_men("Engineers", 3, 1500)
base:add_men("Engineers", 4, 500)

----------------------------------------------------------------------------------------
-- Нагасаки Base35
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Airport", "", 1, "Base35")
sl_japan_player:set_building_upgrade("Airport", 3, "Base35")

sl_japan_player:add_building("Port", "", 1, "Base35")
sl_japan_player:set_building_upgrade("Port", 2, "Base35")

sl_japan_player:add_building("Tank", "", 4, "Base35")
sl_japan_player:set_building_upgrade("Tank", 2, "Base35")

sl_japan_player:add_building("Store", "", 3, "Base35")
sl_japan_player:set_building_upgrade("Store", 2, "Base35")

sl_japan_player:add_building("House", "", 28, "Base35")
sl_japan_player:set_building_upgrade("House", 2, "Base35")

sl_japan_player:add_building("Bunker", "", 2, "Base35")
sl_japan_player:set_building_upgrade("Bunker", 2, "Base35")

sl_japan_player:add_building("Mine", "", 5, "Base35")
sl_japan_player:set_building_upgrade("Mine", 2, "Base35")

sl_japan_player:add_building("Hospital", "", 2, "Base35")
sl_japan_player:set_building_upgrade("Hospital", 2, "Base35")

sl_japan_player:add_building("Church", "", 2, "Base35")
sl_japan_player:set_building_upgrade("Church", 2, "Base35")

sl_japan_player:add_building("Defence", "", 1, "Base35")
sl_japan_player:set_building_upgrade("Defence", 2, "Base35")

--sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 2, "Base35")
--sl_japan_player:set_building_upgrade("RadioStation", 2, "Base35")

sl_japan_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 8, "Base35")
--sl_japan_player:set_building_upgrade("AAGun", 2, "Base35")

sl_japan_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 6, "Base35")
--sl_japan_player:set_building_upgrade("AAGun", 2, "Base35")

sl_japan_player:add_building("Artillery", "Turrets.Main_Turret_203x2_Mogami.Main_Turret_203x2_Mogami", 2, "Base35")
--sl_japan_player:set_building_upgrade("Artillery", 2, "Base35")

sl_japan_player:add_building("ShootingRange", "", 1, "Base35")

base = get_base("Base35")
base:add_cargo("Resources", "Oil", 50000, 0)
base:add_cargo("Ammos", "Ammo", 25000, 0)
base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 200)
base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 200)

base:create_forces()

base:add_men("Soldiers", 1, 6200)
base:add_men("Soldiers", 2, 5600)
base:add_men("Soldiers", 3, 1500)
base:add_men("Seamen", 1, 1100)
base:add_men("Seamen", 2, 2400)
base:add_men("Seamen", 3, 2200)
base:add_men("Seamen", 4, 880)
base:add_men("Pilots", 1, 1000)
base:add_men("Pilots", 2, 1500)
base:add_men("Pilots", 3, 1000)
base:add_men("Pilots", 4, 400)
base:add_men("Engineers", 2, 1000)
base:add_men("Engineers", 3, 2100)
base:add_men("Engineers", 4, 500)


----------------------------------------------------------------------------------------
-- Создаем формацию на карте
----------------------------------------------------------------------------------------

base2 = get_base("Base29")

form = sl_create_formation("Japan", "Destroyer_Division_japan", 985, 1291)
form:equip_supply_units()
form:equip_units()
form:go_to_base(base2:get_id())

sl_set_fuel_percent(0.01)


--- помогаем АИ - создадим ему сразу пустых формаций транспортов и танкеров
if (sl_get_my_player_id() ~= sl_japan_player:get_id()) then
	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base29")
	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base29")
	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base29")
	sl_japan_player:create_formation_on_base("Tanker_Battalion_japan", "Base29")
	sl_japan_player:create_formation_on_base("Tanker_Battalion_japan", "Base29")	

	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base28")
	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base28")
	sl_japan_player:create_formation_on_base("Tanker_Battalion_japan", "Base28")
	sl_japan_player:create_formation_on_base("Tanker_Battalion_japan", "Base28")
	
	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base35")
	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base35")
	sl_japan_player:create_formation_on_base("Tanker_Battalion_japan", "Base35")
	sl_japan_player:create_formation_on_base("Tanker_Battalion_japan", "Base35")
end

--[[
	-- FOR DEBUG --
	sl_set_fuel_percent(100)
	sl_get_zone("Zone106"):create_base(sl_japan_player:get_id())
	baseName = "Base106"
	base = get_base(baseName)
	player = sl_usa_player
	player:add_building("Airport", "", 1, baseName)
	player:set_building_upgrade("Airport", 3, baseName)
	player:add_building("House", "", 35, baseName)
	player:add_building("Store", "", 1, baseName)
--	player:add_building("Tank", "", 5, baseName)
	player:add_building("Mine", "", 2, baseName)
--	base:add_cargo("Resources", "Oil", 500000, 0)
--	base:add_cargo("Ammos", "Ammo", 10000, 0)
--	base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 100)
--	base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 100)
--	base:add_units("Airplanes.A6M.Prototype", 100)
--	player:create_formation_on_base("AircraftCarrier_Battalion_usa", baseName)
	form = sl_create_formation("USA", "AircraftCarrier_Battalion_usa", 1426, 2010)
	form:equip_supply_units()
	form:equip_units()
]]

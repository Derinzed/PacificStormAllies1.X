log_message ("sl_usa_player_init.lua ")

sl_set_fuel_percent(1)

----------------------------------------------------------------------------------------
-- Начатое производство
----------------------------------------------------------------------------------------

sl_usa_player:add_to_production("Ships.Essex.Prototype", 1, 0.7)
sl_usa_player:add_to_production("Ships.Iowa.Prototype", 1, 0.2)
sl_usa_player:add_to_production("Ships.Essex.Prototype", 1, 0.6)

sl_usa_player:add_to_production("Airplanes.B-24.Prototype", 10, 0.01)
sl_usa_player:add_to_production("Airplanes.B-24.Prototype", 10, 0.01)
sl_usa_player:add_to_production("Airplanes.OS2U.Prototype", 20, 0.01)

----------------------------------------------------------------------------------------
-- Сан-Диего Base16
----------------------------------------------------------------------------------------

sl_usa_player:add_building("Airport", "", 1, "Base16")
sl_usa_player:set_building_upgrade("Airport", 3, "Base16")
sl_usa_player:add_building("Port", "", 1, "Base16")
sl_usa_player:set_building_upgrade("Port", 3, "Base16")
sl_usa_player:add_building("Store", "", 5, "Base16")
sl_usa_player:set_building_upgrade("Store", 2, "Base16")
sl_usa_player:add_building("Tank", "", 10, "Base16")
sl_usa_player:set_building_upgrade("Tank", 2, "Base16")
sl_usa_player:add_building("House", "", 36, "Base16")
sl_usa_player:set_building_upgrade("House", 3, "Base16")
sl_usa_player:add_building("Bunker", "", 6, "Base16")
sl_usa_player:set_building_upgrade("Bunker", 2, "Base16")
sl_usa_player:add_building("Mine", "", 7, "Base16")
sl_usa_player:set_building_upgrade("Mine", 2, "Base16")
sl_usa_player:add_building("Hospital", "", 3, "Base16")
sl_usa_player:set_building_upgrade("Hospital", 2, "Base16")
sl_usa_player:add_building("Church", "", 3, "Base16")
sl_usa_player:set_building_upgrade("Church", 2, "Base16")
sl_usa_player:add_building("Defence", "", 3, "Base16")
sl_usa_player:set_building_upgrade("Defence", 2, "Base16")
sl_usa_player:add_building("ShootingRange", "", 1, "Base16")
sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 2, "Base16")
--sl_usa_player:set_building_upgrade("RadioStation", 2, "Base16")
sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 12, "Base16")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base16")
sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 12, "Base16")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base16")
sl_usa_player:add_building("Artillery", "Turrets.Baltimor_Main_Turret.Baltimor_Main_Turret", 6, "Base16")
--sl_usa_player:set_building_upgrade("Artillery", 2, "Base16")

base = get_base("Base16")
base:add_cargo("Resources", "Oil", 100000, 0)
base:add_cargo("Ammos", "Ammo", 50000, 0)
base:add_cargo("Ammos", "Torp_US_Mk15", 0, 300)
base:add_cargo("Ammos", "Torp_US_Mk13", 0, 300)

base:create_forces()

base:add_men("Soldiers", 1, 20000)
base:add_men("Soldiers", 2, 4000)
base:add_men("Soldiers", 3, 1000)
base:add_men("Seamen", 1, 100000)
base:add_men("Seamen", 2, 2000)
base:add_men("Seamen", 3, 500)
base:add_men("Pilots", 1, 1000)
base:add_men("Pilots", 2, 400)
base:add_men("Pilots", 3, 200)
base:add_men("Engineers", 1, 300)
base:add_men("Engineers", 2, 900)
base:add_men("Engineers", 3, 800)
base:add_men("Engineers", 4, 300)

----------------------------------------------------------------------------------------
-- Создаем первый американский флот в открытом море на карте в локации Сан-Диего
----------------------------------------------------------------------------------------

form = sl_create_formation("USA", "Destroyer_Division_usa", 3150, 970)
form:equip_supply_units()
form:equip_units()
base2 = get_base("Base48")
if base2 then
	form:go_to_base(base2:get_id())
end

----------------------------------------------------------------------------------------
-- Создаем второй американский флот в открытом море на карте в локации Перл-Харбор
----------------------------------------------------------------------------------------
form = sl_create_formation("USA", "Destroyer_Division_usa", 2380, 1220)
form:equip_supply_units()
form:equip_units()
base2 = get_base("Base48")
if base2 then
	form:go_to_base(base2:get_id())
end

----------------------------------------------------------------------------------------
-- Создаем третий американский флот в открытом море на карте в локации Манила
----------------------------------------------------------------------------------------
form = sl_create_formation("USA", "Destroyer_Division_usa", 960, 1309)
form:equip_supply_units()
form:equip_units()
base2 = get_base("Base48")
if base2 then
	form:go_to_base(base2:get_id())
end

----------------------------------------------------------------------------------------
-- Перл - Харбор Base48
----------------------------------------------------------------------------------------

sl_usa_player:add_building("Airport", "", 1, "Base48")
sl_usa_player:set_building_upgrade("Airport", 3, "Base48")
sl_usa_player:add_building("Port", "", 1, "Base48")
sl_usa_player:set_building_upgrade("Port", 3, "Base48")
sl_usa_player:add_building("Tank", "", 2, "Base48")
sl_usa_player:set_building_upgrade("Tank", 2, "Base48")
sl_usa_player:add_building("Store", "", 2, "Base48")
sl_usa_player:set_building_upgrade("Store", 2, "Base48")
sl_usa_player:add_building("House", "", 4, "Base48")
sl_usa_player:set_building_upgrade("House", 3, "Base48")
sl_usa_player:add_building("Bunker", "", 3, "Base48")
sl_usa_player:set_building_upgrade("Bunker", 2, "Base48")
--ЧТОБЫ ПОПРОСИЛИ ПОСТРОИТЬ ДОБЫВ. ЗДАНИЕ
--sl_usa_player:add_building("Mine", "", 1, "Base48")
--sl_usa_player:set_building_upgrade("Mine", 2, "Base48")
--ЧТОБЫ БЫЛА ИКОНКА ОТСУТСТВИЯ ГОСПИТАЛЯ И БЫЛО, ЧТО ДЕЛАТЬ
--sl_usa_player:add_building("Hospital", "", 3, "Base48")
--sl_usa_player:set_building_upgrade("Hospital", 2, "Base48")
sl_usa_player:add_building("Church", "", 2, "Base48")
sl_usa_player:set_building_upgrade("Church", 2, "Base48")
sl_usa_player:add_building("Defence", "", 3, "Base48")
sl_usa_player:set_building_upgrade("Defence", 2, "Base48")
sl_usa_player:add_building("ShootingRange", "", 1, "Base48")
sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 2, "Base48")
--sl_usa_player:set_building_upgrade("RadioStation", 2, "Base48")
sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 12, "Base48")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base48")
sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 12, "Base48")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base48")
sl_usa_player:add_building("Artillery", "Turrets.Baltimor_Main_Turret.Baltimor_Main_Turret", 6, "Base48")
--sl_usa_player:set_building_upgrade("Artillery", 2, "Base48")

base = get_base("Base48")
base:add_cargo("Resources", "Oil", 50000, 0)
base:add_cargo("Ammos", "Ammo", 25000, 0)
base:add_cargo("Ammos", "Torp_US_Mk15", 0, 200)
base:add_cargo("Ammos", "Torp_US_Mk13", 0, 200)

base:create_forces()

base:add_men("Soldiers", 2, 500)
base:add_men("Soldiers", 3, 500)
base:add_men("Seamen", 3, 1000)
base:add_men("Pilots", 1, 300)
base:add_men("Pilots", 3, 200)
base:add_men("Engineers", 2, 900)
base:add_men("Engineers", 3, 100)
base:add_men("Engineers", 4, 500)


----------------------------------------------------------------------------------------
-- Монтеррей Base15
----------------------------------------------------------------------------------------

sl_usa_player:add_building("Airport", "", 1, "Base15")
sl_usa_player:set_building_upgrade("Airport", 3, "Base15")
sl_usa_player:add_building("Port", "", 1, "Base15")
sl_usa_player:set_building_upgrade("Port", 2, "Base15")
sl_usa_player:add_building("Tank", "", 10, "Base15")
sl_usa_player:set_building_upgrade("Tank", 2, "Base15")
sl_usa_player:add_building("Store", "", 6, "Base15")
sl_usa_player:set_building_upgrade("Store", 2, "Base15")
sl_usa_player:add_building("House", "", 35, "Base15")
sl_usa_player:set_building_upgrade("House", 2, "Base15")
sl_usa_player:add_building("Bunker", "", 3, "Base15")
sl_usa_player:set_building_upgrade("Bunker", 2, "Base15")
sl_usa_player:add_building("Mine", "", 7, "Base15")
sl_usa_player:set_building_upgrade("Mine", 2, "Base15")
sl_usa_player:add_building("Hospital", "", 3, "Base15")
sl_usa_player:set_building_upgrade("Hospital", 2, "Base15")
sl_usa_player:add_building("Church", "", 2, "Base15")
sl_usa_player:set_building_upgrade("Church", 2, "Base15")
sl_usa_player:add_building("Defence", "", 2, "Base15")
sl_usa_player:set_building_upgrade("Defence", 2, "Base15")
sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 2, "Base15")
sl_usa_player:set_building_upgrade("RadioStation", 2, "Base15")
sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 12, "Base15")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base15")
sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 12, "Base15")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base15")
sl_usa_player:add_building("Artillery", "Turrets.Baltimor_Main_Turret.Baltimor_Main_Turret", 6, "Base15")
--sl_usa_player:set_building_upgrade("Artillery", 2, "Base15")
sl_usa_player:add_building("ShootingRange", "", 1, "Base15")

base = get_base("Base15")
base:add_cargo("Resources", "Oil", 10000, 0)
base:add_cargo("Ammos", "Ammo", 16000, 0)
base:add_cargo("Ammos", "Torp_US_Mk15", 0, 100)
base:add_cargo("Ammos", "Torp_US_Mk13", 0, 100)

base:create_forces()

base:add_men("Soldiers", 1, 14000)
base:add_men("Soldiers", 2, 6000)
base:add_men("Seamen", 1, 3000)
base:add_men("Seamen", 2, 3000)
base:add_men("Seamen", 3, 2000)
base:add_men("Pilots", 1, 900)
base:add_men("Pilots", 2, 1000)
base:add_men("Pilots", 3, 500)
base:add_men("Engineers", 2, 1000)
base:add_men("Engineers", 3, 2000)
base:add_men("Engineers", 4, 1000)

----------------------------------------------------------------------------------------
-- Бремертон Base14
----------------------------------------------------------------------------------------

sl_usa_player:add_building("Airport", "", 1, "Base14")
sl_usa_player:set_building_upgrade("Airport", 3, "Base14")

sl_usa_player:add_building("Port", "", 1, "Base14")
sl_usa_player:set_building_upgrade("Port", 2, "Base14")

sl_usa_player:add_building("Tank", "", 10, "Base14")
sl_usa_player:set_building_upgrade("Tank", 2, "Base14")

sl_usa_player:add_building("Store", "", 5, "Base14")
sl_usa_player:set_building_upgrade("Store", 2, "Base14")

sl_usa_player:add_building("House", "", 15, "Base14")
sl_usa_player:set_building_upgrade("House", 2, "Base14")

sl_usa_player:add_building("Bunker", "", 2, "Base14")
sl_usa_player:set_building_upgrade("Bunker", 2, "Base14")

sl_usa_player:add_building("Mine", "", 7, "Base14")
sl_usa_player:set_building_upgrade("Mine", 2, "Base14")

sl_usa_player:add_building("Hospital", "", 3, "Base14")
sl_usa_player:set_building_upgrade("Hospital", 2, "Base14")

sl_usa_player:add_building("Church", "", 2, "Base14")
sl_usa_player:set_building_upgrade("Church", 2, "Base14")

sl_usa_player:add_building("Defence", "", 2, "Base14")
sl_usa_player:set_building_upgrade("Defence", 2, "Base14")

sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 2, "Base14")
--sl_usa_player:set_building_upgrade("RadioStation", 2, "Base14")

sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 8, "Base14")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base14")

sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 8, "Base14")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base14")

sl_usa_player:add_building("Artillery", "Turrets.Baltimor_Main_Turret.Baltimor_Main_Turret", 4, "Base14")
--sl_usa_player:set_building_upgrade("Artillery", 2, "Base14")

sl_usa_player:add_building("ShootingRange", "", 1, "Base14")

base = get_base("Base14")
base:add_cargo("Resources", "Oil", 20000, 0)
--base:add_cargo("Ammos", "Ammo", 10000, 0)
--base:add_cargo("Ammos", "Torp_US_Mk15", 0, 200)
--base:add_cargo("Ammos", "Torp_US_Mk13", 0, 200)

base:create_forces()

base:add_men("Soldiers", 1, 5000)
base:add_men("Soldiers", 2, 2000)
base:add_men("Seamen", 1, 1000)
base:add_men("Seamen", 2, 2000)
base:add_men("Seamen", 3, 1000)
base:add_men("Pilots", 1, 1000)
base:add_men("Pilots", 2, 1000)
base:add_men("Pilots", 3, 200)
base:add_men("Engineers", 2, 500)
base:add_men("Engineers", 3, 1000)
base:add_men("Engineers", 4, 500)

sl_set_fuel_percent(0.01)



--- помогаем АИ - создадим ему сразу пустых формаций транспортов и танкеров
if (sl_get_my_player_id() ~= sl_usa_player:get_id()) then
	--Сан-Диего
	sl_usa_player:create_formation_on_base("Transport_Battalion_usa", "Base16")
	sl_usa_player:create_formation_on_base("Transport_Battalion_usa", "Base16")
	sl_usa_player:create_formation_on_base("Transport_Battalion_usa", "Base16")
	sl_usa_player:create_formation_on_base("Transport_Battalion_usa", "Base16")
	sl_usa_player:create_formation_on_base("Tanker_Battalion_usa", "Base16")
	sl_usa_player:create_formation_on_base("Tanker_Battalion_usa", "Base16")

	--Перл-Харбор
	sl_usa_player:create_formation_on_base("Transport_Battalion_usa", "Base48")
	sl_usa_player:create_formation_on_base("Transport_Battalion_usa", "Base48")
	sl_usa_player:create_formation_on_base("Tanker_Battalion_usa", "Base48")
	sl_usa_player:create_formation_on_base("Tanker_Battalion_usa", "Base48")
	
end

-- НАЗНАЧАЕМ КОМАНДИРОВ НА ФОРМАЦИИ

-- 1. Создадим и назначим
local formation = sl_usa_player:create_formation_on_base("AircraftCarrier_Battalion_usa", "Base16")
formation:set_commander("Halsey")

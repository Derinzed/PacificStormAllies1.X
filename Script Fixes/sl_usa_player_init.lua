log_message ("sl_usa_player_init.lua ")

sl_set_fuel_percent(1)

----------------------------------------------------------------------------------------
-- Начатое производство
----------------------------------------------------------------------------------------

sl_usa_player:add_to_production("Ships.Liberty.Prototype", 36, 1.0)
sl_usa_player:add_to_production("Ships.Simarron.Prototype", 47, 1.0)

sl_usa_player:add_to_production("Ships.Ajova.Prototype", 6, 0.4)
sl_usa_player:add_to_production("Ships.Essex.Prototype", 11, 0.2)
sl_usa_player:add_to_production("Ships.Baltimor.Prototype", 8, 0.1)
sl_usa_player:add_to_production("Ships.Clivlend.Prototype", 1, 0.8)
sl_usa_player:add_to_production("Ships.Clivlend.Prototype", 31, 0.0)
sl_usa_player:add_to_production("Ships.Elco.Prototype", 35, 1.0)
sl_usa_player:add_to_production("Ships.Fletcher.Prototype", 1, 0.8)
sl_usa_player:add_to_production("Ships.Fletcher.Prototype", 174, 0.0)
sl_usa_player:add_to_production("Ships.Clemson.Prototype", 71, 1.0)
sl_usa_player:add_to_production("Ships.Benson.Prototype", 6, 1.0)
sl_usa_player:add_to_production("Ships.Benson.Prototype", 1, 0.8)
sl_usa_player:add_to_production("Ships.Benson.Prototype", 23, 0.0)
sl_usa_player:add_to_production("Ships.Carolina.Prototype", 2, 1.0)
sl_usa_player:add_to_production("Ships.West_Virginia.Prototype", 1, 1.0)
sl_usa_player:add_to_production("Ships.Colorado.Prototype", 2, 1.0)
sl_usa_player:add_to_production("Ships.Arizona.Prototype", 2, 1.0)
sl_usa_player:add_to_production("Ships.NewMexico.Prototype", 3, 1.0)
sl_usa_player:add_to_production("Ships.NY.Prototype", 2, 1.0)
sl_usa_player:add_to_production("Ships.Lexington.Prototype", 2, 1.0)
sl_usa_player:add_to_production("Ships.Enterprise.Prototype", 1, 1.0)
sl_usa_player:add_to_production("Ships.Yorktown.Prototype", 1, 1.0)
sl_usa_player:add_to_production("Ships.Hornet.Prototype", 1, 1.0)
sl_usa_player:add_to_production("Ships.Wasp.Prototype", 1, 1.0)
sl_usa_player:add_to_production("Ships.Ranger.Prototype", 1, 1.0)
sl_usa_player:add_to_production("Ships.JapUboat.Prototype", 18, 1.0)
sl_usa_player:add_to_production("Ships.Gato.Prototype", 47, 1.0)
sl_usa_player:add_to_production("Ships.Omaha.Prototype", 10, 1.0)
sl_usa_player:add_to_production("Ships.Brooklyn.Prototype", 9, 1.0)
sl_usa_player:add_to_production("Ships.Northampton.Prototype", 6, 1.0)
sl_usa_player:add_to_production("Ships.neworleans.Prototype", 7, 1.0)
sl_usa_player:add_to_production("Ships.pensacola.Prototype", 2, 1.0)
sl_usa_player:add_to_production("Ships.portland.Prototype", 2, 1.0)

sl_usa_player:add_to_production("Airplanes.B-17.Prototype", 30, 1.0)
sl_usa_player:add_to_production("Airplanes.F2A2.Prototype", 60, 1.0)
sl_usa_player:add_to_production("Airplanes.F4F.Prototype", 50, 1.0)
sl_usa_player:add_to_production("Airplanes.OS2U.Prototype", 100, 1.0)
sl_usa_player:add_to_production("Airplanes.P-39.Prototype", 40, 1.0)
sl_usa_player:add_to_production("Airplanes.P-40.Prototype", 40, 1.0)
sl_usa_player:add_to_production("Airplanes.PBY.Prototype", 30, 1.0)
sl_usa_player:add_to_production("Airplanes.SBD.Prototype", 60, 1.0)
sl_usa_player:add_to_production("Airplanes.TBD.Prototype", 50, 1.0)
----------------------------------------------------------------------------------------
-- Сан-Диего Base16
----------------------------------------------------------------------------------------
log_message ("creating Base16 ")

sl_usa_player:add_building("Airport", "", 1, "Base16")
sl_usa_player:set_building_upgrade("Airport", 3, "Base16")
sl_usa_player:add_building("Port", "", 1, "Base16")
sl_usa_player:set_building_upgrade("Port", 3, "Base16")
sl_usa_player:add_building("Store", "", 5, "Base16")
sl_usa_player:set_building_upgrade("Store", 2, "Base16")
sl_usa_player:add_building("Tank", "", 10, "Base16")
sl_usa_player:set_building_upgrade("Tank", 2, "Base16")
sl_usa_player:add_building("House", "", 38, "Base16")
sl_usa_player:set_building_upgrade("House", 2, "Base16")
--sl_usa_player:add_building("Bunker", "", 6, "Base16")
--sl_usa_player:set_building_upgrade("Bunker", 2, "Base16")
sl_usa_player:add_building("Mine", "", 7, "Base16")
sl_usa_player:set_building_upgrade("Mine", 2, "Base16")
sl_usa_player:add_building("Hospital", "", 3, "Base16")
sl_usa_player:set_building_upgrade("Hospital", 2, "Base16")
sl_usa_player:add_building("Church", "", 3, "Base16")
sl_usa_player:set_building_upgrade("Church", 2, "Base16")
--sl_usa_player:add_building("Defence", "", 3, "Base16")
--sl_usa_player:set_building_upgrade("Defence", 2, "Base16")
sl_usa_player:add_building("ShootingRange", "", 1, "Base16")
sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 2, "Base16")
sl_usa_player:set_building_upgrade("RadioStation", 2, "Base16")
--sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 12, "Base16")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base16")
sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 10, "Base16")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base16")
sl_usa_player:add_building("Artillery", "Turrets.Colorado_Turret_Small.Colorado_Turret_Small", 10, "Base16")
sl_usa_player:set_building_upgrade("Artillery", 1, "Base16")

base = get_base("Base16")
base:add_cargo("Resources", "Oil", 200000, 0)
base:add_cargo("Ammos", "Ammo", 50000, 0)
base:add_cargo("Ammos", "Torp_US_Mk15", 0, 400)
base:add_cargo("Ammos", "Torp_US_Mk13", 0, 400)

base:create_forces()

base:add_men("Soldiers", 2, 16000)
base:add_men("Soldiers", 3, 14000)
base:add_men("Seamen", 1, 150000)
base:add_men("Seamen", 2, 15000)
base:add_men("Seamen", 3, 10000)
base:add_men("Pilots", 1, 2500)
base:add_men("Engineers", 1, 1000)
base:add_men("Engineers", 2, 1000)
base:add_men("Engineers", 3, 1000)
base:add_men("Engineers", 4, 250)

----------------------------------------------------------------------------------------
-- Создаем первый американский флот в открытом море на карте в локации Сан-Диего
----------------------------------------------------------------------------------------
log_message ("creating Base48 units")

base2 = get_base("Base48")

form = sl_create_formation("USA", "Transport_Convoy_Fleet_usa", 3150, 970)
form:equip_supply_units()
form:equip_units()
form:go_to_base(base2:get_id())
----------------------------------------------------------------------------------------
-- Создаем второй американский флот в открытом море на карте в локации Перл-Харбор
----------------------------------------------------------------------------------------
log_message ("creating Base64 units ")
base2 = get_base("Base64")
form = sl_create_formation("USA", "Transport_Convoy_Fleet_usa", 2380, 1220)
form:equip_supply_units()
form:equip_units()
form:go_to_base(base2:get_id())
----------------------------------------------------------------------------------------
-- Создаем третий американский флот в открытом море на карте в локации Манила
----------------------------------------------------------------------------------------
log_message ("creating Base64 units 2 ")
base2 = get_base("Base64")
form = sl_create_formation("USA", "Transport_Convoy_Fleet_usa", 960, 1309)
form:equip_supply_units()
form:equip_units()
form:go_to_base(base2:get_id())


----------------------------------------------------------------------------------------
-- Перл - Харбор Base48
----------------------------------------------------------------------------------------
log_message ("creating Base48 ")

sl_usa_player:add_building("Airport", "", 1, "Base48")
sl_usa_player:set_building_upgrade("Airport", 3, "Base48")
sl_usa_player:add_building("Port", "", 1, "Base48")
sl_usa_player:set_building_upgrade("Port", 3, "Base48")
sl_usa_player:add_building("Tank", "", 12, "Base48")
sl_usa_player:set_building_upgrade("Tank", 2, "Base48")
sl_usa_player:add_building("Store", "", 7, "Base48")
sl_usa_player:set_building_upgrade("Store", 2, "Base48")
sl_usa_player:add_building("House", "", 17, "Base48")
sl_usa_player:set_building_upgrade("House", 2, "Base48")
--sl_usa_player:add_building("Bunker", "", 3, "Base48")
--sl_usa_player:set_building_upgrade("Bunker", 2, "Base48")
sl_usa_player:add_building("Mine", "", 1, "Base48")
sl_usa_player:set_building_upgrade("Mine", 2, "Base48")
sl_usa_player:add_building("Hospital", "", 3, "Base48")
sl_usa_player:set_building_upgrade("Hospital", 2, "Base48")
sl_usa_player:add_building("Church", "", 2, "Base48")
sl_usa_player:set_building_upgrade("Church", 2, "Base48")
sl_usa_player:add_building("Defence", "", 2, "Base48")
--sl_usa_player:set_building_upgrade("Defence", 2, "Base48")
sl_usa_player:add_building("ShootingRange", "", 1, "Base48")
sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 2, "Base48")
sl_usa_player:set_building_upgrade("RadioStation", 2, "Base48")
--sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 12, "Base48")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base48")
sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 12, "Base48")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base48")
sl_usa_player:add_building("Artillery", "Turrets.Colorado_Turret_Small.Colorado_Turret_Small", 8, "Base48")
sl_usa_player:set_building_upgrade("Artillery", 2, "Base48")

base = get_base("Base48")
base:add_cargo("Resources", "Oil", 50000, 0)
base:add_cargo("Ammos", "Ammo", 40000, 0)
base:add_cargo("Ammos", "Torp_US_Mk15", 0, 400)
base:add_cargo("Ammos", "Torp_US_Mk13", 0, 400)

base:create_forces()

base:add_men("Soldiers", 3, 12000)
base:add_men("Seamen", 1, 1000)
base:add_men("Seamen", 2, 1000)
base:add_men("Seamen", 3, 1000)
base:add_men("Pilots", 1, 100)
base:add_men("Engineers", 2, 1000)
base:add_men("Engineers", 3, 1000)

----------------------------------------------------------------------------------------
-- Панама Base55
----------------------------------------------------------------------------------------
log_message ("creating Base55 ")

sl_usa_player:add_building("Airport", "", 1, "Base55")
sl_usa_player:set_building_upgrade("Airport", 2, "Base55")
sl_usa_player:add_building("Port", "", 1, "Base55")
sl_usa_player:set_building_upgrade("Port", 2, "Base55")
sl_usa_player:add_building("Tank", "", 8, "Base55")
sl_usa_player:set_building_upgrade("Tank", 2, "Base55")
sl_usa_player:add_building("Store", "", 6, "Base55")
sl_usa_player:set_building_upgrade("Store", 2, "Base55")
sl_usa_player:add_building("House", "", 8, "Base55")
sl_usa_player:set_building_upgrade("House", 2, "Base55")
--sl_usa_player:add_building("Bunker", "", 1, "Base55")
--sl_usa_player:set_building_upgrade("Bunker", 2, "Base55")
sl_usa_player:add_building("Mine", "", 2, "Base55")
sl_usa_player:set_building_upgrade("Mine", 2, "Base55")
sl_usa_player:add_building("Hospital", "", 2, "Base55")
sl_usa_player:set_building_upgrade("Hospital", 2, "Base55")
sl_usa_player:add_building("Church", "", 2, "Base55")
sl_usa_player:set_building_upgrade("Church", 2, "Base55")
sl_usa_player:add_building("Defence", "", 1, "Base55")
sl_usa_player:set_building_upgrade("Defence", 2, "Base55")
sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 2, "Base55")
sl_usa_player:set_building_upgrade("RadioStation", 2, "Base55")
--sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 6, "Base55")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base55")
sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 6, "Base55")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base55")
sl_usa_player:add_building("Artillery", "Turrets.Colorado_Turret_Small.Colorado_Turret_Small", 6, "Base55")
--sl_usa_player:set_building_upgrade("Artillery", 2, "Base55")

base = get_base("Base55")
base:add_cargo("Resources", "Oil", 50000, 0)
base:add_cargo("Ammos", "Ammo", 20000, 0)
base:add_cargo("Ammos", "Torp_US_Mk15", 0, 100)
base:add_cargo("Ammos", "Torp_US_Mk13", 0, 100)

base:create_forces()

base:add_men("Soldiers", 1, 7000)
base:add_men("Seamen", 1, 200)
base:add_men("Seamen", 2, 200)
base:add_men("Pilots", 1, 100)
base:add_men("Engineers", 2, 500)

----------------------------------------------------------------------------------------
-- Манила Base57
----------------------------------------------------------------------------------------
log_message ("creating Base57 ")

sl_usa_player:add_building("Airport", "", 1, "Base57")
sl_usa_player:set_building_upgrade("Airport", 2, "Base57")
sl_usa_player:add_building("Port", "", 1, "Base57")
sl_usa_player:set_building_upgrade("Port", 2, "Base57")
sl_usa_player:add_building("Tank", "", 8, "Base57")
sl_usa_player:set_building_upgrade("Tank", 2, "Base57")
sl_usa_player:add_building("Store", "", 3, "Base57")
sl_usa_player:set_building_upgrade("Store", 2, "Base57")
sl_usa_player:add_building("House", "", 13, "Base57")
sl_usa_player:set_building_upgrade("House", 1, "Base57")
sl_usa_player:add_building("Bunker", "", 3, "Base57")
sl_usa_player:set_building_upgrade("Bunker", 2, "Base57")
sl_usa_player:add_building("Mine", "", 4, "Base57")
sl_usa_player:set_building_upgrade("Mine", 2, "Base57")
sl_usa_player:add_building("Hospital", "", 2, "Base57")
sl_usa_player:set_building_upgrade("Hospital", 2, "Base57")
sl_usa_player:add_building("Church", "", 2, "Base57")
sl_usa_player:set_building_upgrade("Church", 2, "Base57")
sl_usa_player:add_building("Defence", "", 2, "Base57")
--sl_usa_player:set_building_upgrade("Defence", 2, "Base57")
sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 2, "Base57")
sl_usa_player:set_building_upgrade("RadioStation", 2, "Base57")
--sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 8, "Base57")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base57")
sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 8, "Base57")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base57")
sl_usa_player:add_building("Artillery", "Turrets.Colorado_Turret_Small.Colorado_Turret_Small", 8, "Base57")
--sl_usa_player:set_building_upgrade("Artillery", 2, "Base57")
sl_usa_player:add_building("ShootingRange", "", 1, "Base57")

base = get_base("Base57")
base:add_cargo("Resources", "Oil", 50000, 0)
base:add_cargo("Ammos", "Ammo", 25000, 0)
base:add_cargo("Ammos", "Torp_US_Mk15", 0, 300)
base:add_cargo("Ammos", "Torp_US_Mk13", 0, 300)

base:create_forces()

base:add_men("Soldiers", 1, 10000)
base:add_men("Seamen", 1, 500)
base:add_men("Seamen", 2, 500)
base:add_men("Seamen", 3, 500)
base:add_men("Pilots", 1, 100)
base:add_men("Engineers", 2, 1000)

----------------------------------------------------------------------------------------
-- Монтеррей Base15
----------------------------------------------------------------------------------------
log_message ("creating Base15 ")

sl_usa_player:add_building("Airport", "", 1, "Base15")
sl_usa_player:set_building_upgrade("Airport", 3, "Base15")
sl_usa_player:add_building("Port", "", 1, "Base15")
sl_usa_player:set_building_upgrade("Port", 2, "Base15")
sl_usa_player:add_building("Tank", "", 10, "Base15")
sl_usa_player:set_building_upgrade("Tank", 2, "Base15")
sl_usa_player:add_building("Store", "", 6, "Base15")
sl_usa_player:set_building_upgrade("Store", 2, "Base15")
sl_usa_player:add_building("House", "", 33, "Base15")
sl_usa_player:set_building_upgrade("House", 2, "Base15")
--sl_usa_player:add_building("Bunker", "", 3, "Base15")
--sl_usa_player:set_building_upgrade("Bunker", 2, "Base15")
sl_usa_player:add_building("Mine", "", 7, "Base15")
sl_usa_player:set_building_upgrade("Mine", 2, "Base15")
sl_usa_player:add_building("Hospital", "", 3, "Base15")
sl_usa_player:set_building_upgrade("Hospital", 2, "Base15")
sl_usa_player:add_building("Church", "", 2, "Base15")
sl_usa_player:set_building_upgrade("Church", 2, "Base15")
--sl_usa_player:add_building("Defence", "", 2, "Base15")
--sl_usa_player:set_building_upgrade("Defence", 2, "Base15")
sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 2, "Base15")
sl_usa_player:set_building_upgrade("RadioStation", 2, "Base15")
--sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 12, "Base15")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base15")
sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 10, "Base15")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base15")
sl_usa_player:add_building("Artillery", "Turrets.Colorado_Turret_Small.Colorado_Turret_Small", 10, "Base15")
sl_usa_player:set_building_upgrade("Artillery", 1, "Base15")
sl_usa_player:add_building("ShootingRange", "", 1, "Base15")

base = get_base("Base15")
base:add_cargo("Resources", "Oil", 20000, 0)
base:add_cargo("Ammos", "Ammo", 15000, 0)
base:add_cargo("Ammos", "Torp_US_Mk15", 0, 200)
base:add_cargo("Ammos", "Torp_US_Mk13", 0, 200)

base:create_forces()

base:add_men("Soldiers", 1, 2000)
base:add_men("Soldiers", 2, 14000)
base:add_men("Soldiers", 3, 14000)
base:add_men("Seamen", 1, 750)
base:add_men("Seamen", 2, 500)
base:add_men("Seamen", 3, 250)
base:add_men("Pilots", 1, 200)
base:add_men("Engineers", 2, 500)
base:add_men("Engineers", 3, 500)
base:add_men("Engineers", 4, 500)

----------------------------------------------------------------------------------------
-- Атту Base3
----------------------------------------------------------------------------------------
log_message ("creating Base3 ")

sl_usa_player:add_building("Airport", "", 1, "Base3")
--sl_usa_player:set_building_upgrade("Airport", 1, "Base3")

sl_usa_player:add_building("Port", "", 1, "Base3")
sl_usa_player:set_building_upgrade("Port", 2, "Base3")

sl_usa_player:add_building("Tank", "", 1, "Base3")
sl_usa_player:set_building_upgrade("Tank", 2, "Base3")

sl_usa_player:add_building("Store", "", 1, "Base3")
sl_usa_player:set_building_upgrade("Store", 2, "Base3")

sl_usa_player:add_building("House", "", 1, "Base3")
sl_usa_player:set_building_upgrade("House", 1, "Base3")

--sl_usa_player:add_building("Bunker", "", 3, "Base3")
--sl_usa_player:set_building_upgrade("Bunker", 2, "Base3")

--sl_usa_player:add_building("Mine", "", 7, "Base3")
--sl_usa_player:set_building_upgrade("Mine", 2, "Base3")

sl_usa_player:add_building("Hospital", "", 1, "Base3")
sl_usa_player:set_building_upgrade("Hospital", 1, "Base3")

sl_usa_player:add_building("Church", "", 1, "Base3")
sl_usa_player:set_building_upgrade("Church", 1, "Base3")

--sl_usa_player:add_building("Defence", "", 2, "Base3")
--sl_usa_player:set_building_upgrade("Defence", 2, "Base3")

sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 1, "Base3")
sl_usa_player:set_building_upgrade("RadioStation", 2, "Base3")

--sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 4, "Base3")
--sl_usa_player:set_building_upgrade("AAGun", 1, "Base3")

sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 2, "Base3")
--sl_usa_player:set_building_upgrade("AAGun", 1, "Base3")

sl_usa_player:add_building("Artillery", "Turrets.Colorado_Turret_Small.Colorado_Turret_Small", 2, "Base3")
--sl_usa_player:set_building_upgrade("Artillery", 2, "Base3")

--sl_usa_player:add_building("ShootingRange", "", 1, "Base3")

base = get_base("Base3")
base:add_cargo("Resources", "Oil", 1000, 0)
base:add_cargo("Ammos", "Ammo", 1000, 0)
-- base:add_cargo("Ammos", "Torp_US_Mk15", 0, 10)
-- base:add_cargo("Ammos", "Torp_US_Mk13", 0, 10)

base:create_forces()

base:add_men("Soldiers", 2, 100)
base:add_men("Seamen", 1, 100)
base:add_men("Seamen", 2, 50)
base:add_men("Seamen", 3, 50)
base:add_men("Engineers", 2, 100)


----------------------------------------------------------------------------------------
-- Бремертон Base14
----------------------------------------------------------------------------------------
log_message ("creating Base14 ")

sl_usa_player:add_building("Airport", "", 1, "Base14")
sl_usa_player:set_building_upgrade("Airport", 3, "Base14")

sl_usa_player:add_building("Port", "", 1, "Base14")
sl_usa_player:set_building_upgrade("Port", 2, "Base14")

sl_usa_player:add_building("Tank", "", 10, "Base14")
sl_usa_player:set_building_upgrade("Tank", 2, "Base14")

sl_usa_player:add_building("Store", "", 5, "Base14")
sl_usa_player:set_building_upgrade("Store", 2, "Base14")

sl_usa_player:add_building("House", "", 19, "Base14")
sl_usa_player:set_building_upgrade("House", 2, "Base14")

--sl_usa_player:add_building("Bunker", "", 2, "Base14")
--sl_usa_player:set_building_upgrade("Bunker", 2, "Base14")

sl_usa_player:add_building("Mine", "", 7, "Base14")
sl_usa_player:set_building_upgrade("Mine", 2, "Base14")

sl_usa_player:add_building("Hospital", "", 3, "Base14")
sl_usa_player:set_building_upgrade("Hospital", 2, "Base14")

sl_usa_player:add_building("Church", "", 2, "Base14")
sl_usa_player:set_building_upgrade("Church", 2, "Base14")

--sl_usa_player:add_building("Defence", "", 2, "Base14")
--sl_usa_player:set_building_upgrade("Defence", 2, "Base14")

sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 2, "Base14")
sl_usa_player:set_building_upgrade("RadioStation", 2, "Base14")

--sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 8, "Base14")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base14")

sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 10, "Base14")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base14")

sl_usa_player:add_building("Artillery", "Turrets.Colorado_Turret_Small.Colorado_Turret_Small", 10, "Base14")
--sl_usa_player:set_building_upgrade("Artillery", 2, "Base14")

sl_usa_player:add_building("ShootingRange", "", 1, "Base14")

base = get_base("Base14")
base:add_cargo("Resources", "Oil", 20000, 0)
base:add_cargo("Ammos", "Ammo", 26000, 0)
base:add_cargo("Ammos", "Torp_US_Mk15", 0, 200)
base:add_cargo("Ammos", "Torp_US_Mk13", 0, 200)

base:create_forces()

base:add_men("Soldiers", 1, 1000)
base:add_men("Soldiers", 2, 14000)
base:add_men("Seamen", 1, 1000)
base:add_men("Seamen", 2, 900)
base:add_men("Seamen", 3, 500)
base:add_men("Pilots", 1, 100)
base:add_men("Engineers", 2, 1000)
base:add_men("Engineers", 3, 700)

----------------------------------------------------------------------------------------
-- Мидуэй Base24
----------------------------------------------------------------------------------------
log_message ("creating Base24 ")

sl_usa_player:add_building("Airport", "", 1, "Base24")
sl_usa_player:set_building_upgrade("Airport", 1, "Base24")

sl_usa_player:add_building("Port", "", 1, "Base24")
sl_usa_player:set_building_upgrade("Port", 1, "Base24")

sl_usa_player:add_building("Tank", "", 1, "Base24")
sl_usa_player:set_building_upgrade("Tank", 1, "Base24")

sl_usa_player:add_building("Store", "", 2, "Base24")
sl_usa_player:set_building_upgrade("Store", 1, "Base24")

sl_usa_player:add_building("House", "", 1, "Base24")
--sl_usa_player:set_building_upgrade("House", 2, "Base24")

--sl_usa_player:add_building("Bunker", "", 2, "Base24")
--sl_usa_player:set_building_upgrade("Bunker", 2, "Base24")

--sl_usa_player:add_building("Mine", "", 7, "Base24")
--sl_usa_player:set_building_upgrade("Mine", 2, "Base24")

--sl_usa_player:add_building("Hospital", "", 3, "Base24")
--sl_usa_player:set_building_upgrade("Hospital", 2, "Base24")

--sl_usa_player:add_building("Church", "", 2, "Base24")
--sl_usa_player:set_building_upgrade("Church", 2, "Base24")

--sl_usa_player:add_building("Defence", "", 2, "Base24")
--sl_usa_player:set_building_upgrade("Defence", 2, "Base24")

sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 1, "Base24")
sl_usa_player:set_building_upgrade("RadioStation", 1, "Base24")

--sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 6, "Base24")
--sl_usa_player:set_building_upgrade("AAGun", 1, "Base24")

sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 3, "Base24")
--sl_usa_player:set_building_upgrade("AAGun", 1, "Base24")

sl_usa_player:add_building("Artillery", "Turrets.Colorado_Turret_Small.Colorado_Turret_Small", 3, "Base24")
--sl_usa_player:set_building_upgrade("Artillery", 2, "Base24")

--sl_usa_player:add_building("ShootingRange", "", 1, "Base24")

base = get_base("Base24")
base:add_cargo("Resources", "Oil", 1000, 0)
base:add_cargo("Ammos", "Ammo", 1000, 0)
-- base:add_cargo("Ammos", "Torp_US_Mk15", 0, 10)
-- base:add_cargo("Ammos", "Torp_US_Mk13", 0, 10)

base:create_forces()

base:add_men("Soldiers", 2, 100)
base:add_men("Seamen", 1, 100)
base:add_men("Seamen", 2, 100)
base:add_men("Seamen", 3, 50)
base:add_men("Pilots", 1, 50)
base:add_men("Engineers", 2, 100)


----------------------------------------------------------------------------------------
-- Гуам Base64
----------------------------------------------------------------------------------------
log_message ("creating Base64 ")

sl_usa_player:add_building("Airport", "", 1, "Base64")
sl_usa_player:set_building_upgrade("Airport", 1, "Base64")

sl_usa_player:add_building("Port", "", 1, "Base64")
sl_usa_player:set_building_upgrade("Port", 2, "Base64")

sl_usa_player:add_building("Tank", "", 2, "Base64")
sl_usa_player:set_building_upgrade("Tank", 2, "Base64")

sl_usa_player:add_building("Store", "", 1, "Base64")
sl_usa_player:set_building_upgrade("Store", 2, "Base64")

sl_usa_player:add_building("House", "", 1, "Base64")
--sl_usa_player:set_building_upgrade("House", 2, "Base64")

--sl_usa_player:add_building("Bunker", "", 1, "Base64")
--sl_usa_player:set_building_upgrade("Bunker", 2, "Base64")

sl_usa_player:add_building("Mine", "", 2, "Base64")
sl_usa_player:set_building_upgrade("Mine", 1, "Base64")

sl_usa_player:add_building("Hospital", "", 1, "Base64")
sl_usa_player:set_building_upgrade("Hospital", 2, "Base64")

sl_usa_player:add_building("Church", "", 1, "Base64")
sl_usa_player:set_building_upgrade("Church", 2, "Base64")

--sl_usa_player:add_building("Defence", "", 1, "Base64")
--sl_usa_player:set_building_upgrade("Defence", 1, "Base64")

sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 1, "Base64")
sl_usa_player:set_building_upgrade("RadioStation", 2, "Base64")

--sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 6, "Base64")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base64")

sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 3, "Base64")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base64")

sl_usa_player:add_building("Artillery", "Turrets.Colorado_Turret_Small.Colorado_Turret_Small", 3, "Base64")
--sl_usa_player:set_building_upgrade("Artillery", 2, "Base64")

--sl_usa_player:add_building("ShootingRange", "", 1, "Base64")

base = get_base("Base64")
base:add_cargo("Resources", "Oil", 1000, 0)
base:add_cargo("Ammos", "Ammo", 1000, 0)
--base:add_cargo("Ammos", "Torp_US_Mk15", 0, 120)
--base:add_cargo("Ammos", "Torp_US_Mk13", 0, 120)

base:create_forces()

base:add_men("Soldiers", 2, 100)
base:add_men("Seamen", 1, 100)
base:add_men("Seamen", 2, 100)
base:add_men("Seamen", 3, 50)
base:add_men("Engineers", 2, 100)

----------------------------------------------------------------------------------------
-- Уэйк Base33
----------------------------------------------------------------------------------------
log_message ("creating Base33 ")

sl_usa_player:add_building("Airport", "", 1, "Base33")
--sl_usa_player:set_building_upgrade("Airport", 1, "Base33")

sl_usa_player:add_building("Port", "", 1, "Base33")
sl_usa_player:set_building_upgrade("Port", 1, "Base33")

sl_usa_player:add_building("Tank", "", 1, "Base33")
sl_usa_player:set_building_upgrade("Tank", 1, "Base33")

sl_usa_player:add_building("Store", "", 1, "Base33")
sl_usa_player:set_building_upgrade("Store", 1, "Base33")

sl_usa_player:add_building("House", "", 1, "Base33")
--sl_usa_player:set_building_upgrade("House", 2, "Base33")

--sl_usa_player:add_building("Bunker", "", 1, "Base33")
--sl_usa_player:set_building_upgrade("Bunker", 2, "Base33")

--sl_usa_player:add_building("Mine", "", 2, "Base33")
--sl_usa_player:set_building_upgrade("Mine", 1, "Base33")

sl_usa_player:add_building("Hospital", "", 1, "Base33")
sl_usa_player:set_building_upgrade("Hospital", 1, "Base33")

--sl_usa_player:add_building("Church", "", 1, "Base33")
--sl_usa_player:set_building_upgrade("Church", 2, "Base33")

--sl_usa_player:add_building("Defence", "", 1, "Base33")
--sl_usa_player:set_building_upgrade("Defence", 1, "Base33")

sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 1, "Base33")
sl_usa_player:set_building_upgrade("RadioStation", 1, "Base33")

--sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 4, "Base33")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base33")

sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 2, "Base33")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base33")

sl_usa_player:add_building("Artillery", "Turrets.Colorado_Turret_Small.Colorado_Turret_Small", 2, "Base33")
--sl_usa_player:set_building_upgrade("Artillery", 2, "Base33")

--sl_usa_player:add_building("ShootingRange", "", 1, "Base33")

base = get_base("Base33")
base:add_cargo("Resources", "Oil", 1000, 0)
base:add_cargo("Ammos", "Ammo", 1000, 0)
--base:add_cargo("Ammos", "Torp_US_Mk15", 0, 60)
--base:add_cargo("Ammos", "Torp_US_Mk13", 0, 60)

base:create_forces()

base:add_men("Soldiers", 2, 100)
base:add_men("Seamen", 1, 100)
base:add_men("Seamen", 2, 100)
base:add_men("Seamen", 3, 50)
base:add_men("Engineers", 2, 100)

----------------------------------------------------------------------------------------
--  Таклобан Base58
----------------------------------------------------------------------------------------
log_message ("creating Base58 ")

sl_usa_player:add_building("Airport", "", 1, "Base58")
--sl_usa_player:set_building_upgrade("Airport", 1, "Base58")

sl_usa_player:add_building("Port", "", 1, "Base58")
sl_usa_player:set_building_upgrade("Port", 1, "Base58")

sl_usa_player:add_building("Tank", "", 2, "Base58")
sl_usa_player:set_building_upgrade("Tank", 2, "Base58")

sl_usa_player:add_building("Store", "", 1, "Base58")
sl_usa_player:set_building_upgrade("Store", 2, "Base58")

sl_usa_player:add_building("House", "", 8, "Base58")
--sl_usa_player:set_building_upgrade("House", 2, "Base58")

--sl_usa_player:add_building("Bunker", "", 1, "Base58")
--sl_usa_player:set_building_upgrade("Bunker", 2, "Base58")

--sl_usa_player:add_building("Mine", "", 2, "Base58")
--sl_usa_player:set_building_upgrade("Mine", 1, "Base58")

sl_usa_player:add_building("Hospital", "", 1, "Base58")
sl_usa_player:set_building_upgrade("Hospital", 2, "Base58")

sl_usa_player:add_building("Church", "", 1, "Base58")
sl_usa_player:set_building_upgrade("Church", 2, "Base58")

--sl_usa_player:add_building("Defence", "", 1, "Base58")
--sl_usa_player:set_building_upgrade("Defence", 1, "Base58")

sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 1, "Base58")
sl_usa_player:set_building_upgrade("RadioStation", 2, "Base58")

--sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 4, "Base58")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base58")

sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 2, "Base58")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base58")

sl_usa_player:add_building("Artillery", "Turrets.Colorado_Turret_Small.Colorado_Turret_Small", 2, "Base58")
sl_usa_player:set_building_upgrade("Artillery", 2, "Base58")

--sl_usa_player:add_building("ShootingRange", "", 1, "Base58")

base = get_base("Base58")
base:add_cargo("Resources", "Oil", 1000, 0)
base:add_cargo("Ammos", "Ammo", 1000, 0)
--base:add_cargo("Ammos", "Torp_US_Mk15", 0, 80)
--base:add_cargo("Ammos", "Torp_US_Mk13", 0, 80)

base:create_forces()

base:add_men("Soldiers", 1, 7000)
base:add_men("Seamen", 1, 200)
base:add_men("Seamen", 2, 200)
base:add_men("Seamen", 3, 100)
base:add_men("Engineers", 2, 500)

----------------------------------------------------------------------------------------
--  Давао Base62
----------------------------------------------------------------------------------------
log_message ("creating Base62 ")

sl_usa_player:add_building("Airport", "", 1, "Base62")
--sl_usa_player:set_building_upgrade("Airport", 1, "Base62")

sl_usa_player:add_building("Port", "", 1, "Base62")
sl_usa_player:set_building_upgrade("Port", 1, "Base62")

sl_usa_player:add_building("Tank", "", 2, "Base62")
sl_usa_player:set_building_upgrade("Tank", 1, "Base62")

sl_usa_player:add_building("Store", "", 1, "Base62")
sl_usa_player:set_building_upgrade("Store", 1, "Base62")

sl_usa_player:add_building("House", "", 7, "Base62")
--sl_usa_player:set_building_upgrade("House", 2, "Base62")

--sl_usa_player:add_building("Bunker", "", 1, "Base62")
--sl_usa_player:set_building_upgrade("Bunker", 2, "Base62")

--sl_usa_player:add_building("Mine", "", 2, "Base62")
--sl_usa_player:set_building_upgrade("Mine", 1, "Base62")

sl_usa_player:add_building("Hospital", "", 1, "Base62")
sl_usa_player:set_building_upgrade("Hospital", 2, "Base62")

sl_usa_player:add_building("Church", "", 1, "Base62")
sl_usa_player:set_building_upgrade("Church", 2, "Base62")

--sl_usa_player:add_building("Defence", "", 1, "Base62")
--sl_usa_player:set_building_upgrade("Defence", 1, "Base62")

sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 1, "Base62")
sl_usa_player:set_building_upgrade("RadioStation", 2, "Base62")

--sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 4, "Base62")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base62")

sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 2, "Base62")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base62")

sl_usa_player:add_building("Artillery", "Turrets.Colorado_Turret_Small.Colorado_Turret_Small", 2, "Base62")
sl_usa_player:set_building_upgrade("Artillery", 2, "Base62")

--sl_usa_player:add_building("ShootingRange", "", 1, "Base62")

base = get_base("Base62")
base:add_cargo("Resources", "Oil", 1000, 0)
base:add_cargo("Ammos", "Ammo", 1000, 0)
--base:add_cargo("Ammos", "Torp_US_Mk15", 0, 80)
--base:add_cargo("Ammos", "Torp_US_Mk13", 0, 70)

base:create_forces()

base:add_men("Soldiers", 1, 6000)
base:add_men("Seamen", 1, 200)
base:add_men("Seamen", 2, 200)
base:add_men("Seamen", 3, 100)
base:add_men("Engineers", 2, 500)


----------------------------------------------------------------------------------------
--  Датч Харбор Base4
----------------------------------------------------------------------------------------
log_message ("creating Base4 ")

sl_usa_player:add_building("Airport", "", 1, "Base4")
sl_usa_player:set_building_upgrade("Airport", 2, "Base4")

sl_usa_player:add_building("Port", "", 1, "Base4")
sl_usa_player:set_building_upgrade("Port", 2, "Base4")

sl_usa_player:add_building("Tank", "", 6, "Base4")
sl_usa_player:set_building_upgrade("Tank", 2, "Base4")

sl_usa_player:add_building("Store", "", 3, "Base4")
sl_usa_player:set_building_upgrade("Store", 2, "Base4")

sl_usa_player:add_building("House", "", 1, "Base4")
sl_usa_player:set_building_upgrade("House", 1, "Base4")

--sl_usa_player:add_building("Bunker", "", 1, "Base4")
--sl_usa_player:set_building_upgrade("Bunker", 2, "Base4")

sl_usa_player:add_building("Mine", "", 1, "Base4")
sl_usa_player:set_building_upgrade("Mine", 1, "Base4")

sl_usa_player:add_building("Hospital", "", 1, "Base4")
sl_usa_player:set_building_upgrade("Hospital", 2, "Base4")

sl_usa_player:add_building("Church", "", 1, "Base4")
sl_usa_player:set_building_upgrade("Church", 2, "Base4")

--sl_usa_player:add_building("Defence", "", 1, "Base4")
--sl_usa_player:set_building_upgrade("Defence", 2, "Base4")

sl_usa_player:add_building("RadioStation", "Probes.SCR_188.SCR_188", 1, "Base4")
sl_usa_player:set_building_upgrade("RadioStation", 2, "Base4")

--sl_usa_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 6, "Base4")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base4")

sl_usa_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 8, "Base4")
--sl_usa_player:set_building_upgrade("AAGun", 2, "Base4")

sl_usa_player:add_building("Artillery", "Turrets.Colorado_Turret_Small.Colorado_Turret_Small", 8, "Base4")
sl_usa_player:set_building_upgrade("Artillery", 1, "Base4")

sl_usa_player:add_building("ShootingRange", "", 1, "Base4")

base = get_base("Base4")
base:add_cargo("Resources", "Oil", 2000, 0)
base:add_cargo("Ammos", "Ammo", 2000, 0)
--base:add_cargo("Ammos", "Torp_US_Mk15", 0, 400)
--base:add_cargo("Ammos", "Torp_US_Mk13", 0, 400)

base:create_forces()

base:add_men("Soldiers", 2, 100)
base:add_men("Seamen", 1, 100)
base:add_men("Seamen", 2, 100)
base:add_men("Seamen", 3, 50)
base:add_men("Pilots", 1, 100)
base:add_men("Engineers", 2, 100)

sl_set_fuel_percent(0.01)



log_message ("help ai ")

--- помогаем АИ - создадим ему сразу пустых формаций транспортов и танкеров
if (sl_get_my_player_id() ~= sl_usa_player:get_id()) then
	--Сан-Диего
	sl_usa_player:create_formation_on_base("Transport_Battalion_usa", "Base16")
	sl_usa_player:create_formation_on_base("Transport_Battalion_usa", "Base16")
	sl_usa_player:create_formation_on_base("Transport_Battalion_usa", "Base16")
	sl_usa_player:create_formation_on_base("Transport_Battalion_usa", "Base16")
	sl_usa_player:create_formation_on_base("Tanker_Battalion_usa", "Base16")
	sl_usa_player:create_formation_on_base("Tanker_Battalion_usa", "Base16")

	--Голландио
	sl_usa_player:create_formation_on_base("Transport_Battalion_usa", "Base75")
	sl_usa_player:create_formation_on_base("Transport_Battalion_usa", "Base75")
end

log_message ("sl_usa_player_init.lua end")
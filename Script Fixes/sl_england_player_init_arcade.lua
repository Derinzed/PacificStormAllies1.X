log_message ("sl_england_player_init_arcade.lua ")

log_message ("sl_england_player_init.lua ")

sl_set_fuel_percent(1)

----------------------------------------------------------------------------------------
-- Начатое производство
----------------------------------------------------------------------------------------

sl_england_player:add_to_production("Ships.Illustrious.Prototype", 1, 0.3)
sl_england_player:add_to_production("Ships.Fiji.Prototype", 1, 0.8)
sl_england_player:add_to_production("Ships.Tempest.Prototype", 1, 0.9)
sl_england_player:add_to_production("Ships.Tempest.Prototype", 1, 0.9)
sl_england_player:add_to_production("Ships.Eclipse.Prototype", 1, 0.7)
sl_england_player:add_to_production("Ships.Eclipse.Prototype", 1, 0.9)

----------------------------------------------------------------------------------------
-- Австралия - север, Порт Дарвин Base105
----------------------------------------------------------------------------------------
log_message ("creating Base105 ")

sl_england_player:add_building("Airport", "", 1, "Base105")
sl_england_player:set_building_upgrade("Airport", 2, "Base105")

sl_england_player:add_building("Port", "", 1, "Base105")
sl_england_player:set_building_upgrade("Port", 2, "Base105")

sl_england_player:add_building("Mine", "", 3, "Base105")
sl_england_player:set_building_upgrade("Mine", 1, "Base105")

sl_england_player:add_building("Tank", "", 5, "Base105")
sl_england_player:set_building_upgrade("Tank", 2, "Base105")

sl_england_player:add_building("Store", "", 6, "Base105")
sl_england_player:set_building_upgrade("Store", 2, "Base105")

sl_england_player:add_building("House", "", 20, "Base105")
sl_england_player:set_building_upgrade("House", 2, "Base105")

sl_england_player:add_building("Hospital", "", 1, "Base105")

sl_england_player:add_building("Church", "", 2, "Base105")
sl_england_player:set_building_upgrade("Church", 2, "Base105")

sl_england_player:add_building("Defence", "", 1, "Base105")
sl_england_player:set_building_upgrade("Defence", 2, "Base105")

sl_england_player:add_building("RadioStation", "Probes.SCR_188_Eng.SCR_188_Eng", 2, "Base105")
sl_england_player:set_building_upgrade("RadioStation", 2, "Base105")

sl_england_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 8, "Base105")
--sl_england_player:set_building_upgrade("AAGun", 2, "Base105")

sl_england_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 6, "Base105")
--sl_england_player:set_building_upgrade("AAGun", 2, "Base105")

sl_england_player:add_building("Artillery", "Turrets.Main_Turret_203x2_Mogami.Main_Turret_203x2_Mogami", 2, "Base105")
--sl_england_player:set_building_upgrade("Artillery", 2, "Base105")

sl_england_player:add_building("ShootingRange", "", 1, "Base105")

base = get_base("Base105")
base:add_cargo("Resources", "Oil", 50000, 0)
base:add_cargo("Ammos", "Ammo", 40000, 0)
--base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 300)
--base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 300)

base:create_forces()

base:add_men("Soldiers", 1, 7500)
base:add_men("Soldiers", 2, 500)
base:add_men("Soldiers", 3, 800)
base:add_men("Seamen", 1, 750)
base:add_men("Seamen", 2, 1000)
base:add_men("Seamen", 3, 1000)
base:add_men("Pilots", 1, 700)
base:add_men("Pilots", 2, 1000)
base:add_men("Pilots", 3, 1000)
base:add_men("Pilots", 4, 200)
base:add_men("Engineers", 1, 1600)
base:add_men("Engineers", 2, 2200)
base:add_men("Engineers", 3, 1600)

local formation = sl_england_player:create_formation_on_base("Fighter_Carrier_Battalion_england", "Base105") 
formation:set_commander("Caldwell") 

local formation = sl_england_player:create_formation_on_base("MediumBomber_Battalion_england", "Base105") 
--formation:set_commander("Cobby") 

local formation = sl_england_player:create_formation_on_base("HeavyCruiser_Battalion_england", "Base105") 
--formation:set_commander("Crace") 


----------------------------------------------------------------------------------------
-- Австралия - северо-восток, Таунсвилл Base106
----------------------------------------------------------------------------------------
log_message ("creating Base106 ")

sl_england_player:add_building("Mine", "", 3, "Base106")
sl_england_player:set_building_upgrade("Mine", 1, "Base106")

sl_england_player:add_building("Airport", "", 1, "Base106")

sl_england_player:add_building("Port", "", 1, "Base106")
sl_england_player:set_building_upgrade("Port", 2, "Base106")

sl_england_player:add_building("Tank", "", 4, "Base106")

sl_england_player:add_building("Store", "", 4, "Base106")

sl_england_player:add_building("House", "", 18, "Base106")

sl_england_player:add_building("Hospital", "", 1, "Base106")

sl_england_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 4, "Base106")

base = get_base("Base106")
base:add_cargo("Resources", "Oil", 5000, 0)
base:add_cargo("Ammos", "Ammo", 4500, 0)
base:add_cargo("Ammos", "uk_torp_fleet", 0, 100)
base:add_cargo("Ammos", "uk_torp_avia", 0, 100)

base:create_forces()

base:add_men("Soldiers", 1, 14000)
base:add_men("Seamen", 1, 1000)
base:add_men("Seamen", 2, 1000)
base:add_men("Seamen", 3, 500)
base:add_men("Pilots", 1, 130)
base:add_men("Pilots", 2, 50)
base:add_men("Pilots", 3, 20)
base:add_men("Engineers", 2, 500)
base:add_men("Engineers", 3, 500)
base:add_men("Engineers", 4, 500)

----------------------------------------------------------------------------------------
-- Бенгальский залив - север, Калькутта Base96
----------------------------------------------------------------------------------------
log_message ("creating Base96 ")

sl_england_player:add_building("Mine", "", 3, "Base96")
sl_england_player:set_building_upgrade("Mine", 1, "Base96")

sl_england_player:add_building("Airport", "", 1, "Base96")
sl_england_player:set_building_upgrade("Airport", 2, "Base96")

sl_england_player:add_building("Port", "", 1, "Base96")
sl_england_player:set_building_upgrade("Port", 2, "Base96")

sl_england_player:add_building("Tank", "", 5, "Base96")
sl_england_player:set_building_upgrade("Tank", 2, "Base96")

sl_england_player:add_building("Store", "", 5, "Base96")
sl_england_player:set_building_upgrade("Store", 2, "Base96")

sl_england_player:add_building("House", "", 20, "Base96")
sl_england_player:set_building_upgrade("House", 2, "Base96")

sl_england_player:add_building("Hospital", "", 2, "Base96")

sl_england_player:add_building("Church", "", 2, "Base96")
sl_england_player:set_building_upgrade("Church", 2, "Base96")

sl_england_player:add_building("RadioStation", "Probes.SCR_188_Eng.SCR_188_Eng", 1, "Base96")

sl_england_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 8, "Base96")

sl_england_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 6, "Base96")

base = get_base("Base96")
base:add_cargo("Resources", "Oil", 50000, 0)
base:add_cargo("Ammos", "Ammo", 10000, 0)

base:create_forces()

base:add_men("Soldiers", 1, 7500)
base:add_men("Soldiers", 2, 500)
base:add_men("Soldiers", 3, 800)
base:add_men("Seamen", 1, 750000)
base:add_men("Seamen", 2, 1000)
base:add_men("Seamen", 3, 1000)
base:add_men("Pilots", 1, 700)
base:add_men("Pilots", 2, 1000)
base:add_men("Pilots", 3, 1000)
base:add_men("Pilots", 4, 200)
base:add_men("Engineers", 1, 1600)
base:add_men("Engineers", 2, 2200)
base:add_men("Engineers", 3, 1600)

local formation = sl_england_player:create_formation_on_base("HeavyCruiser_Battalion_england", "Base96") 
formation:set_commander("Arbuthnot") 

local formation = sl_england_player:create_formation_on_base("MediumBomber_Battalion_england", "Base96") 
formation:set_commander("Peirse") 

----------------------------------------------------------------------------------------
-- Австралия - северо-запад, Порт Хедланд Base104
----------------------------------------------------------------------------------------
log_message ("creating Base104 ")

sl_england_player:add_building("Mine", "", 2, "Base104")

sl_england_player:add_building("Airport", "", 1, "Base104")

sl_england_player:add_building("Port", "", 1, "Base104")

sl_england_player:add_building("Tank", "", 2, "Base104")

sl_england_player:add_building("Store", "", 2, "Base104")

sl_england_player:add_building("House", "", 15, "Base104")

sl_england_player:add_building("Hospital", "", 1, "Base104")
sl_england_player:set_building_upgrade("Hospital", 2, "Base104")

base = get_base("Base104")
base:add_cargo("Resources", "Oil", 1000, 0)
base:add_cargo("Ammos", "Ammo", 1000, 0)
base:add_cargo("Ammos", "uk_torp_fleet", 0, 100)
base:add_cargo("Ammos", "uk_torp_avia", 0, 100)

base:create_forces()

base:add_men("Soldiers", 1, 11000)
base:add_men("Seamen", 1, 900)
base:add_men("Seamen", 2, 900)
base:add_men("Seamen", 3, 900)
base:add_men("Pilots", 1, 100)
base:add_men("Pilots", 2, 40)
base:add_men("Pilots", 3, 10)
base:add_men("Engineers", 1, 1000)
base:add_men("Engineers", 2, 500)

----------------------------------------------------------------------------------------
--  Малайзия - юг, Сингапур Base81
----------------------------------------------------------------------------------------
log_message ("creating Base81 ")

sl_england_player:add_building("Airport", "", 1, "Base81")
sl_england_player:set_building_upgrade("Airport", 2, "Base81")

sl_england_player:add_building("Mine", "", 3, "Base81")
sl_england_player:set_building_upgrade("Mine", 1, "Base81")

sl_england_player:add_building("Port", "", 1, "Base81")
sl_england_player:set_building_upgrade("Port", 3, "Base81")

sl_england_player:add_building("Tank", "", 6, "Base81")
sl_england_player:set_building_upgrade("Tank", 2, "Base81")

sl_england_player:add_building("Store", "", 6, "Base81")
sl_england_player:set_building_upgrade("Store", 2, "Base81")

sl_england_player:add_building("House", "", 28, "Base81")
sl_england_player:set_building_upgrade("House", 2, "Base81")

sl_england_player:add_building("Hospital", "", 2, "Base81")
sl_england_player:set_building_upgrade("Hospital", 2, "Base81")

sl_england_player:add_building("Church", "", 2, "Base81")
sl_england_player:set_building_upgrade("Church", 2, "Base81")

sl_england_player:add_building("Defence", "", 1, "Base81")
sl_england_player:set_building_upgrade("Defence", 2, "Base81")

sl_england_player:add_building("RadioStation", "Probes.SCR_188_Eng.SCR_188_Eng", 2, "Base81")
sl_england_player:set_building_upgrade("RadioStation", 2, "Base81")

sl_england_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 8, "Base81")
sl_england_player:set_building_upgrade("AAGun", 2, "Base81")

sl_england_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 6, "Base81")
sl_england_player:set_building_upgrade("AAGun", 2, "Base81")

sl_england_player:add_building("Artillery", "Turrets.Main_Turret_203x2_Mogami.Main_Turret_203x2_Mogami", 2, "Base81")
sl_england_player:set_building_upgrade("Artillery", 2, "Base81")

sl_england_player:add_building("ShootingRange", "", 1, "Base81")

base = get_base("Base81")
base:add_cargo("Resources", "Oil", 100000, 0)
base:add_cargo("Ammos", "Ammo", 50000, 0)
--base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 300)
--base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 300)

base:create_forces()

base:add_men("Soldiers", 1, 11600)
base:add_men("Soldiers", 2, 3600)
base:add_men("Soldiers", 3, 1000)
base:add_men("Seamen", 1, 3000)
base:add_men("Seamen", 2, 2000)
base:add_men("Seamen", 3, 1000)
base:add_men("Pilots", 1, 700)
base:add_men("Pilots", 2, 500)
base:add_men("Pilots", 3, 500)
base:add_men("Engineers", 2, 1500)
base:add_men("Engineers", 3, 1600)

local formation = sl_england_player:create_formation_on_base("HeavyCruiser_Battalion_england", "Base81") 
formation:set_commander("Crutchley") 

local formation = sl_england_player:create_formation_on_base("Battleship_Division_england", "Base81") 
formation:set_commander("Phillips") 

sl_set_fuel_percent(0.01)


log_message ("help ai ")

--- помогаем АИ - создадим ему сразу пустых формаций транспортов и танкеров
if (sl_get_my_player_id() ~= sl_england_player:get_id()) then
	sl_england_player:create_formation_on_base("Transport_Battalion_england", "Base105")
	sl_england_player:create_formation_on_base("Transport_Battalion_england", "Base105")
	sl_england_player:create_formation_on_base("Transport_Battalion_england", "Base105")
	sl_england_player:create_formation_on_base("Tanker_Battalion_england", "Base105")
	sl_england_player:create_formation_on_base("Tanker_Battalion_england", "Base105")	

	sl_england_player:create_formation_on_base("Transport_Battalion_england", "Base106")
	sl_england_player:create_formation_on_base("Transport_Battalion_england", "Base106")
	sl_england_player:create_formation_on_base("Tanker_Battalion_england", "Base106")
	sl_england_player:create_formation_on_base("Tanker_Battalion_england", "Base106")
end

--[[
	-- FOR DEBUG --
	sl_set_fuel_percent(100)
	sl_get_zone("Zone106"):create_base(sl_england_player:get_id())
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

log_message ("sl_england_player_init.lua ")

sl_set_fuel_percent(1)

----------------------------------------------------------------------------------------
-- Начатое производство
----------------------------------------------------------------------------------------

sl_england_player:add_to_production("Ships.KingGeorgV.Prototype", 1, 1.0)
sl_england_player:add_to_production("Ships.Hood.Prototype", 1, 0.5)

sl_england_player:add_to_production("Ships.Illustrious.Prototype", 4, 1.0)
sl_england_player:add_to_production("Ships.Howe.Prototype", 1, 1.0)
sl_england_player:add_to_production("Ships.Dorsetshire.Prototype", 7, 1.0)
sl_england_player:add_to_production("Ships.Hermes.Prototype", 4, 1.0)
sl_england_player:add_to_production("Ships.Arethusa.Prototype", 2, 1.0)
sl_england_player:add_to_production("Ships.Norfolk.Prototype", 4, 1.0)
sl_england_player:add_to_production("Ships.Eclipse.Prototype", 36, 1.0)
sl_england_player:add_to_production("Ships.Southampton.Prototype", 14, 1.0)
sl_england_player:add_to_production("Ships.Tribal.Prototype", 12, 1.0)
sl_england_player:add_to_production("Ships.Lacenia.Prototype", 10, 1.0)
sl_england_player:add_to_production("Ships.Dale.Prototype", 15, 1.0)


sl_england_player:add_to_production("Aircraft.seafire.Prototype", 257, 1.0)
sl_england_player:add_to_production("Aircraft.barracuda.Prototype", 153, 1.0)

----------------------------------------------------------------------------------------
-- Новая Британия, Рабаул Base91
----------------------------------------------------------------------------------------
log_message ("creating Base91 ")

sl_england_player:add_building("Airport", "", 1, "Base91")

sl_england_player:add_building("Port", "", 1, "Base91")

sl_england_player:add_building("Tank", "", 2, "Base91")

sl_england_player:add_building("Store", "", 2, "Base91")

sl_england_player:add_building("House", "", 1, "Base91")

sl_england_player:add_building("Hospital", "", 1, "Base91")

sl_england_player:add_building("Church", "", 1, "Base91")

sl_england_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 2, "Base91")
--sl_england_player:set_building_upgrade("AAGun", 2, "Base91")

sl_england_player:add_building("Artillery", "Turrets.Eclipse_Gun_120x1_Turret.Eclipse_Gun_120x1_Turret", 2, "Base91")
sl_england_player:set_building_upgrade("Artillery", 1, "Base91")

base = get_base("Base91")
base:add_cargo("Resources", "Oil", 1000, 0)
base:add_cargo("Ammos", "Ammo", 1000, 0)
--base:add_cargo("Ammos", "uk_torp_fleet", 0, 40)
--base:add_cargo("Ammos", "uk_torp_avia", 0, 40)

base:create_forces()

base:add_men("Soldiers", 1, 100)
base:add_men("Seamen", 1, 100)
base:add_men("Pilots", 1, 10)
base:add_men("Engineers", 1, 100)
base:add_men("Engineers", 2, 50)

----------------------------------------------------------------------------------------
-- Австралия - север, Порт Дарвин Base105
----------------------------------------------------------------------------------------
log_message ("creating Base105 ")

sl_england_player:add_building("Mine", "", 5, "Base105")
sl_england_player:set_building_upgrade("Mine", 2, "Base105")

sl_england_player:add_building("Airport", "", 1, "Base105")
sl_england_player:set_building_upgrade("Airport", 3, "Base105")

sl_england_player:add_building("Port", "", 1, "Base105")
sl_england_player:set_building_upgrade("Port", 2, "Base105")

sl_england_player:add_building("Tank", "", 5, "Base105")
sl_england_player:set_building_upgrade("Tank", 2, "Base105")

sl_england_player:add_building("Store", "", 6, "Base105")
sl_england_player:set_building_upgrade("Store", 2, "Base105")

sl_england_player:add_building("House", "", 20, "Base105")
sl_england_player:set_building_upgrade("House", 2, "Base105")

sl_england_player:add_building("Hospital", "", 1, "Base105")
sl_england_player:set_building_upgrade("Hospital", 3, "Base105")

sl_england_player:add_building("Church", "", 2, "Base105")
sl_england_player:set_building_upgrade("Church", 2, "Base105")

--sl_england_player:add_building("Defence", "", 1, "Base105")
--sl_england_player:set_building_upgrade("Defence", 2, "Base105")

sl_england_player:add_building("RadioStation", "Probes.SCR_188_Eng.SCR_188_Eng", 2, "Base105")
sl_england_player:set_building_upgrade("RadioStation", 2, "Base105")

--sl_england_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 8, "Base105")
--sl_england_player:set_building_upgrade("AAGun", 2, "Base105")

sl_england_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 10, "Base105")
--sl_england_player:set_building_upgrade("AAGun", 2, "Base105")

sl_england_player:add_building("Artillery", "Turrets.Eclipse_Gun_120x1_Turret.Eclipse_Gun_120x1_Turret", 10, "Base105")
sl_england_player:set_building_upgrade("Artillery", 1, "Base105")

sl_england_player:add_building("ShootingRange", "", 1, "Base105")

base = get_base("Base105")
base:add_cargo("Resources", "Oil", 50000, 0)
base:add_cargo("Ammos", "Ammo", 10000, 0)
base:add_cargo("Ammos", "uk_torp_fleet", 0, 250)
base:add_cargo("Ammos", "uk_torp_avia", 0, 250)

base:create_forces()

base:add_men("Soldiers", 1, 14000)
base:add_men("Seamen", 1, 1000)
base:add_men("Seamen", 2, 1000)
base:add_men("Seamen", 3, 1000)
base:add_men("Pilots", 1, 120)
base:add_men("Pilots", 2, 50)
base:add_men("Pilots", 3, 25)
base:add_men("Engineers", 1, 800)
base:add_men("Engineers", 2, 800)
base:add_men("Engineers", 3, 600)
base:add_men("Engineers", 4, 300)

----------------------------------------------------------------------------------------
-- Австралия - северо-восток, Таунсвилл Base106
----------------------------------------------------------------------------------------
log_message ("creating Base106 ")

sl_england_player:add_building("Mine", "", 3, "Base106")
sl_england_player:set_building_upgrade("Mine", 1, "Base106")

sl_england_player:add_building("Airport", "", 1, "Base106")
sl_england_player:set_building_upgrade("Airport", 2, "Base106")

sl_england_player:add_building("Port", "", 1, "Base106")
sl_england_player:set_building_upgrade("Port", 2, "Base106")

sl_england_player:add_building("Tank", "", 4, "Base106")

sl_england_player:add_building("Store", "", 4, "Base106")

sl_england_player:add_building("House", "", 18, "Base106")
sl_england_player:set_building_upgrade("House", 2, "Base106")

sl_england_player:add_building("Hospital", "", 1, "Base106")
sl_england_player:set_building_upgrade("Hospital", 2, "Base106")

sl_england_player:add_building("Church", "", 2, "Base106")
sl_england_player:set_building_upgrade("Church", 2, "Base106")

sl_england_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 6, "Base106")
--sl_england_player:set_building_upgrade("AAGun", 2, "Base106")

sl_england_player:add_building("Artillery", "Turrets.Eclipse_Gun_120x1_Turret.Eclipse_Gun_120x1_Turret", 6, "Base106")
--sl_england_player:set_building_upgrade("Artillery", 1, "Base106")

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

sl_england_player:add_building("Airport", "", 1, "Base96")
sl_england_player:set_building_upgrade("Airport", 2, "Base96")

sl_england_player:add_building("Port", "", 1, "Base96")
sl_england_player:set_building_upgrade("Port", 3, "Base96")

sl_england_player:add_building("Tank", "", 5, "Base96")
sl_england_player:set_building_upgrade("Tank", 2, "Base96")

sl_england_player:add_building("Store", "", 5, "Base96")
sl_england_player:set_building_upgrade("Store", 2, "Base96")

sl_england_player:add_building("House", "", 50, "Base96")
sl_england_player:set_building_upgrade("House", 2, "Base96")

sl_england_player:add_building("Hospital", "", 2, "Base96")
sl_england_player:set_building_upgrade("Hospital", 2, "Base96")

sl_england_player:add_building("Church", "", 2, "Base96")
sl_england_player:set_building_upgrade("Church", 2, "Base96")

sl_england_player:add_building("RadioStation", "Probes.SCR_188_Eng.SCR_188_Eng", 1, "Base96")

sl_england_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 10, "Base96")
--sl_england_player:set_building_upgrade("AAGun", 2, "Base96")

sl_england_player:add_building("Artillery", "Turrets.Eclipse_Gun_120x1_Turret.Eclipse_Gun_120x1_Turret", 10, "Base96")
--sl_england_player:set_building_upgrade("Artillery", 1, "Base96"))

base = get_base("Base96")
base:add_cargo("Resources", "Oil", 50000, 0)
base:add_cargo("Ammos", "Ammo", 50000, 0)
base:add_cargo("Ammos", "uk_torp_fleet", 0, 500)
base:add_cargo("Ammos", "uk_torp_avia", 0, 500)

base:create_forces()

base:add_men("Soldiers", 1, 42000)
base:add_men("Seamen", 1, 100000)
base:add_men("Seamen", 2, 1000)
base:add_men("Seamen", 3, 1000)
base:add_men("Pilots", 1, 200)
base:add_men("Pilots", 2, 100)
base:add_men("Pilots", 3, 50)
base:add_men("Engineers", 1, 3000)
base:add_men("Engineers", 2, 650)
base:add_men("Engineers", 3, 250)
base:add_men("Engineers", 4, 100)

----------------------------------------------------------------------------------------
-- Цейлон, Коломбо Base100
----------------------------------------------------------------------------------------
log_message ("creating Base100 ")

sl_england_player:add_building("Mine", "", 2, "Base100")
sl_england_player:set_building_upgrade("Mine", 1, "Base100")

sl_england_player:add_building("Airport", "", 1, "Base100")
sl_england_player:set_building_upgrade("Airport", 2, "Base100")

sl_england_player:add_building("Port", "", 1, "Base100")
sl_england_player:set_building_upgrade("Port", 2, "Base100")

sl_england_player:add_building("Tank", "", 2, "Base100")

sl_england_player:add_building("Store", "", 2, "Base100")

sl_england_player:add_building("House", "", 3, "Base100")

sl_england_player:add_building("Hospital", "", 1, "Base100")

sl_england_player:add_building("Church", "", 1, "Base100")

sl_england_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 2, "Base100")
--sl_england_player:set_building_upgrade("AAGun", 2, "Base100")

sl_england_player:add_building("Artillery", "Turrets.Eclipse_Gun_120x1_Turret.Eclipse_Gun_120x1_Turret", 2, "Base100")
sl_england_player:set_building_upgrade("Artillery", 1, "Base100")

base = get_base("Base100")
base:add_cargo("Resources", "Oil", 10000, 0)
base:add_cargo("Ammos", "Ammo", 5000, 0)
base:add_cargo("Ammos", "uk_torp_fleet", 0, 100)
base:add_cargo("Ammos", "uk_torp_avia", 0, 100)

base:create_forces()

base:add_men("Soldiers", 1, 1000)
base:add_men("Seamen", 1, 300)
base:add_men("Seamen", 2, 300)
base:add_men("Seamen", 3, 300)
base:add_men("Pilots", 1, 100)
base:add_men("Engineers", 2, 800)
base:add_men("Engineers", 3, 100)
base:add_men("Engineers", 4, 100)

----------------------------------------------------------------------------------------
-- Фиджи, Сува Base108
----------------------------------------------------------------------------------------
log_message ("creating Base108 ")

sl_england_player:add_building("Airport", "", 1, "Base108")
sl_england_player:set_building_upgrade("Airport", 2, "Base108")

sl_england_player:add_building("Port", "", 1, "Base108")

sl_england_player:add_building("Tank", "", 2, "Base108")

sl_england_player:add_building("Store", "", 2, "Base108")

sl_england_player:add_building("House", "", 1, "Base108")

sl_england_player:add_building("Hospital", "", 1, "Base108")

sl_england_player:add_building("Church", "", 1, "Base108")

sl_england_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 2, "Base108")
--sl_england_player:set_building_upgrade("AAGun", 2, "Base108")

sl_england_player:add_building("Artillery", "Turrets.Eclipse_Gun_120x1_Turret.Eclipse_Gun_120x1_Turret", 2, "Base108")
sl_england_player:set_building_upgrade("Artillery", 1, "Base108")

base = get_base("Base108")
base:add_cargo("Resources", "Oil", 1000, 0)
base:add_cargo("Ammos", "Ammo", 1000, 0)
--base:add_cargo("Ammos", "uk_torp_fleet", 0, 50)
--base:add_cargo("Ammos", "uk_torp_avia", 0, 100)

base:create_forces()

base:add_men("Soldiers", 1, 100)
base:add_men("Seamen", 2, 200)
base:add_men("Engineers", 1, 100)
base:add_men("Engineers", 2, 50)

----------------------------------------------------------------------------------------
-- Микронезия, Тарава Base67
----------------------------------------------------------------------------------------
log_message ("creating Base67 ")


sl_england_player:add_building("Airport", "", 1, "Base67")

sl_england_player:add_building("Port", "", 1, "Base67")

sl_england_player:add_building("Tank", "", 2, "Base67")

sl_england_player:add_building("Store", "", 2, "Base67")

sl_england_player:add_building("House", "", 1, "Base67")

sl_england_player:add_building("Church", "", 2, "Base67")

sl_england_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 2, "Base67")
--sl_england_player:set_building_upgrade("AAGun", 2, "Base67")

sl_england_player:add_building("Artillery", "Turrets.Eclipse_Gun_120x1_Turret.Eclipse_Gun_120x1_Turret", 2, "Base67")
sl_england_player:set_building_upgrade("Artillery", 1, "Base67")

base = get_base("Base67")
base:add_cargo("Resources", "Oil", 1000, 0)
base:add_cargo("Ammos", "Ammo", 1000, 0)
base:add_cargo("Ammos", "uk_torp_fleet", 0, 40)
base:add_cargo("Ammos", "uk_torp_avia", 0, 40)

base:create_forces()

base:add_men("Soldiers", 2, 100)
base:add_men("Seamen", 2, 200)
base:add_men("Engineers", 1, 100)
base:add_men("Engineers", 2, 50)

----------------------------------------------------------------------------------------
-- Малайзия - юг, Сингапур Base81
----------------------------------------------------------------------------------------
log_message ("creating Base81 ")

sl_england_player:add_building("Mine", "", 4, "Base81")

sl_england_player:add_building("Airport", "", 1, "Base81")
sl_england_player:set_building_upgrade("Airport", 2, "Base81")

sl_england_player:add_building("Port", "", 1, "Base81")
sl_england_player:set_building_upgrade("Port", 3, "Base81")

sl_england_player:add_building("Tank", "", 6, "Base81")
sl_england_player:set_building_upgrade("Tank", 2, "Base81")

sl_england_player:add_building("Store", "", 6, "Base81")
sl_england_player:set_building_upgrade("Store", 2, "Base81")

sl_england_player:add_building("House", "", 36, "Base81")
sl_england_player:set_building_upgrade("House", 2, "Base81")

sl_england_player:add_building("Hospital", "", 2, "Base81")
sl_england_player:set_building_upgrade("Hospital", 2, "Base81")

sl_england_player:add_building("Church", "", 2, "Base81")
sl_england_player:set_building_upgrade("Church", 2, "Base81")

sl_england_player:add_building("Defence", "", 1, "Base81")
sl_england_player:set_building_upgrade("Defence", 2, "Base81")

sl_england_player:add_building("RadioStation", "Probes.SCR_188_Eng.SCR_188_Eng", 2, "Base81")
sl_england_player:set_building_upgrade("RadioStation", 2, "Base81")

--sl_england_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 8, "Base81")
--sl_england_player:set_building_upgrade("AAGun", 2, "Base81")

sl_england_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 10, "Base81")
--sl_england_player:set_building_upgrade("AAGun", 2, "Base81")

sl_england_player:add_building("Artillery", "Turrets.Eclipse_Gun_120x1_Turret.Eclipse_Gun_120x1_Turret", 10, "Base81")
sl_england_player:set_building_upgrade("Artillery", 2, "Base81")

sl_england_player:add_building("ShootingRange", "", 1, "Base81")

base = get_base("Base81")
base:add_cargo("Resources", "Oil", 200000, 0)
base:add_cargo("Ammos", "Ammo", 100000, 0)
base:add_cargo("Ammos", "uk_torp_fleet", 0, 300)
base:add_cargo("Ammos", "uk_torp_avia", 0, 300)

base:create_forces()

base:add_men("Soldiers", 2, 27500)
base:add_men("Soldiers", 3, 2500)
base:add_men("Seamen", 1, 1000)
base:add_men("Seamen", 2, 1500)
base:add_men("Seamen", 3, 1000)
base:add_men("Pilots", 1, 100)
base:add_men("Pilots", 2, 40)
base:add_men("Pilots", 3, 10)
base:add_men("Engineers", 2, 1000)
base:add_men("Engineers", 3, 1000)
base:add_men("Engineers", 4, 500)


----------------------------------------------------------------------------------------
-- Южно-Китайское море - север, Гонконг Base56
----------------------------------------------------------------------------------------
log_message ("creating Base56 ")

sl_england_player:add_building("Mine", "", 3, "Base56")

sl_england_player:add_building("Airport", "", 1, "Base56")
sl_england_player:set_building_upgrade("Airport", 2, "Base56")

sl_england_player:add_building("Port", "", 1, "Base56")
sl_england_player:set_building_upgrade("Port", 3, "Base56")

sl_england_player:add_building("Tank", "", 4, "Base56")
sl_england_player:set_building_upgrade("Tank", 1, "Base56")

sl_england_player:add_building("Store", "", 3, "Base56")
sl_england_player:set_building_upgrade("Store", 1, "Base56")

sl_england_player:add_building("House", "", 17, "Base56")
sl_england_player:set_building_upgrade("House", 1, "Base56")

sl_england_player:add_building("Hospital", "", 1, "Base56")
sl_england_player:set_building_upgrade("Hospital", 2, "Base56")

sl_england_player:add_building("Church", "", 2, "Base56")
sl_england_player:set_building_upgrade("Church", 1, "Base56")

sl_england_player:add_building("RadioStation", "Probes.SCR_188_Eng.SCR_188_Eng", 1, "Base56")

sl_england_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 6, "Base56")
--sl_england_player:set_building_upgrade("AAGun", 2, "Base56")

sl_england_player:add_building("Artillery", "Turrets.Eclipse_Gun_120x1_Turret.Eclipse_Gun_120x1_Turret", 6, "Base56")
sl_england_player:set_building_upgrade("Artillery", 1, "Base56")

base = get_base("Base56")
base:add_cargo("Resources", "Oil", 10000, 0)
base:add_cargo("Ammos", "Ammo", 4000, 0)
base:add_cargo("Ammos", "uk_torp_fleet", 0, 100)
base:add_cargo("Ammos", "uk_torp_avia", 0, 100)

base:create_forces()

base:add_men("Soldiers", 2, 13000)
base:add_men("Soldiers", 3, 1000)
base:add_men("Seamen", 1, 400)
base:add_men("Seamen", 2, 400)
base:add_men("Seamen", 3, 200)
base:add_men("Pilots", 1, 50)
base:add_men("Engineers", 1, 1000)
base:add_men("Engineers", 2, 500)

----------------------------------------------------------------------------------------
-- Австралия - северо-запад, Порт Хедланд Base104
----------------------------------------------------------------------------------------
log_message ("creating Base104 ")

sl_england_player:add_building("Mine", "", 3, "Base104")

sl_england_player:add_building("Airport", "", 1, "Base104")
sl_england_player:set_building_upgrade("Airport", 2, "Base104")

sl_england_player:add_building("Port", "", 1, "Base104")

sl_england_player:add_building("Tank", "", 2, "Base104")

sl_england_player:add_building("Store", "", 2, "Base104")

sl_england_player:add_building("House", "", 15, "Base104")

sl_england_player:add_building("Church", "", 2, "Base104")
sl_england_player:set_building_upgrade("Church", 1, "Base104")

sl_england_player:add_building("Hospital", "", 1, "Base104")
sl_england_player:set_building_upgrade("Hospital", 2, "Base104")

sl_england_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 6, "Base104")
--sl_england_player:set_building_upgrade("AAGun", 2, "Base104")

sl_england_player:add_building("Artillery", "Turrets.Eclipse_Gun_120x1_Turret.Eclipse_Gun_120x1_Turret", 6, "Base104")
sl_england_player:set_building_upgrade("Artillery", 1, "Base104")

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
-- Новая Гвинея - юг, Порт-Морсби Base90
----------------------------------------------------------------------------------------
log_message ("creating Base90 ")

sl_england_player:add_building("Mine", "", 3, "Base90")
sl_england_player:set_building_upgrade("Mine", 1, "Base90")

sl_england_player:add_building("Airport", "", 1, "Base90")

sl_england_player:add_building("Port", "", 1, "Base90")

sl_england_player:add_building("Tank", "", 2, "Base90")

sl_england_player:add_building("Store", "", 2, "Base90")

sl_england_player:add_building("House", "", 1, "Base90")

sl_england_player:add_building("Church", "", 2, "Base90")
sl_england_player:set_building_upgrade("Church", 1, "Base90")

sl_england_player:add_building("Hospital", "", 1, "Base90")

sl_england_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 2, "Base90")
--sl_england_player:set_building_upgrade("AAGun", 2, "Base90")

sl_england_player:add_building("Artillery", "Turrets.Eclipse_Gun_120x1_Turret.Eclipse_Gun_120x1_Turret", 2, "Base90")
sl_england_player:set_building_upgrade("Artillery", 1, "Base90")

base = get_base("Base90")
base:add_cargo("Resources", "Oil", 2000, 0)
base:add_cargo("Ammos", "Ammo", 1000, 0)
--base:add_cargo("Ammos", "uk_torp_fleet", 0, 40)
--base:add_cargo("Ammos", "uk_torp_avia", 0, 40)

base:create_forces()

base:add_men("Soldiers", 2, 100)
base:add_men("Seamen", 2, 200)
base:add_men("Pilots", 2, 100)
base:add_men("Engineers", 1, 100)
base:add_men("Engineers", 2, 50)


sl_set_fuel_percent(0.01)

log_message ("help to ai ")

--- помогаем АИ - создадим ему сразу пустых формаций транспортов и танкеров
if (sl_get_my_player_id() ~= sl_england_player:get_id()) then
	sl_england_player:create_formation_on_base("Transport_Battalion_england", "Base105")
	sl_england_player:create_formation_on_base("Transport_Battalion_england", "Base105")
	sl_england_player:create_formation_on_base("Transport_Battalion_england", "Base96")
	sl_england_player:create_formation_on_base("Transport_Battalion_england", "Base96")
	sl_england_player:create_formation_on_base("Tanker_Battalion_england", "Base105")
	sl_england_player:create_formation_on_base("Tanker_Battalion_england", "Base96")
	sl_england_player:create_formation_on_base("Tanker_Battalion_england", "Base96")
	
	sl_england_player:create_formation_on_base("Transport_Battalion_england", "Base106")
	sl_england_player:create_formation_on_base("Transport_Battalion_england", "Base81")
	sl_england_player:create_formation_on_base("Tanker_Battalion_england", "Base106")
	sl_england_player:create_formation_on_base("Tanker_Battalion_england", "Base81")
end

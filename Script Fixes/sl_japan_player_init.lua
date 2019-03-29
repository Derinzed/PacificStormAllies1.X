log_message ("sl_japan_player_init.lua ")

sl_set_fuel_percent(1)

----------------------------------------------------------------------------------------
-- Production Queue
----------------------------------------------------------------------------------------
sl_japan_player:add_to_production("Ships.Nagara_Maru.Prototype", 120, 1.0)
sl_japan_player:add_to_production("Ships.Hokoku.Prototype", 26, 1.0)
sl_japan_player:add_to_production("Ships.Mamiya.Prototype", 16, 1.0)
sl_japan_player:add_to_production("Ships.nippon_maru.Prototype", 20, 1.0)
sl_japan_player:add_to_production("Ships.Kazahaia.Prototype", 20, 1.0)

sl_japan_player:add_to_production("Ships.Yamato.Prototype", 1, 0.95)
sl_japan_player:add_to_production("Ships.Musashi.Prototype", 1, 0.85)
sl_japan_player:add_to_production("Ships.Nagato.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Mutsu.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Ise.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Hyuga.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Fuso.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Yamashiro.Prototype",1,1)

sl_japan_player:add_to_production("Ships.Kongo.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Haruna.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Kirishima.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Hiei.Prototype",1,1)

sl_japan_player:add_to_production("Ships.Akagi.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Kaga.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Hiryu.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Shoki.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Zuki.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Shoho.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Zuiho.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Soryu.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Taiyo.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Unyo.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Chuyo.Prototype",1,1)
sl_japan_player:add_to_production("Ships.Hiyo.Prototype",1,0.86)
sl_japan_player:add_to_production("Ships.Junyo.Prototype",1,0.86)


sl_japan_player:add_to_production("Ships.Mogami.Prototype",4,1)
sl_japan_player:add_to_production("Ships.Myoko.Prototype",4,1)
sl_japan_player:add_to_production("Ships.Furutaka.Prototype",2,1)
sl_japan_player:add_to_production("Ships.Aoba.Prototype",2,1)
sl_japan_player:add_to_production("Ships.Takao.Prototype",4,1)
sl_japan_player:add_to_production("Ships.Tone.Prototype",2,1)
sl_japan_player:add_to_production("Ships.Kuma.Prototype",5,1)
sl_japan_player:add_to_production("Ships.Nagara.Prototype",6,1)
sl_japan_player:add_to_production("Ships.Sendai.Prototype",3,1)

sl_japan_player:add_to_production("Ships.Kagero.Prototype",18,1)
sl_japan_player:add_to_production("Ships.Akizuki2.Prototype",4,0)
sl_japan_player:add_to_production("Ships.Mutsuki.Prototype",12,0.1)
sl_japan_player:add_to_production("Ships.Fubuki.Prototype",20,0.1)
sl_japan_player:add_to_production("Ships.Kagero.Prototype",1,0.8)
sl_japan_player:add_to_production("Ships.Kagero.Prototype",1,0.6)

sl_japan_player:add_to_production("Ships.Otsu-Gata.Prototype",68,1)
sl_japan_player:add_to_production("Ships.I58.Prototype", 47, 1.0)

sl_japan_player:add_to_production("Airplanes.A5M4.Prototype", 360, 1.0)
sl_japan_player:add_to_production("Airplanes.B5N.Prototype", 240, 1.0)
sl_japan_player:add_to_production("Airplanes.D3A.Prototype", 240, 1.0)
sl_japan_player:add_to_production("Airplanes.F1M.Prototype", 350, 1.0)
sl_japan_player:add_to_production("Airplanes.Ki-43.Prototype", 150, 1.0)
sl_japan_player:add_to_production("Airplanes.Ki-21.Prototype", 150, 1.0)

----------------------------------------------------------------------------------------
-- Tokyo Base29
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Airport", "", 1, "Base29")
sl_japan_player:set_building_upgrade("Airport", 3, "Base29")

sl_japan_player:add_building("Port", "", 1, "Base29")
sl_japan_player:set_building_upgrade("Port", 3, "Base29")

sl_japan_player:add_building("Tank", "", 8, "Base29")
sl_japan_player:set_building_upgrade("Tank", 2, "Base29")

sl_japan_player:add_building("Store", "", 6, "Base29")
sl_japan_player:set_building_upgrade("Store", 2, "Base29")

sl_japan_player:add_building("House", "", 35, "Base29")
--sl_japan_player:set_building_upgrade("House", 2, "Base29")

-- sl_japan_player:add_building("Bunker", "", 2, "Base29")
-- sl_japan_player:set_building_upgrade("Bunker", 2, "Base29")

sl_japan_player:add_building("Mine", "", 7, "Base29")
sl_japan_player:set_building_upgrade("Mine", 2, "Base29")

sl_japan_player:add_building("Hospital", "", 2, "Base29")
sl_japan_player:set_building_upgrade("Hospital", 2, "Base29")

sl_japan_player:add_building("Church", "", 2, "Base29")
sl_japan_player:set_building_upgrade("Church", 3, "Base29")

--sl_japan_player:add_building("Defence", "", 1, "Base29")
--sl_japan_player:set_building_upgrade("Defence", 2, "Base29")

sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 2, "Base29")
sl_japan_player:set_building_upgrade("RadioStation", 2, "Base29")

sl_japan_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 10, "Base29")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base29")

sl_japan_player:add_building("Artillery", "Turrets.Kazemat_Turret_203_Akagi.Kazemat_Turret_203_Akagi", 10, "Base29")
sl_japan_player:set_building_upgrade("Artillery", 2, "Base29")

sl_japan_player:add_building("ShootingRange", "", 1, "Base29")

base = get_base("Base29")
base:add_cargo("Resources", "Oil", 50000, 0)
base:add_cargo("Ammos", "Ammo", 50000, 0)
base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 400)
base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 400)

base:create_forces()

base:add_men("Soldiers", 1, 5000)
base:add_men("Soldiers", 2, 5000)
base:add_men("Soldiers", 3, 1000)
base:add_men("Seamen", 1, 60000)
base:add_men("Seamen", 2, 10000)
base:add_men("Seamen", 3, 2000)
base:add_men("Seamen", 4, 1000)
base:add_men("Pilots", 1, 1000)
base:add_men("Pilots", 2, 650)
base:add_men("Pilots", 3, 25)
base:add_men("Pilots", 4, 10)
base:add_men("Engineers", 2, 1000)
base:add_men("Engineers", 3, 30000)
base:add_men("Engineers", 4, 1000)

----------------------------------------------------------------------------------------
-- Osaka Base28
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Airport", "", 1, "Base28")
sl_japan_player:set_building_upgrade("Airport", 3, "Base28")

sl_japan_player:add_building("Port", "", 1, "Base28")
sl_japan_player:set_building_upgrade("Port", 3, "Base28")

sl_japan_player:add_building("Tank", "", 6, "Base28")
sl_japan_player:set_building_upgrade("Tank", 2, "Base28")

sl_japan_player:add_building("Store", "", 5, "Base28")
sl_japan_player:set_building_upgrade("Store", 2, "Base28")

sl_japan_player:add_building("House", "", 8, "Base28")
--sl_japan_player:set_building_upgrade("House", 2, "Base28")

-- sl_japan_player:add_building("Bunker", "", 2, "Base28")
-- sl_japan_player:set_building_upgrade("Bunker", 2, "Base28")

sl_japan_player:add_building("Mine", "", 7, "Base28")
sl_japan_player:set_building_upgrade("Mine", 2, "Base28")

sl_japan_player:add_building("Hospital", "", 2, "Base28")
sl_japan_player:set_building_upgrade("Hospital", 2, "Base28")

sl_japan_player:add_building("Church", "", 2, "Base28")
sl_japan_player:set_building_upgrade("Church", 3, "Base28")

--sl_japan_player:add_building("Defence", "", 2, "Base28")
--sl_japan_player:set_building_upgrade("Defence", 2, "Base28")

sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 2, "Base28")
sl_japan_player:set_building_upgrade("RadioStation", 2, "Base28")

sl_japan_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 10, "Base28")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base28")

sl_japan_player:add_building("Artillery", "Turrets.Kazemat_Turret_203_Akagi.Kazemat_Turret_203_Akagi", 10, "Base28")
sl_japan_player:set_building_upgrade("Artillery", 2, "Base28")

sl_japan_player:add_building("ShootingRange", "", 1, "Base28")

base = get_base("Base28")
base:add_cargo("Resources", "Oil", 50000, 0)
base:add_cargo("Ammos", "Ammo", 45000, 0)
base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 300)
base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 300)

base:create_forces()

base:add_men("Soldiers", 1, 500)
base:add_men("Soldiers", 2, 500)
base:add_men("Engineers", 1, 1000)
base:add_men("Engineers", 2, 1000)
base:add_men("Engineers", 3, 1000)

----------------------------------------------------------------------------------------
-- Nagasaki Base35
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Airport", "", 1, "Base35")
sl_japan_player:set_building_upgrade("Airport", 3, "Base35")

sl_japan_player:add_building("Port", "", 1, "Base35")
sl_japan_player:set_building_upgrade("Port", 2, "Base35")

sl_japan_player:add_building("Tank", "", 4, "Base35")
sl_japan_player:set_building_upgrade("Tank", 2, "Base35")

sl_japan_player:add_building("Store", "", 3, "Base35")
sl_japan_player:set_building_upgrade("Store", 2, "Base35")

sl_japan_player:add_building("House", "", 21, "Base35")
--sl_japan_player:set_building_upgrade("House", 2, "Base35")

-- sl_japan_player:add_building("Bunker", "", 2, "Base35")
-- sl_japan_player:set_building_upgrade("Bunker", 2, "Base35")

sl_japan_player:add_building("Mine", "", 5, "Base35")
sl_japan_player:set_building_upgrade("Mine", 2, "Base35")

sl_japan_player:add_building("Hospital", "", 2, "Base35")
sl_japan_player:set_building_upgrade("Hospital", 2, "Base35")

sl_japan_player:add_building("Church", "", 2, "Base35")
sl_japan_player:set_building_upgrade("Church", 3, "Base35")

--sl_japan_player:add_building("Defence", "", 1, "Base35")
--sl_japan_player:set_building_upgrade("Defence", 2, "Base35")

sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 2, "Base35")
sl_japan_player:set_building_upgrade("RadioStation", 2, "Base35")

sl_japan_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 8, "Base35")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base35")

sl_japan_player:add_building("Artillery", "Turrets.Kazemat_Turret_203_Akagi.Kazemat_Turret_203_Akagi", 8, "Base35")
sl_japan_player:set_building_upgrade("Artillery", 2, "Base35")

sl_japan_player:add_building("ShootingRange", "", 1, "Base35")

base = get_base("Base35")
base:add_cargo("Resources", "Oil", 25000, 0)
base:add_cargo("Ammos", "Ammo", 25000, 0)
base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 150)
base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 150)

base:create_forces()

base:add_men("Soldiers", 1, 12000)
base:add_men("Soldiers", 2, 1500)
base:add_men("Soldiers", 3, 500)
base:add_men("Engineers", 2, 1000)
base:add_men("Engineers", 3, 1000)
base:add_men("Engineers", 4, 1000)

----------------------------------------------------------------------------------------
-- Okinawa Base38
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Airport", "", 1, "Base38")
sl_japan_player:set_building_upgrade("Airport", 2, "Base38")

sl_japan_player:add_building("Port", "", 1, "Base38")
sl_japan_player:set_building_upgrade("Port", 2, "Base38")

sl_japan_player:add_building("Tank", "", 1, "Base38")
sl_japan_player:set_building_upgrade("Tank", 2, "Base38")

sl_japan_player:add_building("Store", "", 1, "Base38")
sl_japan_player:set_building_upgrade("Store", 2, "Base38")

sl_japan_player:add_building("House", "", 5, "Base38")
--sl_japan_player:set_building_upgrade("House", 2, "Base38")

--sl_japan_player:add_building("Bunker", "", 2, "Base38")
--sl_japan_player:set_building_upgrade("Bunker", 2, "Base38")

sl_japan_player:add_building("Hospital", "", 1, "Base38")
sl_japan_player:set_building_upgrade("Hospital", 1, "Base38")

sl_japan_player:add_building("Church", "", 1, "Base38")
sl_japan_player:set_building_upgrade("Church", 3, "Base38")

--sl_japan_player:add_building("Defence", "", 1, "Base38")
--sl_japan_player:set_building_upgrade("Defence", 2, "Base38")

sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 1, "Base38")
sl_japan_player:set_building_upgrade("RadioStation", 2, "Base38")

sl_japan_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 10, "Base38")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base38")

sl_japan_player:add_building("Artillery", "Turrets.Kazemat_Turret_203_Akagi.Kazemat_Turret_203_Akagi", 10, "Base38")
sl_japan_player:set_building_upgrade("Artillery", 1, "Base38")

sl_japan_player:add_building("ShootingRange", "", 1, "Base38")

base = get_base("Base38")
base:add_cargo("Resources", "Oil", 1000, 0)
base:add_cargo("Ammos", "Ammo", 1000, 0)
--base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 100)
--base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 100)

base:create_forces()

base:add_men("Soldiers", 1, 500)
base:add_men("Soldiers", 2, 500)
base:add_men("Engineers", 2, 500)
base:add_men("Engineers", 3, 500)


----------------------------------------------------------------------------------------
-- Iwo Jima Base31
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Airport", "", 1, "Base31")
sl_japan_player:set_building_upgrade("Airport", 2, "Base31")

sl_japan_player:add_building("Port", "", 1, "Base31")
sl_japan_player:set_building_upgrade("Port", 2, "Base31")

sl_japan_player:add_building("Tank", "", 1, "Base31")
sl_japan_player:set_building_upgrade("Tank", 2, "Base31")

sl_japan_player:add_building("Store", "", 1, "Base31")
sl_japan_player:set_building_upgrade("Store", 2, "Base31")

sl_japan_player:add_building("House", "", 5, "Base31")
--sl_japan_player:set_building_upgrade("House", 2, "Base31")

--sl_japan_player:add_building("Bunker", "", 2, "Base31")
--sl_japan_player:set_building_upgrade("Bunker", 2, "Base31")

sl_japan_player:add_building("Hospital", "", 1, "Base31")
sl_japan_player:set_building_upgrade("Hospital", 1, "Base31")

sl_japan_player:add_building("Church", "", 1, "Base31")
sl_japan_player:set_building_upgrade("Church", 3, "Base31")

--sl_japan_player:add_building("Defence", "", 1, "Base31")
--sl_japan_player:set_building_upgrade("Defence", 2, "Base31")

sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 1, "Base31")
sl_japan_player:set_building_upgrade("RadioStation", 2, "Base31")

--sl_japan_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 4, "Base31")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base31")

sl_japan_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 8, "Base31")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base31")

sl_japan_player:add_building("Artillery", "Turrets.Kazemat_Turret_203_Akagi.Kazemat_Turret_203_Akagi", 8, "Base31")
sl_japan_player:set_building_upgrade("Artillery", 1, "Base31")

--sl_japan_player:add_building("ShootingRange", "", 1, "Base31")

base = get_base("Base31")
base:add_cargo("Resources", "Oil", 1000, 0)
base:add_cargo("Ammos", "Ammo", 1000, 0)
--base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 90)
--base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 90)

base:create_forces()

base:add_men("Soldiers", 1, 500)
base:add_men("Soldiers", 2, 400)
base:add_men("Soldiers", 3, 100)
base:add_men("Engineers", 1, 300)
base:add_men("Engineers", 2, 400)
base:add_men("Engineers", 3, 300)

----------------------------------------------------------------------------------------
-- Каочунг (Тайвань) Base40
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Airport", "", 1, "Base40")
sl_japan_player:set_building_upgrade("Airport", 2, "Base40")

sl_japan_player:add_building("Port", "", 1, "Base40")
sl_japan_player:set_building_upgrade("Port", 2, "Base40")

sl_japan_player:add_building("Tank", "", 4, "Base40")
sl_japan_player:set_building_upgrade("Tank", 2, "Base40")

sl_japan_player:add_building("Store", "", 3, "Base40")
sl_japan_player:set_building_upgrade("Store", 2, "Base40")

sl_japan_player:add_building("House", "", 7, "Base40")
--sl_japan_player:set_building_upgrade("House", 2, "Base40")

-- sl_japan_player:add_building("Bunker", "", 2, "Base40")
-- sl_japan_player:set_building_upgrade("Bunker", 2, "Base40")

-- sl_japan_player:add_building("Mine", "", 1, "Base40")
-- sl_japan_player:set_building_upgrade("Mine", 2, "Base40")

sl_japan_player:add_building("Hospital", "", 1, "Base40")
sl_japan_player:set_building_upgrade("Hospital", 1, "Base40")

sl_japan_player:add_building("Church", "", 1, "Base40")
sl_japan_player:set_building_upgrade("Church", 3, "Base40")

--sl_japan_player:add_building("Defence", "", 1, "Base40")
--sl_japan_player:set_building_upgrade("Defence", 2, "Base40")

sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 1, "Base40")
sl_japan_player:set_building_upgrade("RadioStation", 2, "Base40")

--sl_japan_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 6, "Base40")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base40")

sl_japan_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 8, "Base40")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base40")

sl_japan_player:add_building("Artillery", "Turrets.Kazemat_Turret_203_Akagi.Kazemat_Turret_203_Akagi", 8, "Base40")
sl_japan_player:set_building_upgrade("Artillery", 1, "Base40")

--sl_japan_player:add_building("ShootingRange", "", 1, "Base40")

base = get_base("Base40")
base:add_cargo("Resources", "Oil", 5000, 0)
base:add_cargo("Ammos", "Ammo", 5000, 0)
base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 100)
base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 100)

base:create_forces()

base:add_men("Soldiers", 1, 500)
base:add_men("Soldiers", 2, 400)
base:add_men("Soldiers", 3, 100)
base:add_men("Engineers", 2, 500)
base:add_men("Engineers", 3, 1000)
base:add_men("Engineers", 4, 500)

----------------------------------------------------------------------------------------
-- Truk Base44
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Port", "", 1, "Base44")
-- sl_japan_player:set_building_upgrade("Port", 3, "Base44")

sl_japan_player:add_building("Tank", "", 1, "Base44")
-- sl_japan_player:set_building_upgrade("Tank", 2, "Base44")

sl_japan_player:add_building("Store", "", 1, "Base44")
-- sl_japan_player:set_building_upgrade("Store", 2, "Base44")

sl_japan_player:add_building("House", "", 2, "Base44")
-- sl_japan_player:set_building_upgrade("House", 2, "Base44")

--sl_japan_player:add_building("Bunker", "", 2, "Base44")
--sl_japan_player:set_building_upgrade("Bunker", 2, "Base44")

sl_japan_player:add_building("Hospital", "", 1, "Base44")
-- sl_japan_player:set_building_upgrade("Hospital", 1, "Base44")

sl_japan_player:add_building("Church", "", 1, "Base44")
-- sl_japan_player:set_building_upgrade("Church", 1, "Base44")

--sl_japan_player:add_building("Defence", "", 1, "Base44")
--sl_japan_player:set_building_upgrade("Defence", 2, "Base44")

sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 1, "Base44")
sl_japan_player:set_building_upgrade("RadioStation", 2, "Base31")

sl_japan_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 1, "Base44")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base44")

sl_japan_player:add_building("Artillery", "Turrets.Kazemat_Turret_203_Akagi.Kazemat_Turret_203_Akagi", 1, "Base44")
sl_japan_player:set_building_upgrade("AAGun", 1, "Base44")

base = get_base("Base44")
base:add_cargo("Resources", "Oil", 1000, 0)
base:add_cargo("Ammos", "Ammo", 1000, 0)
--base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 50)
--base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 50)

base:create_forces()

base:add_men("Soldiers", 1, 200)
base:add_men("Soldiers", 2, 200)
base:add_men("Soldiers", 3, 100)
base:add_men("Engineers", 2, 200)
base:add_men("Engineers", 3, 250)
base:add_men("Engineers", 4, 100)

----------------------------------------------------------------------------------------
-- Хайкоку Base59
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Airport", "", 1, "Base59")
sl_japan_player:set_building_upgrade("Airport", 2, "Base59")

sl_japan_player:add_building("Port", "", 1, "Base59")
sl_japan_player:set_building_upgrade("Port", 1, "Base59")

sl_japan_player:add_building("Tank", "", 3, "Base59")
sl_japan_player:set_building_upgrade("Tank", 1, "Base59")

sl_japan_player:add_building("Store", "", 5, "Base59")
sl_japan_player:set_building_upgrade("Store", 1, "Base59")

sl_japan_player:add_building("House", "", 45, "Base59")
--sl_japan_player:set_building_upgrade("House", 1, "Base59")

sl_japan_player:add_building("Hospital", "", 3, "Base59")
sl_japan_player:set_building_upgrade("Hospital", 1, "Base59")

sl_japan_player:add_building("Church", "", 2, "Base59")
sl_japan_player:set_building_upgrade("Church", 1, "Base59")

--sl_japan_player:add_building("Defence", "", 1, "Base59")
--sl_japan_player:set_building_upgrade("Defence", 2, "Base59")

sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 1, "Base59")
sl_japan_player:set_building_upgrade("RadioStation", 2, "Base59")

sl_japan_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 1, "Base59")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base59")

sl_japan_player:add_building("Artillery", "Turrets.Kazemat_Turret_203_Akagi.Kazemat_Turret_203_Akagi", 1, "Base59")
sl_japan_player:set_building_upgrade("AAGun", 1, "Base59")

sl_japan_player:add_building("ShootingRange", "", 1, "Base59")

base = get_base("Base59")
base:add_cargo("Resources", "Oil", 5000, 0)
base:add_cargo("Ammos", "Ammo", 5000, 0)
base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 90)
base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 90)

base:create_forces()

base:add_men("Soldiers", 1, 3000)
base:add_men("Soldiers", 2, 15000)
base:add_men("Soldiers", 3, 23000)
base:add_men("Engineers", 2, 1100)
base:add_men("Engineers", 3, 1000)
base:add_men("Engineers", 4, 350)

----------------------------------------------------------------------------------------
-- Niigata Base19
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Airport", "", 1, "Base19")
sl_japan_player:set_building_upgrade("Airport", 2, "Base19")

sl_japan_player:add_building("Port", "", 1, "Base19")
sl_japan_player:set_building_upgrade("Port", 3, "Base19")

sl_japan_player:add_building("Tank", "", 1, "Base19")
sl_japan_player:set_building_upgrade("Tank", 2, "Base19")

sl_japan_player:add_building("Store", "", 1, "Base19")
sl_japan_player:set_building_upgrade("Store", 2, "Base19")

sl_japan_player:add_building("House", "", 7, "Base19")
--sl_japan_player:set_building_upgrade("House", 2, "Base19")

--sl_japan_player:add_building("Bunker", "", 2, "Base19")
--sl_japan_player:set_building_upgrade("Bunker", 2, "Base19")

sl_japan_player:add_building("Mine", "", 1, "Base19")
sl_japan_player:set_building_upgrade("Mine", 2, "Base19")

sl_japan_player:add_building("Hospital", "", 4, "Base19")
sl_japan_player:set_building_upgrade("Hospital", 1, "Base19")

sl_japan_player:add_building("Church", "", 1, "Base19")
sl_japan_player:set_building_upgrade("Church", 3, "Base19")

--sl_japan_player:add_building("Defence", "", 1, "Base19")
--sl_japan_player:set_building_upgrade("Defence", 2, "Base19")

sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 1, "Base19")
sl_japan_player:set_building_upgrade("RadioStation", 2, "Base19")

--sl_japan_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 6, "Base19")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base19")

sl_japan_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 10, "Base19")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base19")

sl_japan_player:add_building("Artillery", "Turrets.Kazemat_Turret_203_Akagi.Kazemat_Turret_203_Akagi", 10, "Base19")
sl_japan_player:set_building_upgrade("Artillery", 1, "Base19")

sl_japan_player:add_building("ShootingRange", "", 1, "Base19")

base = get_base("Base19")
base:add_cargo("Resources", "Oil", 2000, 0)
base:add_cargo("Ammos", "Ammo", 5000, 0)
base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 50)
base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 50)

base:create_forces()

base:add_men("Soldiers", 1, 500)
base:add_men("Soldiers", 2, 500)
base:add_men("Engineers", 2, 1000)
base:add_men("Engineers", 3, 1000)
base:add_men("Engineers", 4, 1000)

----------------------------------------------------------------------------------------
-- Port Arthur Base36
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Airport", "", 1, "Base36")
sl_japan_player:set_building_upgrade("Airport", 2, "Base36")

sl_japan_player:add_building("Port", "", 1, "Base36")
sl_japan_player:set_building_upgrade("Port", 2, "Base36")

sl_japan_player:add_building("Tank", "", 4, "Base36")
sl_japan_player:set_building_upgrade("Tank", 2, "Base36")

sl_japan_player:add_building("Store", "", 3, "Base36")
sl_japan_player:set_building_upgrade("Store", 2, "Base36")

sl_japan_player:add_building("House", "", 32, "Base36")
--sl_japan_player:set_building_upgrade("House", 2, "Base36")

-- sl_japan_player:add_building("Bunker", "", 2, "Base36")
-- sl_japan_player:set_building_upgrade("Bunker", 2, "Base36")

sl_japan_player:add_building("Mine", "", 1, "Base36")
sl_japan_player:set_building_upgrade("Mine", 2, "Base36")

sl_japan_player:add_building("Hospital", "", 3, "Base36")
sl_japan_player:set_building_upgrade("Hospital", 1, "Base36")

sl_japan_player:add_building("Church", "", 1, "Base36")
sl_japan_player:set_building_upgrade("Church", 3, "Base36")

--sl_japan_player:add_building("Defence", "", 1, "Base36")
--sl_japan_player:set_building_upgrade("Defence", 2, "Base36")

sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 1, "Base36")
sl_japan_player:set_building_upgrade("RadioStation", 2, "Base36")

--sl_japan_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 6, "Base36")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base36")

sl_japan_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 8, "Base36")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base36")

sl_japan_player:add_building("Artillery", "Turrets.Kazemat_Turret_203_Akagi.Kazemat_Turret_203_Akagi", 8, "Base36")
--sl_japan_player:set_building_upgrade("Artillery", 1, "Base36")

sl_japan_player:add_building("ShootingRange", "", 1, "Base36")

base = get_base("Base36")
base:add_cargo("Resources", "Oil", 2000, 0)
base:add_cargo("Ammos", "Ammo", 5000, 0)
base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 50)
base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 50)

base:create_forces()

base:add_men("Soldiers", 1, 3000)
base:add_men("Soldiers", 2, 10500)
base:add_men("Soldiers", 3, 15000)
base:add_men("Engineers", 2, 500)
base:add_men("Engineers", 3, 1000)
base:add_men("Engineers", 4, 1000)

----------------------------------------------------------------------------------------
-- Shanghai Base37
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
sl_japan_player:set_building_upgrade("Church", 2, "Base37")

--sl_japan_player:add_building("Defence", "", 1, "Base37")
--sl_japan_player:set_building_upgrade("Defence", 2, "Base37")

sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 1, "Base37")
sl_japan_player:set_building_upgrade("RadioStation", 2, "Base37")

sl_japan_player:add_building("ShootingRange", "", 1, "Base37")

base = get_base("Base37")
base:add_cargo("Resources", "Oil", 25000, 0)
base:add_cargo("Ammos", "Ammo", 8000, 0)
base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 90)
base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 90)
base:create_forces()

base:add_men("Soldiers", 1, 3000)
base:add_men("Soldiers", 2, 15000)
base:add_men("Soldiers", 3, 20500)
base:add_men("Engineers", 2, 1000)
base:add_men("Engineers", 3, 1500)
base:add_men("Engineers", 4, 500)

----------------------------------------------------------------------------------------
-- Sapporo Base18
----------------------------------------------------------------------------------------

sl_japan_player:add_building("Airport", "", 1, "Base18")
sl_japan_player:set_building_upgrade("Airport", 2, "Base18")

sl_japan_player:add_building("Port", "", 1, "Base18")
sl_japan_player:set_building_upgrade("Port", 2, "Base18")

sl_japan_player:add_building("Tank", "", 1, "Base18")
sl_japan_player:set_building_upgrade("Tank", 2, "Base18")

sl_japan_player:add_building("Store", "", 1, "Base18")
sl_japan_player:set_building_upgrade("Store", 2, "Base18")

sl_japan_player:add_building("House", "", 4, "Base18")
--sl_japan_player:set_building_upgrade("House", 2, "Base18")

--sl_japan_player:add_building("Bunker", "", 2, "Base18")
--sl_japan_player:set_building_upgrade("Bunker", 2, "Base18")

sl_japan_player:add_building("Hospital", "", 1, "Base18")
sl_japan_player:set_building_upgrade("Hospital", 1, "Base18")

sl_japan_player:add_building("Mine", "", 1, "Base18")
sl_japan_player:set_building_upgrade("Mine", 2, "Base18")

sl_japan_player:add_building("Church", "", 1, "Base18")
sl_japan_player:set_building_upgrade("Church", 3, "Base18")

--sl_japan_player:add_building("Defence", "", 1, "Base18")
--sl_japan_player:set_building_upgrade("Defence", 2, "Base18")

sl_japan_player:add_building("RadioStation", "Probes.Model_94_Mark_3C.Model_94_Mark_3C", 1, "Base18")
sl_japan_player:set_building_upgrade("RadioStation", 2, "Base18")

--sl_japan_player:add_building("AAGun", "Turrets.Turret_20x1.Turret_20x1", 6, "Base18")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base18")

sl_japan_player:add_building("AAGun", "Turrets.Turret_40x1.Turret_40x1", 10, "Base18")
--sl_japan_player:set_building_upgrade("AAGun", 1, "Base18")

sl_japan_player:add_building("Artillery", "Turrets.Kazemat_Turret_203_Akagi.Kazemat_Turret_203_Akagi", 10, "Base18")
sl_japan_player:set_building_upgrade("Artillery", 1, "Base18")

sl_japan_player:add_building("ShootingRange", "", 1, "Base18")

base = get_base("Base18")
base:add_cargo("Resources", "Oil", 1000, 0)
base:add_cargo("Ammos", "Ammo", 2000, 0)
base:add_cargo("Ammos", "Torp_Jap_Mk93", 0, 50)
base:add_cargo("Ammos", "Torp_Jap_Mk91", 0, 50)

base:create_forces()

base:add_men("Soldiers", 1, 1000)
base:add_men("Engineers", 2, 500)
base:add_men("Engineers", 3, 400)
base:add_men("Engineers", 4, 100)

----------------------------------------------------------------------------------------
-- Создаем формацию на карте
----------------------------------------------------------------------------------------
--- помогаем АИ - создадим ему сразу пустых формаций транспортов и танкеров
if (sl_get_my_player_id() ~= sl_japan_player:get_id()) then
	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base29")
	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base29")
	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base29")
	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base29")
	sl_japan_player:create_formation_on_base("Tanker_Battalion_japan", "Base29")
	sl_japan_player:create_formation_on_base("Tanker_Battalion_japan", "Base29")
	sl_japan_player:create_formation_on_base("Tanker_Battalion_japan", "Base29")
	
	
	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base40")
	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base40")
	sl_japan_player:create_formation_on_base("Tanker_Battalion_japan", "Base40")

	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base28")
	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base28")
	sl_japan_player:create_formation_on_base("Tanker_Battalion_japan", "Base28")
	sl_japan_player:create_formation_on_base("Tanker_Battalion_japan", "Base28")
	
	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base35")
	sl_japan_player:create_formation_on_base("Transport_Battalion_japan", "Base35")
	sl_japan_player:create_formation_on_base("Tanker_Battalion_japan", "Base35")
	sl_japan_player:create_formation_on_base("Tanker_Battalion_japan", "Base35")
end

log_message ("sl_japan_player_init.lua end")

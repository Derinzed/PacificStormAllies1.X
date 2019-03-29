-------------------------------------------------------------
-- sl_create_decoration(objName, meshName, x, y, z, alpha) --
-------------------------------------------------------------
----------------------------------------------------------------------
-- sl_create_decor_fish(country, objName, meshName, x, y, z, alpha) --
----------------------------------------------------------------------

log_message ("sldecoration.lua ")


sl_create_decoration("SL/Decor/Pencil1", "sl_decor_pencil.mesh", 500, 0, 500, 45)
sl_create_decoration("SL/Decor/Pencil2", "sl_decor_pencil.mesh", 3500, 0, 600, -50)
sl_create_decoration("SL/Decor/Compass", "sl_decor_compass.mesh", 300, 5, 300, -45)
sl_create_decoration("SL/Decor/Lineyka", "lineyka.mesh", 3500, 0, 300, -90)

sl_create_decor_fish("usa", "SL/Decor/Fish1", "Bomber_Fish.mesh", 1500, 5, -70, 90)
sl_create_decor_fish("japan", "SL/Decor/Fish2", "Battleship_Fish.mesh", 1600, 5, -80, 45)
sl_create_decor_fish("usa", "SL/Decor/Fish3", "AircraftCarrier_Fish.mesh", 2000, 5, -90, 120)
sl_create_decor_fish("japan", "SL/Decor/Fish4", "Fighter_Fish.mesh", 2200, 5, -75, 30)


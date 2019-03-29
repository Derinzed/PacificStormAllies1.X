sl_main_width = 624
sl_mods_width = 200
sl_racks_width = 404
sl_ammo_types_width = 180
sl_racks_left = 404
sl_ammo_types_left = 100

function sl_rack_show_range()
	ge_get("SL/Rack/RangePanel"):show()
	desc_panel = ge_get("SL/Rack/DescPanel")
	desc_panel:set_top(225)
	desc_panel:set_height(201)
	ge_get("SL/Rack/DescList"):set_height(199)
end

function sl_rack_hide_range()
	ge_get("SL/Rack/RangePanel"):hide()
	desc_panel = ge_get("SL/Rack/DescPanel")
	desc_panel:set_top(200)
	desc_panel:set_height(226)
	ge_get("SL/Rack/DescList"):set_height(220)
end

function sl_rack_gui_for_plane_unit()
	ge_get("SL/Rack/ModsPanel"):hide ()
	ge_get("SL/Rack/AmmoTypesPanel"):hide ()
	sl_racks_left = 8
	sl_racks_width = sl_main_width - 16
	sl_rack_update()
	sl_rack_show_range()
	
end

function sl_rack_gui_for_ship_unit()
	ge_get ("SL/Rack/ModsPanel"):hide ()
	ge_get ("SL/Rack/AmmoTypesPanel"):show ()
	sl_ammo_types_left = 8
	sl_racks_left = sl_ammo_types_left + sl_ammo_types_width + 4
	sl_racks_width = sl_main_width - sl_racks_left - 8
	sl_rack_update()
	sl_rack_hide_range()
end

function sl_rack_gui_for_plane_formation()
	ge_get ("SL/Rack/ModsPanel"):show ()
	ge_get ("SL/Rack/AmmoTypesPanel"):hide ()
	sl_racks_left = sl_mods_width + 12
	sl_racks_width = sl_main_width - sl_mods_width - 20
	sl_rack_update()
	sl_rack_show_range()
end

function sl_rack_gui_for_ship_formation()
	ge_get ("SL/Rack/ModsPanel"):show ()
	ge_get ("SL/Rack/AmmoTypesPanel"):show ()
	sl_ammo_types_left = sl_mods_width + 12
	sl_racks_left = sl_ammo_types_left + sl_ammo_types_width + 4
	sl_racks_width = sl_main_width - sl_racks_left - 8
	sl_rack_update()
	sl_rack_hide_range()
end

function sl_rack_update()
	sl_rack_resize_panel("Mods", sl_mods_width)
	sl_rack_resize_panel("AmmoTypes", sl_ammo_types_width)
	sl_rack_resize_panel("Racks", sl_racks_width)
	ge_get ("SL/Rack/AmmoTypesPanel"):set_left (sl_ammo_types_left)
	ge_get ("SL/Rack/RacksPanel"):set_left (sl_racks_left)
end

function sl_rack_resize_panel(panelType, width)
	ge_get ("SL/Rack/" .. panelType .. "Panel"):set_width (width)
	ge_get ("SL/Rack/" .. panelType .. "Panel/TitlePanel"):set_width (width)
	ge_get ("SL/Rack/" .. panelType .. "Panel/Title"):set_width (width)
	ge_get ("SL/Rack/" .. panelType .. "List"):set_width (width - 4)
end
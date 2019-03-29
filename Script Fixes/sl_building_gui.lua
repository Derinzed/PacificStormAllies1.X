function make_building_quque_popup(menu, filter)

	--сделать здание важным. тогда при его производстве выскочит окно об окончании производства этого здания
	add_item_to_popup_menu(
		menu,
		"sl_menuitem_building_set_important",
		"IDS_SetImportand",
		"",
		"IDS_HINT_buildingSetImportand",
		string.sub(filter, 1, 1) == "1"
	);

	--снять пометку важности
	add_item_to_popup_menu(
		menu,
		"sl_menuitem_building_set_unimportant",
		"IDS_SetNoImportand",
		"",
		"IDS_HINT_SetNoImportand",
		string.sub(filter, 2, 2) == "1"
	);

	--послать на ожидание. ожидаемые здания не строятся
	add_item_to_popup_menu(
		menu,
		"sl_menuitem_building_wait",
		"IDS_Wait",
		"",
		"IDS_HINT_buildingWait",
		string.sub(filter, 3, 3) == "1"
	);

	--снять режим ожидания
	add_item_to_popup_menu(
		menu,
		"sl_menuitem_building_clear_wait",
		"IDS_ClearWait",
		"",
		"IDS_HINT_ClearWait",
		string.sub(filter, 4, 4) == "1"
	);

	--всем ожидать
	add_item_to_popup_menu(
		menu,
		"sl_menuitem_building_wait_all",
		"IDS_WaitAll",
		"",
		"IDS_HINT_WaitAll",
		string.sub(filter, 5, 5) == "1"
	);

	--всех запустить
	add_item_to_popup_menu(
		menu,
		"sl_menuitem_building_clear_wait_all",
		"IDS_ClearWaitAll",
		"",
		"IDS_HINT_ClearWaitAll",
		string.sub(filter, 6, 6) == "1"
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_building_remove_from_queue",
		"Remove",
		"",
		"IDS_HINT_REMOVE",
		true
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_building_decrease_priority",
		"DecreasePriority",
		"",
		"IDS_HINT_DECREASEPRIORITY",
		true
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_building_increase_priority",
		"IncreasePriority",
		"",
		"IDS_HINT_INCREASEPRIORITY",
		true
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_building_lowest_priority",
		"LowestPriority",
		"",
		"IDS_HINT_LOWESTPRIORITY",
		true
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_building_highest_priority",
		"HighestPriority",
		"",
		"IDS_HINT_HIGHESTPRIORITY",
		true
	);

end

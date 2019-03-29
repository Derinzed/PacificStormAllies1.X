
function make_technology_quque_popup(menu, filter)

	sl_play_sound("MakeTechnologyQuquePopup", false) 

	--сделать важным. тогда при его производстве выскочит окно об окончании производства
	add_item_to_popup_menu(
		menu,
		"sl_menuitem_technology_set_important",
		"IDS_SetImportand",
		"",
		"IDS_HINT_technologySetImportand",
		string.sub(filter, 1, 1) == "1"
	);

	--снять пометку важности
	add_item_to_popup_menu(
		menu,
		"sl_menuitem_technology_set_unimportant",
		"IDS_SetNoImportand",
		"",
		"IDS_HINT_SetNoImportand",
		string.sub(filter, 2, 2) == "1"
	);

	--послать на ожидание. ожидаемые не строятся
	add_item_to_popup_menu(
		menu,
		"sl_menuitem_technology_wait",
		"IDS_Wait",
		"",
		"IDS_HINT_technologyWait",
		string.sub(filter, 3, 3) == "1"
	);

	--снять режим ожидания
	add_item_to_popup_menu(
		menu,
		"sl_menuitem_technology_clear_wait",
		"IDS_ClearWait",
		"",
		"IDS_HINT_ClearWait",
		string.sub(filter, 4, 4) == "1"
	);

	--всем ожидать
	add_item_to_popup_menu(
		menu,
		"sl_menuitem_technology_wait_all",
		"IDS_WaitAll",
		"",
		"IDS_HINT_WaitAll",
		string.sub(filter, 5, 5) == "1"
	);

	--всех запустить
	add_item_to_popup_menu(
		menu,
		"sl_menuitem_technology_clear_wait_all",
		"IDS_ClearWaitAll",
		"",
		"IDS_HINT_ClearWaitAll",
		string.sub(filter, 6, 6) == "1"
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_tech_order_remove",
		"Remove",
		"",
		"IDS_HINT_REMOVE",
		true
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_tech_decrease_priority",
		"DecreasePriority",
		"",
		"IDS_HINT_DECREASEPRIORITY",
		true
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_tech_increase_priority",
		"IncreasePriority",
		"",
		"IDS_HINT_INCREASEPRIORITY",
		true
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_tech_lowest_priority",
		"LowestPriority",
		"",
		"IDS_HINT_LOWESTPRIORITY",
		true
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_tech_highest_priority",
		"HighestPriority",
		"",
		"IDS_HINT_HIGHESTPRIORITY",
		true
	);

end

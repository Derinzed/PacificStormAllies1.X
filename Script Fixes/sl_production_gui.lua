-- Copyright (c) Lesta Studio, 2004

function make_production_quque_popup(menu, filter)

	sl_play_sound("MakeProductionQuquePopup", false) 

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_production_make_important",
		"IDS_SetImportand",
		"",
		"IDS_HINT_productionSetImportand",
		string.sub(filter, 1, 1) == "1"
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_production_make_unimportant",
		"IDS_SetNoImportand",
		"",
		"IDS_HINT_SetNoImportand",
		string.sub(filter, 2, 2) == "1"
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_production_wait",
		"IDS_Wait",
		"",
		"IDS_HINT_productionWait",
		string.sub(filter, 3, 3) == "1"
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_production_clear_wait",
		"IDS_ClearWait",
		"",
		"IDS_HINT_ClearWait",
		string.sub(filter, 4, 4) == "1"
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_production_wait_all",
		"IDS_WaitAll",
		"",
		"IDS_HINT_WaitAll",
		string.sub(filter, 5, 5) == "1"
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_production_clear_wait_all",
		"IDS_ClearWaitAll",
		"",
		"IDS_HINT_ClearWaitAll",
		string.sub(filter, 6, 6) == "1"
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_prod_order_remove",
		"Remove",
		"",
		"IDS_HINT_REMOVE",
		true
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_prod_decrease_priority",
		"DecreasePriority",
		"",
		"IDS_HINT_DECREASEPRIORITY",
		true
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_prod_increase_priority",
		"IncreasePriority",
		"",
		"IDS_HINT_INCREASEPRIORITY",
		true
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_prod_lowest_priority",
		"LowestPriority",
		"",
		"IDS_HINT_LOWESTPRIORITY",
		true
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_prod_highest_priority",
		"HighestPriority",
		"",
		"IDS_HINT_HIGHESTPRIORITY",
		true
	);

	add_item_to_popup_menu(
		menu,
		"sl_menuitem_prod_change",
		"ChangeProduction",
		"",
		"IDS_HINT_CHANGE_PRODUCTION",
		true
	);

end

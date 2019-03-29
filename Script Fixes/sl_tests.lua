------------------------------------
-- ”ничтожает все формации игрока --
------------------------------------
function sl_destroy_all_player_formations(playerName)
	if player == usa or player == USA then
		sl_usa_player:destroy_all_formations()
	end
	if player == japan or player == Japan then
		sl_japan_player:destroy_all_formations()
	end
end
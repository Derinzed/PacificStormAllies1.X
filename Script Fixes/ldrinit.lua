-- Copyright (c)2004 Lesta Studio

require("res://common.lua")

log_message ("ldrinit.lua")

------------------------------------------------------------------------------
-- Инициализация подстановок клавиш.
------------------------------------------------------------------------------

keysubstitutions, msg = loadfile ("../data/scripts/keysubstitutions.lua")

if keysubstitutions == nil then
	log_message ("Substitutions are not loaded: "..msg)
else
	success, msg = pcall (keysubstitutions)

	if not success then
		log_message (debug.traceback ("ERROR: "..msg))
	end
end

------------------------------------------------------------------------------
-- Активация модуля.
------------------------------------------------------------------------------

--activate_game_module ("TacticLevel")
--activate_game_module ("StrategLevel")
--activate_game_module ("MainMenu")

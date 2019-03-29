------------------------------------------------------------------------------
-- Copyright (c) Lesta Studio, 2003
------------------------------------------------------------------------------

log_message ("Executing TL shutdown script tlshutdown.lua")

log_message ("tlshutdown.lua: Unbinding keys...")
unbind_group("TL/BINDKEYS")
unbind_group("TL/BINDKEYS/ADDUNITS")

log_message ("tlshutdown.lua: Unloading maps...")
OBJECT:remove ("TLMaps")

if (EDITOR_MODE==true) then
	log_message ("tlshutdown.lua: Unloading editor objects...")
	OBJECT:remove ("EditorObjects")
end

hide_overlay ("TL/Editor")
hide_overlay ("TL/Main")
hide_overlay ("TL/Main2")
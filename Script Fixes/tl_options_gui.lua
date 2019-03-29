------------------------------------------------------------------------------
-- Copyright (c) Lesta Studio, 2004
------------------------------------------------------------------------------

require ("res://common.lua")
log_message ("Executing GUI script tl_options_gui.lua")
------------------------------------------------------------------------------
function tl_gui_update_mouse_rotate (evt)
	
end
------------------------------------------------------------------------------
function tl_gui_options_dialog_hide (evt)
	hide_overlay("TL/Options")
end
------------------------------------------------------------------------------
function tl_gui_options_dialog (evt)
end
------------------------------------------------------------------------------
function tl_gui_options_dialog_close (evt)
end
------------------------------------------------------------------------------
set_on_mouse_clicked ("TL/OptionsWindow/MouseRotate", "tl_gui_update_mouse_rotate")
------------------------------------------------------------------------------
set_on_mouse_clicked ("TL/OptionsWindow/Close", "tl_gui_options_dialog_hide")
------------------------------------------------------------------------------
log_message ("Leaving tl_options_gui.lua")

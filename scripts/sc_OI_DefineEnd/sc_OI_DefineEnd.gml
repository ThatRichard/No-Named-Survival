var _manager = global.Inspector;

if (_manager.cur_obj == noone) {
	show_debug_message("Warning: sc_OIDefineEnd was called with no prior call to sc_OIDefineBegin.");
	
	return;
}

_manager.cur_obj = noone;
_manager.cur_index = 0;
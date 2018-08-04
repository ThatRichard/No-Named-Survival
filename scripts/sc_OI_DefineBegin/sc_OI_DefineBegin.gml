/// @desc sc_OI_DefineBegin
/// @arg object



var _object = argument0;
var _manager = global.Inspector;

if (_manager.cur_obj != noone) {
	show_debug_message("Warning: sc_OIDefineBegin was called, but a previous call wasn't closed using sc_OIDefineEnd.");
	
	return false;
}

if (ds_map_exists(_manager.obj_type_map, _object)) {
	return false;
}

_manager.cur_obj = _object;
_manager.cur_index = 0;

var arr_2D;
arr_2D[0, 0] = 0;

_manager.obj_type_map[? _object] = arr_2D;

return true;
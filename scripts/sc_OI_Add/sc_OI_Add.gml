/// @desc sc_OI_Add
/// @arg var_name
/// @arg type
/// @arg *string_array



var _manager = global.Inspector;

var _var_name = argument[0];
var _type = argument[1];

var _extras = 0; 

for (var _i = 2; _i < argument_count; _i++) {
	_extras[_i] = argument[_i];
}

if (_manager.cur_obj == noone) {
	show_message("Warning: sc_OIAdd was called without calling sc_OIDefineBegin first.");
	
	return;
}

var _definition = _manager.obj_type_map[? _manager.cur_obj];

_definition[@ _manager.cur_index, 0] = _var_name;
_definition[@ _manager.cur_index, 1] = _type;


if (is_array(_extras)) {
	for (var _i = 2; _i < array_length_1d(_extras); _i++) {
		_definition[@ _manager.cur_index, _i] = _extras[_i];
	}
}

_manager.cur_index++;
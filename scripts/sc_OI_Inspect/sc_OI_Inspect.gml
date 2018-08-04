/// @desc sc_OI_INspect
/// @param instance



var _manager = global.Inspector;

var _instance = argument0;

var _object = _instance.object_index;

var _definition = _manager.obj_type_map[? _object];

if (!is_array(_definition)) {
	show_debug_message("Warning: The object hasn't been defined yet.");
	
	return;	
}

for (var _i = 0; _i < array_height_2d(_definition); _i++) {
   var _var_name = _definition[_i, 0];
   
   var _value;
   
   if (variable_instance_exists(_instance, _var_name)) {
       _value = variable_instance_get(_instance, _var_name);
	} else {
       show_debug_message("Warning: The variable \"" + _var_name + "\" does not exist in the " + object_get_name(_instance.object_index) + " object.");
	   
       return;
   }
   
   switch(_definition[_i, 1]) {
       case VarTypes.Int:    sc_OI_InspectInt(_var_name, _value);							break;
       case VarTypes.Float:  sc_OI_InspectFloat(_var_name, _value);							break;
       case VarTypes.Bool:   sc_OI_InspectBool(_var_name, _value);							break;
       case VarTypes.String: sc_OI_InspectString(_var_name, _value);						break;
	   case VarTypes.Enum:   sc_OI_InspectEnum(_var_name, _value, _definition[_i, 2]);      break;
   }
   
   _manager.cur_index++;
}

_manager.cur_index = 0;
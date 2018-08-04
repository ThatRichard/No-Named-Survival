/// @desc sc_OI_InspectBool
/// @arg name
/// @arg value
/// @arg strings


var _name  = argument0;
var _value = argument1;
var _strings = argument2;

draw_set_valign(fa_bottom);
draw_set_font(fnt_Main);
draw_text(0, window_get_height() - (15 * global.Inspector.cur_index), _name + ": " + _strings[_value]);
draw_set_valign(fa_top);
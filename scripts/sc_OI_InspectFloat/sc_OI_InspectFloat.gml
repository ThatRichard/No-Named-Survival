/// @desc sc_OI_InspectFloat
/// @arg name
/// @arg value


var _name  = argument0;
var _value = argument1;

draw_set_valign(fa_bottom);
draw_set_font(fnt_Main);
draw_text(0, window_get_height() - (15 * global.Inspector.cur_index), _name + ": " + string(_value));
draw_set_valign(fa_top);
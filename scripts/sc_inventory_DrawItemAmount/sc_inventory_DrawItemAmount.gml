/// @desc sc_inventory_DrawItemAmount
/// @arg x
/// @arg y
/// @arg amount



var _amount = argument2;

if (_amount > 1) {
	var _x = argument0;
	var _y = argument1;
	var _angle = argument3;
	draw_set_alpha((GUI_ALPHA / GUI_ALPHA) * draw_get_alpha());
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_set_font(fnt_Main);
	
	var _pyth = sqrt(power(inventory_gui_size - (string_width(string(_amount)) / 2) - 1, 2) + power(inventory_gui_size - (string_height(string(_amount)) / 2) - 1, 2)); 
	
	draw_text_transformed(_x + lengthdir_x(_pyth, _angle - 45), _y + lengthdir_y(_pyth, _angle - 45), string(_amount), 1, 1, _angle);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
}
if (global.selected_slot != noone) {
	var _item = global.inventory[| global.selected_slot];
	var _item_id = _item[? "id"];

	if (_item_id > 0) {
		var _x = global.mouse_gui_x + 20;
		var _y = global.mouse_gui_y;
		
		var _sep = -1;
		var _w = 250;
		
		var _amount = "";
		if (_item[? "amount"] > 1) {
			_amount = " x" + string(_item[? "amount"]);	
		}
		
		var _name = string(_item[? "name"]) + _amount;
		var _desc = _item[? "desc"];

		draw_set_font(fnt_Item);
		var _name_w = string_width(_name);
		var _name_h = string_height(_name);
		
		draw_set_color(c_black);
		draw_set_alpha(GUI_ALPHA);
		draw_rectangle(_x - GUI_OFFSET, _y - GUI_OFFSET, _x + _name_w + GUI_OFFSET, _y + _name_h + GUI_OFFSET, false);
		
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_rectangle(_x - GUI_OFFSET - 1, _y - GUI_OFFSET - 1, _x + _name_w + GUI_OFFSET + 1, _y + _name_h + GUI_OFFSET + 1, true);
		
		if (global.mouse[? "id"] == 0) {
			draw_set_font(fnt_Main);
			var _desc_w = string_width_ext(_desc, _sep, _w);
			var _desc_h = string_height_ext(_desc, _sep, _w);
			
			draw_set_alpha(GUI_ALPHA);
			draw_set_color(c_black);
			var _yy = _y + _name_h + GUI_OFFSET + 1 + 1;
			draw_rectangle(_x - GUI_OFFSET, _yy, _x + _desc_w + GUI_OFFSET, _yy + _desc_h + (GUI_OFFSET * 2), false);
			draw_set_alpha(1);
		
			draw_set_color(c_white);
			draw_rectangle(_x - GUI_OFFSET - 1, _yy - 1, _x + _desc_w + GUI_OFFSET + 1, _yy + _desc_h + (GUI_OFFSET * 2) + 1, true);
		
			// Separator between desc and name
			draw_set_color(c_aqua);
			draw_line(_x - GUI_OFFSET, _yy - 1, _x + _name_w + GUI_OFFSET, _yy - 1);
			
			draw_set_color(c_ltgray);
			draw_set_font(fnt_Main);
			draw_text_ext(_x, _yy + GUI_OFFSET, _desc, _sep, _w);
		}
	
		
		draw_set_color(c_white);
		draw_set_font(fnt_Item);
		draw_text(_x, _y, _name);
	}
}
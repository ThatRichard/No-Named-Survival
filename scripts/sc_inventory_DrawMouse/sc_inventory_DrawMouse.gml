var _item = global.mouse;
var _item_id = _item[? "id"];

if (_item_id != 0) {
	var _item_spr = _item[? "inv_sprite"];
	if (_item_spr != noone) {
		draw_set_font(fnt_Item);
		var _h = string_height("A");
		var _x = global.mouse_gui_x + 20;
		var _y = global.mouse_gui_y + (3 * GUI_OFFSET) + _h - 1;
		var _name = _item[? "name"];
		var _amount = _item[? "amount"];
		
		if (_amount > 1) {
			_name += " x" + string(_amount);
		}
	
		#region Background
	
		var _width = string_width(_name) + sprite_get_width(_item_spr) + GUI_OFFSET;
		var _height = sprite_get_height(_item_spr);
	
		draw_set_alpha(GUI_ALPHA);
		draw_set_color(c_black);
		draw_rectangle(_x - GUI_OFFSET, _y - GUI_OFFSET, _x + _width + GUI_OFFSET, _y + _height + GUI_OFFSET, false);
		draw_set_alpha(1);
		
		draw_set_color(c_white);
		draw_rectangle(_x - GUI_OFFSET - 1, _y - GUI_OFFSET - 1, _x + _width + GUI_OFFSET + 1, _y + _height + GUI_OFFSET + 1, true);
	
		// Separator between desc and name
		if (global.selected_slot != noone) {
			var _inv_item = global.inventory[| global.selected_slot];
		
			if (_inv_item[? "id"] > 0) {
				var _amount = _inv_item[? "amount"];
			
				var _name_w = string_width(_inv_item[? "name"]);
			
				if (_amount > 1) {
					_name_w += string_width(" x" + string(_inv_item[? "amount"]));
				}
				
				if (_name_w > _width) { //When item name is longer than the mouse shown text + image width
					var _temp = _width;
					_width = _name_w;
					_name_w = _temp;	
				}
		
				draw_set_color(c_aqua);
				draw_line(_x - GUI_OFFSET, _y - 1 - GUI_OFFSET, _x + _name_w + GUI_OFFSET, _y - 1 - GUI_OFFSET);
				
				draw_sprite(spr_MouseInArrow, 0, _x + _width + (2 * GUI_OFFSET), _y - GUI_OFFSET - 1);
			}
		}
			
	
		#endregion
		
		draw_sprite(_item_spr, 0, _x + string_width(_name) + GUI_OFFSET + (sprite_get_width(_item_spr) / 2), _y + (_height / 2));
		
		draw_set_color(c_ltgray);
		draw_set_valign(fa_center);
		draw_text(_x, _y + (_height / 2), _name);
		draw_set_valign(fa_top);
	}
}
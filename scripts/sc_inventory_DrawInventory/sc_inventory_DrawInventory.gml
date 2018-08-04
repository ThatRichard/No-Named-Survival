draw_sprite(spr_InventorySeparator, 0, separator_x, inventory_y - (inventory_gui_size * ((inventory_size / inventory_width) - 1)));
draw_sprite_ext(spr_InventorySeparator, 0, separator_x, inventory_y + inventory_gui_size, 1, -1, 0, c_white, 1);

if (!inventory_hidden) {
	var _number_offset = 2;
	
	for(var _y = 0; _y < (inventory_size / inventory_width); _y++) {
		for(var _x = 0; _x < inventory_width; _x++) {
			var _i = (_y * inventory_width) + _x;
			
			var _img;
			if (global.selected_slot == _i) {
				_img = 2;
			} else {
				if (_y == 0) {
					if (global.hotbar_selected == _i) {
						_img = 3;	
					} else {
						_img = 1;
					}
				} else {
					_img = 0;
				}
			}
		
			var _xx = inventory_x + (inventory_gui_size * _x);
			var _yy = inventory_y - (inventory_gui_size * _y);
		
			draw_set_color(c_black);
			draw_set_alpha(GUI_ALPHA);
			draw_sprite(spr_InventorySlot, _img, _xx, _yy);
			draw_set_alpha(1);
		
			var _item = global.inventory[| _i];
			
			var _item_spr = _item[? "inv_sprite"];
			
			if (_item_spr != noone) {	
				draw_sprite(_item_spr, 0, _xx + (inventory_gui_size / 2), _yy + (inventory_gui_size / 2));
			}
			
			// Item  text
			if (_y == 0) {
				draw_set_alpha(GUI_ALPHA);
				draw_set_color(c_white);
				draw_set_font(fnt_Main);
				draw_text(_xx + (_number_offset + 2), _yy + _number_offset, _i + 1);
				draw_set_alpha(1);
			}
			
			sc_inventory_DrawItemAmount(_xx, _yy, _item[? "amount"], 0);
		}
	}
}
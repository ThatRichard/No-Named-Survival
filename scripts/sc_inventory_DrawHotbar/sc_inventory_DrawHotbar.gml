if (hotbar_alpha > 0) {
	if (global.player_obj != noone) {
		var _angle = global.player_obj.body_angle + 90;
		
		for(var _i = 0; _i < inventory_width; _i++) {
			var _x = window_get_width() / 2 + lengthdir_x(hotbar_dist, _angle);
			var _y = window_get_height() / 2 + lengthdir_y(hotbar_dist, _angle);
			
			
			draw_sprite_ext(spr_HotbarSlot, (global.hotbar_selected == _i), _x, _y, 1, 1, 0, c_white, (GUI_ALPHA / 1.5) * hotbar_alpha);
		
			var _item = global.inventory[| _i];
			var _item_spr = _item[? "inv_sprite"];
		
			if (_item_spr != noone) {
				var _item_angle = _angle - 90;
				
				var _xscale = -1, _yscale = 1;
				
				if (_i > ((inventory_width - 1) / 2)) {
					_xscale = -_xscale;
					//_yscale = -_yscale;
				}
				
				draw_sprite_ext(_item_spr, 0, _x, _y, _xscale, _yscale, _item_angle, c_white, hotbar_alpha);	
				
				draw_set_alpha(hotbar_alpha / 1.5);
				var _pyth = sqrt(256 + 256);
				var __angle = _angle + 45;
				var _xx = _x + lengthdir_x(_pyth, __angle);
				var _yy = _y + lengthdir_y(_pyth, __angle);
				
				sc_inventory_DrawItemAmount(_xx, _yy, _item[? "amount"], _item_angle);
				draw_set_alpha(1);
			}
			
			
			_angle -= 180 / (inventory_width - 1);
		}
	}
}
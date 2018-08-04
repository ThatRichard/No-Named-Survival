if (global.hotbar_selected != last_hotbar_slot) {
	hotbar_show_timer = room_speed * 1.2;
}

if (!global.inventory_open) { // Closed
	if (hotbar_show_timer > 0) {
		hotbar_alpha = lerp(hotbar_alpha, 1, 0.2);
		hotbar_dist = lerp(hotbar_dist, hotbar_base_dist, 0.2);
	} else {
		hotbar_alpha = lerp(hotbar_alpha, 0, 0.2);
		hotbar_dist = lerp(hotbar_dist, 0, 0.2);
	}
	
	var _approach_x = -inventory_width * inventory_gui_size;
	
	inventory_x = lerp(inventory_x, _approach_x, 0.2);
	
	if (!inventory_hidden && inventory_x <= _approach_x) {
		inventory_hidden = true;
	} else if (inventory_hidden) {
		var _sep_approach_x = -sprite_get_width(spr_InventorySeparator);
		
		if (separator_x != _sep_approach_x) {
			separator_x = lerp(separator_x, _sep_approach_x, 0.08);
		}
	}
} else { // Open
	hotbar_show_timer = 0;
	hotbar_dist = lerp(hotbar_dist, 0, 0.2);
	hotbar_alpha = lerp(hotbar_alpha, 0, 0.2);
	
	if (inventory_hidden) {
		inventory_hidden = false;
	} else {
		var _sep_approach_x = separator_base_x;
		
		if (separator_x != _sep_approach_x) {
			separator_x = lerp(separator_x, _sep_approach_x, 0.08);
		}	
	}
	
	inventory_x = lerp(inventory_x, inventory_base_x, 0.25);
}
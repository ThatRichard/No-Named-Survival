if (global.pause) exit;

#region Inventory Animations

sc_inventory_Animations();

last_hotbar_slot = global.hotbar_selected;

sc_inventory_HotbarScroll();

#endregion

#region Inventory interaction
global.selected_slot = noone;

if (global.inventory_open) {
	for(var _y = 0; _y < (inventory_size / inventory_width); _y++) {
		for(var _x = 0; _x < inventory_width; _x++) {
			var _i = (_y * inventory_width) + _x;
		
			var _xx = inventory_x + (inventory_gui_size * _x);
			var _yy = inventory_y - (inventory_gui_size * _y);
		
			if (point_in_rectangle(global.mouse_gui_x, global.mouse_gui_y, _xx, _yy, _xx + inventory_gui_size - 1, _yy + inventory_gui_size - 1)) {
				global.selected_slot = _i;
				
				global.mouse_in_gui = true;
			}
		}
	}
	
	for(var _i = 0; _i < ds_list_size(global.inventory); _i++) {
		if (global.selected_slot == _i) {
			sc_inventory_Interactions();	
		}
	}
}

#endregion

#region Debug

if (keyboard_check_pressed(vk_left)) {
	var _string = "";
	
	for(var _y = 0; _y < (inventory_size / inventory_width); _y++) {
		for(var _x = 0; _x < inventory_width; _x++) {
			var _i = (_y * inventory_width) + _x;
			
			var _item = global.inventory[| _i];
			
			_string += string(_item[? "name"]) + " (" + string(_item[? "amount"]) + "/" + string(_item[? "max_amount"]) + ")\t\t\t\t\t\t";
		}
		
		_string += "\n";
	}
	
	show_debug_message(_string);
}

if (keyboard_check_pressed(vk_space)) {
	var _slot = get_integer("Slot to change with slot X", 0);
	var _slot_x = get_integer("Slot to change with slot " + string(_slot), 1);
	
	_slot = clamp(_slot, 0, inventory_size - 1);
	_slot_x = clamp(_slot_x, 0, inventory_size - 1);
	
	sc_SwapListSlots(global.inventory, _slot, global.inventory, _slot_x);
}

#endregion
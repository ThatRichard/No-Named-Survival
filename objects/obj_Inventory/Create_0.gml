#region Inventory init

var _amount = sc_InitItems();

enum Inv {
	Player
}

global.inventory = ds_list_create();
global.selected_slot = noone;
global.inventory_open = false;
global.mouse = ds_map_create();

sc_SetMapItem(global.mouse, 0);

inventory_size = 40;
inventory_width = 8;
inventory_gui_size = sprite_get_width(spr_InventorySlot);

if (floor(inventory_size / inventory_width) != ceil(inventory_size / inventory_width)) {
	show_debug_message("Warning: the inventory size is not correct!");	
}

for(var _y = 0; _y < (inventory_size / inventory_width); _y++) {
	for(var _x = 0; _x < inventory_width; _x++) {
		var _i = (_y * inventory_width) + _x;
		
		var _item = sc_SetItem(_i, choose(0, irandom_range(0, _amount)));
		_item[? "Inventory"] = Inv.Player; // To know in what inventory "group" the item is in
		
		if (_item[? "stackable"]) {
			_item[? "amount"] = irandom_range(1, _item[? "max_amount"]);	
		}
		
		/*if (!variable_instance_exists(id, "hotbar_starting_slot") && (_y == 0)) {
			hotbar_starting_slot = _i;
		}*/
	}
}

#endregion

#region Hotbar

global.hotbar_selected = 0;

#endregion

#region Animations

// Mouse
mouse_add = 0;
mouse_base_add = 45;

// Inventory
inventory_x = 0;
inventory_y = 250;
inventory_hidden = false;
inventory_base_x = inventory_x;
inventory_base_y = inventory_y;
inventory_alpha = 1;

// Inventory separators
separator_x = 0;
separator_base_x = separator_x;


// Setting up so nothing happens when loading up the game
inventory_x = -inventory_width * inventory_gui_size;
separator_x = -sprite_get_width(spr_InventorySeparator);


// Hotbar
hotbar_alpha = 0;
hotbar_dist = 110;
hotbar_base_dist = hotbar_dist;

last_hotbar_slot = global.hotbar_selected
hotbar_show_timer = 0;

#endregion
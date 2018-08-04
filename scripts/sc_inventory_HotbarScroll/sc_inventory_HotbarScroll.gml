if (mouse_wheel_up()) {
	global.hotbar_selected--;	
} else if (mouse_wheel_down()) {
	global.hotbar_selected++;
}

for(var _i = 0; _i < inventory_width; _i++) {
	if (keyboard_check(ord(string(_i + 1)))) {
		global.hotbar_selected = _i;
	}
}

if (global.hotbar_selected < 0) {
	global.hotbar_selected = inventory_width - 1;	
}

if (global.hotbar_selected == inventory_width) {
	global.hotbar_selected = 0;	
}
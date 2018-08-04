if (global.debug) {
	with(all) {
		if (point_in_rectangle(mouse_x, mouse_y, x - 32, y - 32, x + 32, y + 32)) {
			if (mouse_check_button_pressed(mb_left)) {
				global.cur_inspected = id;
			}
		}
	}

	if (global.cur_inspected != noone) {
		draw_set_color(c_yellow);	
	
		sc_OI_Inspect(global.cur_inspected);	
	}
}
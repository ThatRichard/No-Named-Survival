if (global.debug) {
	draw_set_halign(fa_right);	
	draw_set_color(c_white);
	draw_set_font(fnt_Main);
	draw_text(window_get_width(), 0, "Debug Mode");
	draw_set_halign(fa_left);	
}

if (global.pause) {
	var _w_w = window_get_width();
	var _w_h = window_get_height();
	
	draw_set_alpha(GUI_ALPHA);
	
	draw_set_color(c_black);
	draw_rectangle(0, 0, _w_w, _w_h, false);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_set_alpha(GUI_ALPHA / 2);
	
	draw_set_font(fnt_Pause);
	draw_set_color(c_white);
	draw_text(_w_w / 2, _w_h / 2, "PAUSED");
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);	
	
	draw_set_alpha(1);
}
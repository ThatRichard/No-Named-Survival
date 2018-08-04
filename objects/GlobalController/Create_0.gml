global_macro();

global.player_obj = noone;

global.debug = true;

global.pause = false;

global.mouse_gui_x = window_mouse_get_x();
global.mouse_gui_y = window_mouse_get_y();
global.mouse_in_gui = false;

randomize();

draw_set_font(fnt_Main);
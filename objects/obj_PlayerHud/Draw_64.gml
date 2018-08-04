if (global.pause) exit;

var _pl = global.player_obj;

if (_pl != noone) {
	// Energy
	draw_set_color(c_white);
	draw_rectangle(0, 0, 101, 12, true);
	draw_set_color(c_aqua);
	draw_rectangle(1, 1, 100 * (_pl.player_stat[pS.energy] / _pl.player_stat[pS.maxEnergy]), 11, false);
	
	// Heat
	draw_set_color(c_white);
	draw_rectangle(0, 15, 101, 15 + 12, true);
	draw_set_color(c_aqua);
	draw_rectangle(1, 16, 100 * (_pl.player_stat[pS.beamHeat] / _pl.player_stat[pS.maxBeamHeat]), 11 + 15, false);
}
// Beam charger
draw_sprite_ext(sprite_index, beam_charger_index, player_x, player_y, body_xscale, body_yscale, body_angle, beam_charger_color, image_alpha);

var _pdir = point_direction(x, y, mouse_x, mouse_y);
var _pdist = point_distance(x, y, mouse_x, mouse_y);

// Beam
if (player_state == pSt.Focus) { // Open
	beam_yscale = lerp(beam_yscale, random_range(0.6, 1), 0.1);
	beam_alpha = lerp(beam_alpha, random_range(0.6, 1), 0.4);
	
	var _anim_spd;
	if (beam_alpha < 0.6 || beam_yscale < 0.3) {
		_anim_spd = 0.01;
	} else {
		_anim_spd = 0.175;	
	}
	
	beam_xscale = lerp(beam_xscale, _pdist, _anim_spd);
} else { // Closed
	beam_yscale = lerp(beam_yscale, 0, 0.225);
	beam_alpha = lerp(beam_alpha, 0, 0.1);
	
	if (beam_yscale < 0.5) {
		beam_xscale = lerp(beam_xscale, 0, 0.2);
	}
}

beam_xscale = clamp(beam_xscale, 0, beam_range);

if (beam_range > 0) {
	var _xscale = random_range(0.5, 1);
	
	draw_sprite_ext(spr_PlayerBeam, 0, player_x, player_y, beam_xscale, beam_yscale, body_angle, c_white, beam_alpha);
	draw_sprite_ext(spr_PlayerBeam, 1, player_x + lengthdir_x(beam_xscale, body_angle), player_y + lengthdir_y(beam_xscale, body_angle), _xscale, beam_yscale, body_angle, c_white, beam_alpha);
}

// Beam "trapdoor"
draw_sprite_ext(sprite_index, beam_trapdoor_index, player_x, player_y, body_xscale * focus_trapdoor_xscale, body_yscale, body_angle, c_white, image_alpha);
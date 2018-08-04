var _leg_bonus_angle = 0;

if (player_state = pSt.Moving) {
	if (speed > move_speed) { // Sprinting
		var _anim_spd = 0.15;
	
		leg_dist = lerp(leg_dist, 28, _anim_spd);
		leg_add_angle = lerp(leg_add_angle, 47, _anim_spd);
	
		_leg_bonus_angle = irandom_range(-11, 11);
	} else if (speed >= PLAYER_NOT_MOVING_SPEED) { // Walking
		var _anim_spd = 0.1;
	
		leg_dist = lerp(leg_dist, 24, _anim_spd);
		leg_add_angle = lerp(leg_add_angle, 25, _anim_spd);
	
		_leg_bonus_angle = irandom_range(-7, 7);
	}
} else {
	if (time_not_moving < PLAYER_LEG_HIDE_TIME) { // Staying still
		var _anim_spd = 0.08;
	
		leg_dist = lerp(leg_dist, base_leg_dist, _anim_spd);
	} else {
		var _anim_spd = 0.04;
	
		leg_dist = lerp(leg_dist, base_leg_dist / 2, _anim_spd);
	}
	
	leg_add_angle = lerp(leg_add_angle, 0, _anim_spd);
}

var _l_leg_x = player_x + lengthdir_x(leg_dist, l_leg_angle + leg_add_angle);
var _r_leg_x = player_x + lengthdir_x(leg_dist, r_leg_angle - leg_add_angle);
var _r_leg_y = player_y + lengthdir_y(leg_dist, r_leg_angle - leg_add_angle);
var _l_leg_y = player_y + lengthdir_y(leg_dist, l_leg_angle + leg_add_angle);

var _l_leg_angle = full_direction + _leg_bonus_angle;
var _r_leg_angle = full_direction - _leg_bonus_angle;

// Thrusts
if (speed / max_speed != 0) {
	var _thrust_sprite = spr_PlayerThrust;
	var _thrust_spr_dist_leg = 6;
	
	var _l_thrust_x = _l_leg_x + lengthdir_x(-_thrust_spr_dist_leg, body_angle);
	var _r_thrust_x = _r_leg_x + lengthdir_x(-_thrust_spr_dist_leg, body_angle);
	var _l_thrust_y = _l_leg_y + lengthdir_y(-_thrust_spr_dist_leg, body_angle);
	var _r_thrust_y = _r_leg_y + lengthdir_y(-_thrust_spr_dist_leg, body_angle);
	
	var _xscale = speed / max_speed
	var _thrust_xscale = random_range(_xscale - 0.08, _xscale + 0.08);
	var _thrust_yscale = random_range(choose(0.5, 0.8), 1);

	var _l_leg_thrust_angle = full_direction;
	var _r_leg_thrust_angle = full_direction;

	_l_leg_thrust_angle = clamp(_l_leg_thrust_angle, body_angle - 45, body_angle + 45);
	_r_leg_thrust_angle = clamp(_r_leg_thrust_angle, body_angle - 45, body_angle + 45);

	// Left
	draw_sprite_ext(_thrust_sprite, 0, _l_thrust_x, _l_thrust_y, _thrust_xscale, _thrust_yscale, _l_leg_thrust_angle, c_white, image_alpha);

	// Right
	draw_sprite_ext(_thrust_sprite, 0, _r_thrust_x, _r_thrust_y, _thrust_xscale, _thrust_yscale, _r_leg_thrust_angle, c_white, image_alpha);
}

// Left
draw_sprite_ext(sprite_index, leg_index, _l_leg_x, _l_leg_y, body_xscale, body_yscale, _l_leg_angle, c_white, image_alpha);

// Right
draw_sprite_ext(sprite_index, leg_index, _r_leg_x, _r_leg_y, body_xscale, body_yscale, _r_leg_angle, c_white, image_alpha);

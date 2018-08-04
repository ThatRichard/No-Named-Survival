var _hand_pos_angle = body_angle + hand_pos_angle;
var _hand_bonus_angle = 0;

var _hand_x = player_x + lengthdir_x(hand_dist, _hand_pos_angle);
var _hand_y = player_y + lengthdir_y(hand_dist, _hand_pos_angle);

if (item_change_anim == AnimChange.done) {
	if (player_state == pSt.Moving) {
		if (speed > move_speed) { // Sprinting
			var _anim_spd = 0.12;
	
			_hand_bonus_angle = random_range(-1.25, 1.25);
	
			hand_pos_angle = lerp(hand_pos_angle, base_hand_pos_angle - 24, _anim_spd);
			hand_angle = lerp(hand_angle, body_angle - 105, _anim_spd);
			hand_dist = lerp(hand_dist, base_hand_dist - 3, _anim_spd);
		} else if (speed >= PLAYER_NOT_MOVING_SPEED) { // Walking
			var _anim_spd = 0.08;
	
			_hand_bonus_angle = random_range(-0.5, 0.5);
	
			hand_pos_angle = lerp(hand_pos_angle, base_hand_pos_angle - 15, _anim_spd);
			hand_angle = lerp(hand_angle, body_angle - 40, _anim_spd);
			hand_dist = lerp(hand_dist, base_hand_dist, _anim_spd);
		}
	} else { // Staying still
		var _anim_spd = 0.2;

		hand_pos_angle = lerp(hand_pos_angle, base_hand_pos_angle, _anim_spd);
		hand_angle = lerp(hand_angle, body_angle - 12, _anim_spd);
		hand_dist = lerp(hand_dist, base_hand_dist, _anim_spd);
	}
}

// Hand
var _hand_angle = hand_angle + _hand_bonus_angle;

#region Item

// Item
var _spr = (item_hand_saved_spr == noone)? item_hand_spr: item_hand_saved_spr;

if (_spr != noone) {
	var _item_angle = _hand_angle - 180;
	draw_sprite_ext(_spr, 0, _hand_x + lengthdir_x(5, _hand_angle), _hand_y + lengthdir_y(5, _hand_angle), item_scale, item_scale, _item_angle, c_white, image_alpha);
} 

#endregion

draw_sprite_ext(sprite_index, hand_index, _hand_x, _hand_y, body_xscale, body_yscale, _hand_angle, c_white, image_alpha);
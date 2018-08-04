#region Body

var _pd = direction;
var _ad = angle_difference(full_direction, direction);
full_direction -= min(abs(_ad), 100) * sign (_ad);

full_direction = clamp(full_direction, body_angle - 45, body_angle + 45);

// Mixed
if (time_not_moving < (PLAYER_LEG_HIDE_TIME / 5)) { // Moving
	var _rot_spd = 9;
	
	body_rot_spd = 0; // Reset the speed, to smooth it out!
	
	var _pd = direction;
	var _ad = angle_difference(body_angle, _pd);
	body_angle -= min(abs(_ad), _rot_spd) * sign(_ad);
	
	
	// Third eye
	var _shut_spd = 0.05;
	
	if (speed > move_speed) {// Sprinting
		third_eye_pos_angle = lerp(third_eye_pos_angle, third_eye_max_pos_angle + 10, _shut_spd);
		third_eye_dist = lerp(third_eye_dist, third_eye_max_dist - 5, _shut_spd);
	} else {
		third_eye_pos_angle = lerp(third_eye_pos_angle, third_eye_max_pos_angle, _shut_spd);
		third_eye_dist = lerp(third_eye_dist, third_eye_max_dist, _shut_spd);
	}
	
	if (third_eye_dist >= 0.8 * third_eye_max_dist || !third_eye_shut) {
		var _pd = point_direction(x, y, mouse_x, mouse_y);
		third_eye_angle += sin(degtorad(_pd - third_eye_angle)) * third_eye_angle_spd;
	
		third_eye_bonus_scale = lerp(third_eye_bonus_scale, third_eye_max_bonus_scale, 0.1);
		third_eye_blend = lerp(third_eye_blend, 195, 0.1);
		third_eye_shut = false;
	}
} else { // Not Moving
	body_rot_spd = lerp(body_rot_spd, body_rot_spd_max, 0.05);

	var _pd = point_direction(x, y, mouse_x, mouse_y);
	body_angle += sin(degtorad(_pd - body_angle)) * body_rot_spd;
	
	
	// Third eye
	var _shut_spd = 0.04;
	
	var _pd = body_angle + 90;
	var _ad = angle_difference(third_eye_angle, _pd);
	var _rot_move = min(abs(_ad), 4.25) * sign(_ad);
	third_eye_angle -= _rot_move;
	
	if (_rot_move <= 1.5 && _rot_move >= -1.5 || third_eye_shut) {
		third_eye_angle = body_angle + 90;
		
		third_eye_pos_angle = lerp(third_eye_pos_angle, third_eye_shut_pos_angle, _shut_spd);
		third_eye_dist = lerp(third_eye_dist, third_eye_shut_dist, _shut_spd);
		third_eye_shut = true;
	}
	
	third_eye_bonus_scale = lerp(third_eye_bonus_scale, 0, 0.1);
	third_eye_blend = lerp(third_eye_blend, 255 / 2, 0.1);
}


// Legs
l_leg_angle = body_angle + 90;
r_leg_angle = body_angle - 90;

// Focus

if (focus_open) {
	focus_trapdoor_xscale = lerp(focus_trapdoor_xscale, 0, 0.05);
} else {
	focus_trapdoor_xscale = lerp(focus_trapdoor_xscale, 1, 0.1);	
}

// Beam charger
beam_charger_heat_color_gb_rel = (beam_charger_heat_color_gb_max - beam_charger_heat_color_gb_min) * (player_stat[pS.beamHeat] / player_stat[pS.maxBeamHeat]);

beam_charger_color = make_color_rgb(255, 255 - beam_charger_heat_color_gb_rel, 255 - beam_charger_heat_color_gb_rel);

#endregion

#region Item changing

if (last_item_hand_spr != item_hand_spr) {
	item_hand_same_time = 0;
	
	if (item_change_anim == AnimChange.done) {
		item_change_anim = AnimChange.start;
	}
	
	item_hand_saved_spr = last_item_hand_spr;
} else {
	if (hand_shut || item_hand_same_time > 0) {
		item_hand_same_time += 1 / room_speed;
	}
	
	switch(item_change_anim) {
		case AnimChange.start: {
			var _shut_spd = 0.25;
			
			item_scale = lerp(item_scale, 0, 0.25);
			
			var _pd = body_angle - 90;
			var _ad = angle_difference(hand_angle, _pd);
			var _rot_move = min(abs(_ad), 4.25) * sign(_ad);
			hand_angle -= _rot_move;
	
			if (_rot_move <= 1.5 && _rot_move >= -1.5 || hand_shut) {
				hand_angle = body_angle - 90;
		
				hand_pos_angle = lerp(hand_pos_angle, hand_shut_pos_angle, _shut_spd);
				hand_dist = lerp(hand_dist, hand_shut_dist, _shut_spd);
				hand_shut = true;
			}
			
			if (item_hand_same_time >= PLAYER_ITEM_RETRACT_TIME) {
				item_change_anim = AnimChange.going_back;
			}
			break;
		}
		
		case AnimChange.going_back: {
			item_hand_saved_spr = noone;
			
			var _shut_spd = 0.25;
			
			item_scale = lerp(item_scale, 1, 0.25);
			
			hand_pos_angle = lerp(hand_pos_angle, hand_max_pos_angle, _shut_spd);
			hand_dist = lerp(hand_dist, hand_max_dist, _shut_spd);
	
			if (hand_dist >= 0.9 * hand_max_dist) {
				item_change_anim = AnimChange.done;
				
				hand_shut = false;
			}
			break;	
		}
	}
}

#endregion
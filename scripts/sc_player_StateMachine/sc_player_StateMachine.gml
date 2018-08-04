#region Beam

var _pdir = point_direction(x, y, mouse_x, mouse_y);
var _pdist = point_distance(x, y, mouse_x, mouse_y);

beam_active = mouse_check_button(mb_left) && (_pdist <= beam_range) && (focus_trapdoor_xscale < 0.5) && focus_open && (abs(angle_difference(body_angle, _pdir)) <= BEAM_ACTIVE_ANGLE);
	
if (player_state != pSt.Focus) {
	player_stat[pS.beamHeat] -= 10 / PLAYER_BEAM_UNHEAT_TIME;	
	
	if (player_stat[pS.beamHeat] <= 0) {
		can_focus = true;	
	}
}
	
#endregion

if (speed > PLAYER_NOT_MOVING_SPEED) {
	player_state = pSt.Moving;
} else {
	if (beam_active && can_focus) {
		player_state = pSt.Focus;	
		player_stat[pS.beamHeat] += 10 / PLAYER_BEAM_HEAT_TIME;
		
		if (player_stat[pS.beamHeat] >= player_stat[pS.maxBeamHeat]) {
			can_focus = false;	
		}
	} else {
		player_state = pSt.Idle;	
	}
}

player_stat[pS.beamHeat] = clamp(player_stat[pS.beamHeat], 0, player_stat[pS.maxBeamHeat]);
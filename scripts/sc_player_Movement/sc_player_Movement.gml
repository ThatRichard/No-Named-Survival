var _sprint_energy_cost_pt = 0.036; //Energy cost while sprinting, per tick

var _left = ord("A");
var _right = ord("D");
var _up = ord("W");
var _down = ord("S");

var _sprint = keyboard_check(vk_lshift);

var _left_hold = keyboard_check(_left);
var _right_hold = keyboard_check(_right);
var _up_hold = keyboard_check(_up);
var _down_hold = keyboard_check(_down);

var _left_released = keyboard_check_released(_left);
var _right_released = keyboard_check_released(_right);
var _up_released = keyboard_check_released(_up);
var _down_released = keyboard_check_released(_down);

var _horizontal = _right_hold - _left_hold; // +1 = right, -1 = left
var _vertical = _down_hold - _up_hold; // +1 = down, -1 = up


var _none = (!_right_hold && !_left_hold && !_up_hold && !_down_hold) || (_horizontal == 0 && _vertical == 0);
var _any = _right_hold || _left_hold || _up_hold || _down_hold;


var _max_speed = max_speed;

if (_sprint && can_sprint) {
	_max_speed = move_speed * 1.85;
	
	if (player_state == pSt.Moving) {
		player_stat[pS.energy] -= _sprint_energy_cost_pt;	
		
		if (player_stat[pS.energy] <= 0) {
			can_sprint = false;	
		}
	}
} else {
	_max_speed = move_speed;
	
	if (player_stat[pS.energy] == player_stat[pS.maxEnergy]) {
		can_sprint = true;	
	} else {
		player_stat[pS.energy] = lerp(player_stat[pS.energy], player_stat[pS.maxEnergy], 0.01);
		
		if (player_stat[pS.energy] > (0.65 * player_stat[pS.maxEnergy])) {
			player_stat[pS.energy] = lerp(player_stat[pS.energy], player_stat[pS.maxEnergy], 0.025);
			
			if (player_stat[pS.energy] > (0.99 * player_stat[pS.maxEnergy])) {
				player_stat[pS.energy] = player_stat[pS.maxEnergy];
			}
		}
	}
}

var _move_divider = 4;

if (_any && remaining_speed != 0) {
	motion_add(remaining_direction, remaining_speed);
	
	remaining_direction = 0;
	remaining_speed = 0;
}


if (_horizontal == -1) {
	motion_add(180, move_speed / _move_divider);	
}

if (_horizontal == 1) {
	motion_add(0, move_speed / _move_divider);
}

if (_vertical == -1) {
	motion_add(90, move_speed / _move_divider);
}

if (_vertical == 1) {
	motion_add(-90, move_speed / _move_divider);
}

speed = clamp(speed, -_max_speed / 2, _max_speed);

if (_none) {
	if (_left_released || _right_released || _up_released || _down_released) {
		remaining_speed = 1;
		remaining_direction = direction;
	}
	
	speed = lerp(speed, 0, 0.45);
}

if (player_state != pSt.Moving) {
	time_not_moving++;
} else time_not_moving = 0;

// Update the information of where the player is
player_x = round(x);
player_y = round(y);
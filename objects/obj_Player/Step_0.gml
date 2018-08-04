if (global.pause) exit;

sc_player_Movement();

sc_player_Animations();

sc_player_Camera();

sc_player_StateMachine();

if (keyboard_check_pressed(ord("F"))) focus_open = !focus_open;
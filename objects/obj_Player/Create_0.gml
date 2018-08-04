player_macro() // temporary

#region Global setup

global.player_obj = id;

instance_create_layer(0, 0, "Player_Hud", obj_PlayerHud);
instance_create_layer(0, 0, "Inventory", obj_Inventory);

#endregion

#region Animations

full_direction = 0; // Here for the direction to not be 360 only!

#region Body

// Focus
focus_trapdoor_xscale = 1;
focus_open = false;

beam_alpha = 0;
beam_active = false;
beam_xscale = 0;
beam_yscale = 1;
beam_range = BLOCK_SIZE * 4;

can_focus = true;


beam_charger_heat_color_gb_min = 70;
beam_charger_heat_color_gb_max = 255;

beam_charger_heat_color_gb_rel = 0;

beam_charger_color = make_color_rgb(255, 255 - beam_charger_heat_color_gb_rel, 255 - beam_charger_heat_color_gb_rel);

// Rotations
body_rot_spd = 14;
body_rot_spd_max = body_rot_spd;

image_speed = 0;

time_not_moving = 10000;

body_angle = 0;
body_xscale = 1;
body_yscale = 1;


// Image indexes
body_index = 0;
beam_trapdoor_index = 1;
beam_charger_index = 2;
leg_index = 3;
third_eye_index = 4;
hand_index = 5;


// Legs
l_leg_angle = body_angle + 90;
r_leg_angle = body_angle - 90;
leg_add_angle = 0;
leg_dist = 19;
base_leg_dist = leg_dist;


// Third eye
third_eye_angle = body_angle;
third_eye_angle_spd = 14;

third_eye_pos_angle = 63; // Has to do with the lengthdir position
third_eye_max_pos_angle = third_eye_pos_angle;
third_eye_shut_pos_angle = 38;
third_eye_dist = 34; // Has to do with the lengthdir position
third_eye_max_dist = third_eye_dist;
third_eye_shut_dist = 17;

third_eye_bonus_scale = 0.4;
third_eye_max_bonus_scale = third_eye_bonus_scale;
third_eye_blend = 0;
third_eye_shut = true;


// Hand
hand_dist = 34;
base_hand_dist = hand_dist;

hand_pos_angle = -62;
base_hand_pos_angle = hand_pos_angle;

// Used for item change
hand_max_pos_angle = hand_pos_angle;
hand_shut_pos_angle = -38;
hand_max_dist = hand_dist;
hand_shut_dist = 17;

hand_angle = body_angle;
hand_shut = false;


#endregion

#region Item in hand

enum AnimChange {
	start,
	going_back,
	done
}

item_hand_same_time = PLAYER_ITEM_RETRACT_TIME;

item_hand_spr = noone;
last_item_hand_spr = noone;
item_change_anim = AnimChange.done;
item_hand_saved_spr = noone;

item_scale = 0;

#endregion

#endregion

#region Movement

player_x = round(x);
player_y = round(y);

remaining_speed = 1;
remaining_direction = 0;

direction = remaining_direction;

#endregion

#region Customization

player_name = "No Named Player";

#endregion

#region Player stats

enum pS {
	HP, maxHP, energy, maxEnergy, beamHeat, maxBeamHeat
}

player_stat[pS.HP] = 10;
player_stat[pS.energy] = 10;

player_stat[pS.maxHP] = player_stat[pS.HP];
player_stat[pS.maxEnergy] = player_stat[pS.energy];
player_stat[pS.beamHeat] = 0;
player_stat[pS.maxBeamHeat] = 10;

can_sprint = true;

#endregion

#region Camera

camera_destroy(CAM);
CAM = camera_create();
window_set_size(room_width, room_height);
camera_set_view_size(CAM, room_width / 2, room_height / 2);
display_set_gui_size(room_width, room_height);
view_set_visible(0, true);

#endregion

#region Player state machine

enum pSt {
	Idle,
	Moving,
	Focus,
	Mining
}

player_state = pSt.Idle;

#endregion

#region Object Inspector

var _states_array = ["Idle", "Moving", "Focus", "Mining"];

if (sc_OI_DefineBegin(object_index)) {
	sc_OI_Add("speed", VarTypes.Float);
	sc_OI_Add("body_angle", VarTypes.Float);
	sc_OI_Add("player_state", VarTypes.Enum, _states_array);
	
	sc_OI_DefineEnd();
}

#endregion
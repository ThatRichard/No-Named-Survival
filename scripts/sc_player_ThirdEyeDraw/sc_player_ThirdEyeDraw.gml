var _third_eye_angle = body_angle + third_eye_pos_angle;

var _third_eye_x = player_x + lengthdir_x(third_eye_dist, _third_eye_angle);
var _third_eye_y = player_y + lengthdir_y(third_eye_dist, _third_eye_angle);

var _third_eye_blend = make_colour_rgb(third_eye_blend, third_eye_blend, third_eye_blend);

draw_sprite_ext(sprite_index, third_eye_index, _third_eye_x, _third_eye_y, body_xscale + third_eye_bonus_scale, body_yscale + third_eye_bonus_scale, third_eye_angle, _third_eye_blend, image_alpha);

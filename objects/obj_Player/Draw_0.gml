#region Player appearance

// Third eye SHUT (BELOW)
if (third_eye_shut) {
	sc_player_ThirdEyeDraw();
}


// Legs
sc_player_LegDraw();


// Hand
sc_player_HandDraw();


// Beam
sc_player_BeamDraw();


// Body
draw_sprite_ext(sprite_index, body_index, player_x, player_y, body_xscale, body_yscale, body_angle, c_white, image_alpha);


// Third eye NOT SHUT (ABOVE)
if (!third_eye_shut) {
	sc_player_ThirdEyeDraw();
}

#endregion
/// @description do stuff
sprite_index = s_textbox;
if (instance_exists(o_detonate_bombs)) {
	if (place_meeting(x, y, o_player)) {
		o_detonate_bombs.visible = true;
		audio_play_sound(snd_car, 1, 0);
		instance_destroy();
	}
}
/// @description freezing the game
game_set_speed(60, gamespeed_fps);
window_set_fullscreen(true);

if (freeze_mode) {
	if (keyboard_check_pressed(vk_enter)) {
		freeze_mode = false;	
	}
	with (o_player) {
		move_counter = 0;
		ROF = 0;
	}
	
	with (o_enemies) {
		ROF = 0;
		attention_counter = 0;
		image_index = 0;
		walk_cooldown = 0;
	}

}
// quit the game
if (keyboard_check(vk_escape)) {
	o_settings.end_the_game = true;
}
camera_shake_count ++;
if (camera_shake_count >= 5) {
	actualshakex = random_range(-global.scrshake, global.scrshake);
	actualshakey = random_range(-global.scrshake, global.scrshake);
	camera_set_view_pos(view_camera[0], actualshakex, actualshakey);
	camera_shake_count = 0;
}
// scrshake
global.scrshake *= 0.9;

backgroundeffects[backgroundeffectindex]();


if (background_rise < 1) {
	audio_sound_gain(background_music, background_rise, 0);
	background_rise += 0.05;
}
if (o_settings.PLAY_MUSIC == false) {
	audio_stop_sound(background_rise);	
}

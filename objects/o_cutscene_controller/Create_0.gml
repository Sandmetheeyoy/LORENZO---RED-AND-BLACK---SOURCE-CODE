/// @description initialize
yscreen = 0;
blackbox_alpha = 1;
alpha_inc = -0.03;
switchroom = false;
if (play_music && o_settings.PLAY_MUSIC) {
	audio_stop_all();
	o_settings.current_music = audio_play_sound(soundtrack, 0, true);
}
chapter_name_running = "";
chapter_name_run_counter = 0;
chapter_name_index = 1;
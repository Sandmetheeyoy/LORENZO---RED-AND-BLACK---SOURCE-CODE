/// @description scroll up
game_set_speed(60, gamespeed_fps);
blackbox_alpha = clamp(blackbox_alpha + alpha_inc, 0, 1);

if (keyboard_check_pressed(vk_escape)) {
	game_end();	
}
// skip
if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_tab)) {
	if (room != r_ending_1) {
		switchroom = true;
	} else {
		room_goto(r_menu);	
	}
}
if (switchroom) {
	alpha_inc = 0.03;
	if (blackbox_alpha >= 1) {
		room_goto_next();	
	}
}

if (string_length(chapter_name_running) < string_length(chapter_name)) {
	chapter_name_run_counter ++;
	if (chapter_name_run_counter >= 5) {
		chapter_name_running = chapter_name_running + string_char_at(chapter_name, chapter_name_index);//chapter_name[chapter_name_index];
		chapter_name_run_counter = 0;
		chapter_name_index ++;
	}
}
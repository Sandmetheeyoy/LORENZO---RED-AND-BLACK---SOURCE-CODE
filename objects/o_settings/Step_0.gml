/// @description selecting which things to do

if (room == r_settings) {
	switch(selection_index) {
		case 0:
			if (keyboard_check(vk_enter)) {
				AUDIO_MASTERING += mastering_dir;
			}
			if (keyboard_check_pressed(vk_enter)) {
				mastering_dir = -mastering_dir;	
			}
			AUDIO_MASTERING = clamp(AUDIO_MASTERING, 0, 1);
			highlight[selection_index] = 1;
		break;
		
		case 1:
			if (keyboard_check_pressed(vk_enter)) {
				PLAY_MUSIC = !PLAY_MUSIC;
			}
			highlight[selection_index] = 1;
		break;
		
		case 2:
			if (keyboard_check_pressed(vk_enter)) {
				CHARACTER_SPEAKNOISE_TOGGLE = !CHARACTER_SPEAKNOISE_TOGGLE;
			}
			highlight[selection_index] = 1;
		break;
	}
} else {
	audio_master_gain(AUDIO_MASTERING);	
	if (PLAY_MUSIC == false) {
		audio_stop_sound(current_music);
	}
}

if (room != r_settings && room != r_menu) {
	room_at = room;
}
if (room == r_menu) {
	o_menu.room_save = room_get_to;	
}

if (keyboard_check_pressed(vk_f5)) { // saving the game
	if (room_at == r_menu || room_at == r_settings) {
		save_message = "CANNOT SAVE GAME HERE";
		save_message_alpha = 1;
	} else {
		var _savedata = {
			audio_master_volume: AUDIO_MASTERING,
			speaknoise: CHARACTER_SPEAKNOISE_TOGGLE,
			musicplay: PLAY_MUSIC,
			level: room_at
		}
		var _json_format = json_stringify(_savedata);
		var _file = file_text_open_write("lorenzo_save.txt");
		file_text_write_string(_file, _json_format);
		file_text_close(_file);
		save_message_alpha = 1;
		save_message = "SAVED GAME";
	}
}

if (keyboard_check_pressed(ord("P"))) {
	if (room != r_settings) {
		room_goto(r_settings);
	} else {
		room_goto(room_at);	
	}
}

if (keyboard_check_pressed(ord("O"))) {
	if (room != r_menu)	{
		room_goto(r_menu);
	} else {
		room_goto(room_at);
	}
}

if (keyboard_check_pressed(vk_down)) {
	highlight = [0.4, 0.4, 0.4];
	if (selection_index == 2) {
		selection_index = 0;	
	} else {
		selection_index ++;	
	}
} else if (keyboard_check_pressed(vk_up)) {
	highlight = [0.4, 0.4, 0.4];
	if (selection_index == 0) {
		selection_index = 2;	
	} else {
		selection_index--;	
	}
}

if (end_the_game == true) {
	game_end();
}	
if (room == r_ending_1) {
	ending_reached = true;	
}

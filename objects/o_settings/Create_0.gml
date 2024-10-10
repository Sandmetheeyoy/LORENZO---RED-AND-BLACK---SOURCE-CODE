/// @description all menu stuff
mastering_dir = 0.05;
AUDIO_MASTERING = 1;
CHARACTER_SPEAKNOISE_TOGGLE = true;
PLAY_MUSIC = true;
selection_index = 0;
highlight = [0.4, 0.4, 0.4];
room_at = room;

current_music = 0;
end_the_game = false;


// starting the game
if (file_exists("lorenzo_save.txt.")) {
	var _file = file_text_open_read("lorenzo_save.txt");
	var _json = file_text_read_string(_file);
	var _struct = json_parse(_json);
	AUDIO_MASTERING = _struct.audio_master_volume;
	CHARACTER_SPEAKNOISE_TOGGLE = _struct.speaknoise;
	PLAY_MUSIC = _struct.musicplay;
	o_menu.room_save = _struct.level;
	file_text_close(_file);
}
room_get_to = o_menu.room_save;
save_message = "GAME SAVED";
save_message_alpha = 0;

ending_reached = false;

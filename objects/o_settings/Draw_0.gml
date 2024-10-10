/// @description drawing stuff
var customFont = font_add_sprite_ext(s_custom_font, ":.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!-", false, 4);
draw_set_font(customFont);
if (room == r_settings) {
	draw_text_transformed_color(64, 64, "MASTER VOLUME: " + string(AUDIO_MASTERING), 2, 2, 0, c_white, c_white, c_white, c_white, highlight[0]);
	var music_icon = "X";
	if (!PLAY_MUSIC) music_icon = " ";
	draw_text_transformed_color(64, 128, "PLAY MUSIC: " + music_icon, 2, 2, 0, c_white, c_white, c_white, c_white, highlight[1]);
	var speaknoise = "X";
	if (!CHARACTER_SPEAKNOISE_TOGGLE) speaknoise = " ";
	draw_text_transformed_color(64, 192, "SPEAK NOISE: " + speaknoise, 2, 2, 0, c_white, c_white, c_white, c_white, highlight[2]);
}



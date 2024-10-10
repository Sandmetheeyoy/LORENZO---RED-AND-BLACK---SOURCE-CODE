/// @description drawing on screen

var xx = display_get_width()/2;
var yy = display_get_height()/2;

var customFont = font_add_sprite_ext(s_custom_font, ":.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!-", false, 4);

if (point_distance(x, y, mouse_x, mouse_y) < abs(8*image_xscale) && array_length(texts) >= 2) {	
	show_text_x = lerp(show_text_x, xx, 0.05);
	show_text_y = lerp(show_text_y, yy, 0.05);
	text_scale = lerp(text_scale, 2, 0.05);
	draw_set_font(customFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(show_text_x, show_text_y, speech_show, text_scale, text_scale, 0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	if (mouse_check_button_pressed(mb_right)) {
		if (speech_index < array_length(texts)-stop_index) {
			speech_counter = 1;
			speech_show = "";
			speech_index++;
			speech_character_index = 1;
		} else {
			after_dialogue[post_dialogue_action]();	
		}
	}
} else {
	show_text_x = display_mouse_get_x();
	show_text_y = display_mouse_get_y();
	text_scale = 0;
}


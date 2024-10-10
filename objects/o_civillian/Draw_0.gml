/// @description drawing

draw_sprite_ext(body_sprite, image_index, x-2, y+1, 1, 1, 0, c_black, 0.5); // reusing the image index for convenience
draw_sprite_ext(leg_sprite, 0, x-2, y+1, 1, 1, 0, c_black, 0.5);


draw_sprite_ext(body_sprite, image_index, x, y, _xscale, 1, 0, c_white, 1); // reusing the image index for convenience
draw_sprite_ext(leg_sprite, 0, x, y, _xscale, 1, 0, c_white, 1);

if (array_length(texts) >= 2) {
	if (speech_index < array_length(texts)-1) {
		dialog_indicator += 0.2;
		if (dialog_indicator > 360) {
			dialog_indicator = 0;	
		}
		draw_rectangle_color(x-0.5
		, y-13-sin(dialog_indicator)*4
		, x+0.5
		, y-12-sin(dialog_indicator)*4
		, c_orange, c_orange, c_orange, c_orange, false);
		//show_message("OEERHHHHH");
	}
}
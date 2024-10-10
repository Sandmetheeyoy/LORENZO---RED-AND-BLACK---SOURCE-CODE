/// @description drawing the gun

for (var i=0; i<image_number; i++) {
	if (i <= 3) {
		draw_sprite_ext(sprite_index, i, x, y-i, 1.25, 1.25, legs_dir, c_white, 1);
	} else {
		draw_sprite_ext(sprite_index, i, x, y-i, 1.25, 1.25, image_angle, c_white, 1);	
	}
}
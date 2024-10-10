/// @description drawing shit

for (var i=0; i<image_number; i++) {
	var blend_color = make_color_rgb((i/image_number) * 255, (i/image_number)*255, (i/image_number)*255);
	draw_sprite_ext(sprite_index, i, x, y-i+10, 1.25, 1.5, rand_facedir, blend_color, 1);	
}
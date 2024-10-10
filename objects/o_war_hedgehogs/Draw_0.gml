/// @description drawing the hedgehog

for (var i=0; i<image_number; i++) {
	draw_sprite_ext(sprite_index, i, x, y-i, 1, 1, image_angle, c_dkgray, 1);	
}

if (y < o_player.y) {
	depth = o_player.depth-1;	
} else {
	depth = o_player.depth+1;
}
/// @description draw shadow
if (sprite_index != noone) {
	draw_sprite_ext(gun_all_sprites[gun_index], image_index, x-2, y+1, 0.35, 0.35, 0, c_black, 0.5);
	draw_self();
}
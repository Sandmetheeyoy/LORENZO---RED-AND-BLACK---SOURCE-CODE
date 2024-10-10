/// @description drawing the damn guy
var gun_image = round(direction/45);
draw_sprite(leg_sprite, image_index, x, y); // reusing the image index for convenience

if (useAnimation) {
	draw_sprite_ext(body_sprite, animationFrames, x-2, y+1, 1, 1, 0, c_black, 0.5);
	draw_sprite(body_sprite, animationFrames, x, y);
	prevFrame = animationFrames;
	animationFrames += frameSpeed;
	actionsDuringAnimation[actionDuringAnimIndex]();
} else {
	draw_sprite_ext(body_sprite, gun_image, x-2, y+1, 1, 1, 0, c_black, 0.5);
	draw_sprite_ext(body_sprite, gun_image, x, y, image_xscale, 1, 0, c_white, 1);
}

draw_sprite_ext(leg_sprite, image_index, x-2, y+1, 1, 1, 0, c_black, 0.5);

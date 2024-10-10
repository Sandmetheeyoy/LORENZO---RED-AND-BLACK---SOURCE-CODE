/// @description using it
if (used) {
	if (by_whom == o_player) {
		if (ROF >= ROF_END && mouse_check_button(mb_right)) {
			var dir = image_angle;
			var bullet = instance_create_layer(x+dcos(dir)*16, y-dsin(dir)*16-8, "Instances", o_bullet_player);
			bullet.direction = dir + random_range(-6, 6);
			bullet.damage = 16; // damage
			instance_create_layer(x+dcos(dir)*16, y-dsin(dir)*16-8, "Instances", o_muzzleflash);
			var shootsnd = audio_play_sound(snd_shoot_pistol, 0, false);
			audio_sound_gain(shootsnd, 0.2, 0); // get to 0.2 by 0ms
			global.scrshake = 1;
			ROF = 0;
		}
		if (!o_mission_controller.freeze_mode) {
			update_counter ++;
			if (update_counter >= 5) {
				image_angle = point_direction(x, y, mouse_x, mouse_y);
				update_counter = 0;
			}
			ROF++;
		}
	}
	image_angle = clamp(image_angle, init_angle-limited_diameter, init_angle+limited_diameter);
	o_player.x = xprevious-dcos(player_snap_dir)*16;
	o_player.y = yprevious+dsin(player_snap_dir)*16;
}

if (y > o_player.y) {
	depth = o_player.depth-1;	
} else {
	depth = o_player.depth+1;
}
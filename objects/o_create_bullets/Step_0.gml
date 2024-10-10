/// @description firing

if (!collision_line(x, y, o_player.x, o_player.y, o_collision, 0, 0)) {
	attention = 3 * 60;
	dir = lerp(dir, point_direction(x, y, o_player.x, o_player.y), 0.05);
}
attention = max(attention - 1, 0);

if (attention > 0) {
	ROF ++;
	if (ROF >= 4) {
		var bullet = instance_create_layer(x, y, "Instances", o_bullet_enemy);
		instance_create_layer(x, y-16, "Instances", o_muzzleflash);
		bullet.direction = dir + random_range(-inacc, inacc);
		bullet.damage = damage;
		ROF = 0;
		global.scrshake = 3;
		var sound = audio_play_sound(snd_gun_car, 0, 0);
		audio_sound_gain(sound, 0.2, 0);
	}	
	if (collision_line(x, y, o_player.x, o_player.y, o_collision, 0, 0)) {
		inacc = min(inacc+0.05, 20);	
	}
	inacc = max(inacc - 0.01, 0);
}
/// @description doing stuff

attention_counter++;
if (attention_counter >= attention_span-alert_mode && lose_player <= 1) {
	if (!look_in_one_dir) direction += choose(-45, 45); 
	if (!collision_line(x, y, o_player.x, o_player.y, o_collision, 0, 1) && (x > 0 && x < room_width && y > 0 && y < room_height)) {
		if (o_player.healthpoints > 0) {
			found_player = true;
		}
	}
	
	// if there is something at the corner, then turn directions
	if (position_meeting(x+dcos(direction+90)*12, y-dsin(direction+90)*12, o_collision)) {
		turn_dir = -abs(turn_dir);	
	} else if (position_meeting(x+dcos(direction-90)*12, y-dsin(direction-90)*12, o_collision)) {
		turn_dir = abs(turn_dir);	
	}
	attention_counter = 0;	
}

if (o_player.healthpoints <= 0) {
	lose_player = -1;
}
if (position_meeting(x+dcos(direction)*12, y-dsin(direction)*12, o_collision)) {
		direction += turn_dir;	
}

// MOVEMENT
walk_cooldown ++;
if (walk_cooldown >= 5 && can_walk) { // funny walking animation
	if (!place_meeting(x+dcos(direction)*8, y-dsin(direction)*8, o_collision) && !stationary) {
		x += dcos(direction)*(4+(lose_player>1)*2);
		y -= dsin(direction)*(4+(lose_player>1)*2);
		image_index = !image_index;
	} else {
		image_index = 2;	
	}
	walk_cooldown = 0;
}
alert_mode = max(alert_mode - 0.25, 0)
lose_player = max(lose_player - 1, 0);
if (found_player) {
	lose_player = 5 * 60; // what time do you start to lose the player
	ROF = slow_to_react*(-30)+25; // if the enemy is slow to react, this allows the players to get them
	findsoundsource = false;
	//instance_create_layer(x, y, "Instances", o_enemy_alerted);
	found_player = false;
}


if (lose_player > 1) { // shit hits the fan
	if (lose_player == 299 && !silent) { // alert sound
		var sound_alert = choose(//snd_enemy_attack_one
								snd_enemy_attack_two
								, snd_enemy_attack_three
								, snd_enemy_attack_four
								, snd_enemy_attack_five
								, snd_enemy_attack_six
								, snd_enemy_attack_seven);
		audio_scream = audio_play_sound(sound_alert, 1, false);
		audio_sound_gain(audio_scream, 0.15, 0);
	} else if (lose_player == 2) {
		ROF = 0;
	}
	ROF ++;
	// if you see the player, you keep looking at him
	if (!collision_line(x, y, o_player.x, o_player.y, o_collision, false, 1)) {
		direction = point_direction(x, y, o_player.x, o_player.y);//round(point_direction(x, y, o_player.x, o_player.y)/45)*45; // keep looking at the player
	} else {
		ROF = gun_ROF[gun_index]-1;
	}
	// shooting
	if (ROF >= gun_ROF[gun_index] && can_shoot) {
		repeat(gun_pellets[gun_index]) {
			var dir = direction + random_range(-gun_inacc[gun_index], gun_inacc[gun_index]);
			var bullet = instance_create_layer(x+dcos(dir)*12, y-dsin(dir)*12, "Instances", o_bullet_enemy);
			bullet.direction = dir;
			bullet.damage = gun_damage[gun_index];
			instance_create_layer(x+dcos(dir)*10, y-dsin(dir)*10, "Instances", o_muzzleflash);
		}
		if (instance_exists(o_enemies)) { // if gunshots are heard, then enemies will come 
			with(o_enemies) {
				alert_mode = 48;
				stationary = false;
				look_in_one_dir = false;
			}	
		}
		global.scrshake = gun_shake[gun_index];
		var gunsound = audio_play_sound(gun_sound[gun_index], 1, false);
		audio_sound_gain(gunsound, 0.2, 0);
		gun_ammo[gun_index] --;
		if (gun_ammo[gun_index] <= 0) {
			gun_ammo[gun_index] = gun_ammo_standard[gun_index];	
		}
		ROF = 0;
	}
}

// death
if (healthpoints <= 0) {
	var corpse = instance_create_layer(x, y, "Instances", o_enemy_corpse); // giving the enemy corpse stats to loot
	corpse.image_index = enemykind;
	var gun_drop = instance_create_layer(x, y, "Instances", o_gun_pickup);
	gun_drop.ammo = gun_ammo[gun_index];
	gun_drop.gun_index = gun_index;
	o_player.kills ++;
	audio_stop_sound(audio_scream); // stopped screaming
	var deathsound = audio_play_sound(snd_death, 0, false);
	audio_sound_gain(deathsound, 0.2, 0);
	instance_destroy();	
}


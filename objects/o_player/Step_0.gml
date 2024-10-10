/// @description movement
mouse_UI_index = 0; // because it is the start, so any other modifications would not be necessary
move_y = keyboard_check(down) - keyboard_check(up);
move_x = keyboard_check(right) - keyboard_check(left);
var change_dir = (keyboard_check_pressed(aim_left) - keyboard_check_pressed(aim_right));

//camera_set_view_size(view_camera[0], 256, 128);
if (!o_mission_controller.freeze_mode) {
	//direction += (keyboard_check_pressed(aim_left) - keyboard_check_pressed(aim_right)) * 45;
	direction = point_direction(x, y, mouse_x, mouse_y);
}
if (move_counter >= 5 && can_walk) {
	if (!place_meeting(x+move_x*4, y, o_collision)) {
		x += move_x*4*!movable;
	} else {
		while (!place_meeting(x+sign(move_x*4), y, o_collision)) {
			x += sign(move_x);	
		}
		move_x = 0;
	}
	
	if (!place_meeting(x, y+move_y*4, o_collision)) {
		y += move_y*4*!movable;
	} else {
		while (!place_meeting(x, y+sign(move_y*4), o_collision)) {
			y += sign(move_y);	
		}
		move_y = 0;
	}
	if (move_y != 0 or move_x != 0) {
		image_index = !image_index;
		playwalksound++;
		if (playwalksound > 2) {
			var walksnd = audio_play_sound(walksound, 1, false);
			audio_sound_gain(walksound, walksound_gain, 0);
			playwalksound = 0;	
		}
	} else {
		image_index = 2;	
	}
	move_counter = 0;
	
	// basically the counter for the entire game
}
move_counter++;
		
ROF ++;

var shooting_style = mouse_check_button(shoot);
if (gun_index == 0) {
	shooting_style = mouse_check_button_pressed(shoot);
}	

if (ROF >= gun_ROF[gun_index] && shooting_style && gun_ammo[gun_index] > 0 && !mounted && can_shoot) {
	repeat(gun_pellets[gun_index]) {
		var dir = direction + random_range(-gun_inacc[gun_index], gun_inacc[gun_index]);
		var bullet = instance_create_layer(x+dcos(dir)*12, y-dsin(dir)*12, "Instances", o_bullet_player);
		bullet.direction = dir;
		bullet.damage = gun_damage[gun_index];
		instance_create_layer(x+dcos(dir)*12, y-dsin(dir)*12, "Instances", o_muzzleflash);
		
	}
	global.scrshake = gun_shake[gun_index];
	if (instance_exists(o_enemies)) {
		with(o_enemies) {
			alert_mode = 48;
			findsoundsource = true;
			xfind = other.x;
			yfind = other.y;
			stationary = false;
			look_in_one_dir = false;
			prev_dir = direction;
			direction = round(point_direction(x, y, o_player.x, o_player.y)/45)*45;
		}
	}
	gun_ammo[gun_index]--; // deleting ammo
	var gunsound = audio_play_sound(gun_sound[gun_index], 1, false);
	audio_sound_gain(gunsound, 0.2, 0);
	if (gun_ammo[gun_index] < 1) {
		gun_index = 0;
	}
	ROF = 0;
}


// looting enemy
if (place_meeting(mouse_x, mouse_y, o_gun_pickup)) {
	var gun_pickup = instance_place(mouse_x, mouse_y, o_gun_pickup);
	mouse_UI_index = 4;
	if (point_distance(x, y, gun_pickup.x, gun_pickup.y) < 16 && mouse_check_button_pressed(mb_right)) {
		if (gun_index != 0) {
			var gun_pick = instance_create_layer(x, y, "Instances", o_gun_pickup);
			gun_pick.gun_index = gun_index;
			gun_pick.ammo = gun_ammo[gun_index];
			gun_ammo[gun_index] = 0;
		}
		gun_index = gun_pickup.gun_index;
		gun_ammo[gun_index] = gun_pickup.ammo;
		instance_destroy(gun_pickup);
	}
}

// checking texts
/*if (position_meeting(mouse_x, mouse_y, o_text)) {
	mouse_UI_index = 1;
	if (mouse_check_button_pressed(mb_right)) {
		var text = instance_position(mouse_x, mouse_y, o_text);	
		if (point_distance(x, y, text.x, text.y) < 32) { 
			text_to_show = text.the_text;
			UI_USED = true;
			var picksound = audio_play_sound(snd_pickup_note, 0, false);
			audio_sound_gain(picksound, 0.2, 0);
			instance_destroy(text);
		}
	}
}*/

// eavesdropping on actors
if (position_meeting(mouse_x, mouse_y, o_actor)) {
	mouse_UI_index = 2;
	var actor_hear = instance_position(mouse_x, mouse_y, o_actor);
	if (mouse_check_button_pressed(mb_right)) {
		if (actor_hear.use_speech) {
			text_to_show = actor_hear.speech;
			UI_USED = true;
			actor_hear.speech_destroy = true;
		}	
	}
}

if (instance_exists(o_civillian)) {
	var nearest_civillian = instance_nearest(mouse_x, mouse_y, o_civillian);
	if (point_distance(mouse_x, mouse_y, nearest_civillian.x, nearest_civillian.y) < nearest_civillian.image_xscale*8) {
		mouse_UI_index = 2;
	}
}
/*if (position_meeting(mouse_x, mouse_y, o_detonate_bombs)) {
	mouse_UI_index = 3;	
}*/
// using machineguns
if (position_meeting(mouse_x, mouse_y, o_machinegun_stationary)) {
	mouse_UI_index = 3;
	var useable = instance_position(mouse_x, mouse_y, o_machinegun_stationary);
	if (point_distance(x, y, useable.x, useable.y) < 24) {
		if (mouse_check_button_pressed(mb_right)) {
			useable.used = !useable.used;
		}
	}
}

/////// GENERAL CONTROLS
// death
if (healthpoints <= 0) {
	ROF = 0;
	x = xprevious;
	y = yprevious;
	if (!dead) {
		global.scrshake = 3;
		visible = false;
		var corpse = instance_create_layer(x, y, "Instances", o_player_corpse);
		corpse.image_index = corpse_index; // if it's donnie, switch corpse sprite
		var deathsound = audio_play_sound(snd_death, 1, false);
		audio_sound_gain(deathsound, 0.2, 0);
		dead = true;	
	}
}

// Restart a level at any moment
if (keyboard_check(ord("R"))) {
		room_restart();	
}

// finished a level
with(o_goal) {
	if (win_conditions[wincondition_index]()) {
		if (end_condition) {
			if (alpha_transition > 1) {
				room_goto_next();
				yscreen = display_get_height();
			}
		} else {
			room_goto_next();
			yscreen = display_get_height();	
		}
	}
}

// UI
if (keyboard_check_pressed(vk_tab)) {
	UI_USED = !UI_USED;	
}

// setting bombs
if (room == r_garage || room == r_downtown || room == r_suit_bossroom_6) {
	if (instance_exists(o_car)) {
		if (keyboard_check_pressed(ord("E"))) {
			instance_create_layer(x, y, "Instances", o_bomb);
		}
	}
}

// putting letter
if (room == r_suit_bossroom_4 || room == r_pre_pre_garage_2) {
	if (keyboard_check_pressed(ord("E")) && !instance_exists(o_text)) {
		instance_create_layer(x, y, "Instances", o_text);
	}
}
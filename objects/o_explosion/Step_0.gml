/// @description explode and do things

if (explode) {
	with(o_enemies) {
		if (!collision_line(x, y, other.x, other.y, o_collision, 1, 0)) {
			var dist = point_distance(x, y, other.x, other.y);
			if (dist < 32) {
				healthpoints -= ceil((32 - dist) * 1.5);
			}
		}
	}
	with(o_player) {
		if (!collision_line(x, y, other.x, other.y, o_collision, 1, 0)) {
			var dist = point_distance(x, y, other.x, other.y);
			if (dist < 32) {
				healthpoints -= ceil((32 - dist) * 1.5);
			}
		}
	}
	// fragmentation
	repeat(180) {
		var xx = x;
		var yy = y;
		var dir = random(360);
		repeat(128+irandom_range(-6, 6)) {
			instance_create_layer(xx, yy, "Instances", o_bullet_trace);
			xx += dcos(dir)*2;
			yy -= dsin(dir)*2;
			if (position_meeting(xx, yy, o_collision)) {
				var solid_object = instance_position(xx, yy, o_collision);
				if (inarray(solid_object.object_index, o_deformables.deformables)) {
					solid_object.image_index = 1;
				} else {
					var nearest_dent = instance_nearest(xx, yy, o_dent);
					if (point_distance(xx, yy, nearest_dent.x, nearest_dent.y) > 8) {
						var dent = instance_create_layer(xx, yy, "Instances", o_dent);	
						dent.image_angle = dir;
					}
				}
				break;
			} else if (position_meeting(xx, yy, o_player)) {
				var inst = instance_position(xx, yy, o_player);
				inst.healthpoints -= 1;
				break;
			} else if (position_meeting(xx, yy, o_enemies)) {
				var enemy = instance_position(xx, yy, o_enemies);
				enemy.healthpoints -= 15;
			}
		}
		instance_create_layer(xx+dcos(dir)*3, yy-dsin(dir)*3, "Instances", o_bullet_hit_effect);
		instance_create_layer(x+dcos(dir)*6, y-dsin(dir)*6, "Instances", o_muzzleflash);
	}
	if (instance_exists(o_enemies)) { // if gunshots are heard, then enemies will come 
		with(o_enemies) {
			alert_mode = 48;
			stationary = false;
			look_in_one_dir = false;
		}
	}
	ROF = 0;
	var sound = audio_play_sound(snd_explosion, 1, 0);
	audio_sound_gain(sound, 0.2, 0);
	explode = false;
}

fading_counter++;
if (fading_counter >= 20) {
	image_alpha -= 0.25;
	fading_counter = 0;
}
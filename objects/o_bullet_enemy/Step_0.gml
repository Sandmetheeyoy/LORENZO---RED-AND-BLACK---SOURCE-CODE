/// @description movement
repeat(range) {
	var chance = random(100);
	if (chance <= 30) {
		if (!place_meeting(x, y, o_enemies)) {
			instance_create_layer(x, y, "Instances", o_bullet_trace);
		}
	}
	x += dcos(direction)*2;
	y -= dsin(direction)*2;
	if (position_meeting(x, y, o_collision)) {
		var solid_object = instance_position(x, y, o_collision);
		if (inarray(solid_object.object_index, o_deformables.deformables)) {
			solid_object.image_index = 1;
		} else {
			var nearest_dent = instance_nearest(x, y, o_dent);
			if (point_distance(x, y, nearest_dent.x, nearest_dent.y) > 2) {
				instance_create_layer(x, y, "Instances", o_dent);	
			}
		}
		
		// dust kickoff
		var dir_tendency = random_range(-15, 15);
		repeat(10) {
			var s = instance_create_layer(x, y, "Instances", o_dust_kickoff);
			s.direction = direction+180+dir_tendency+random_range(-3, 3);
			s.speed = random(1.5);
		}
		repeat(14) {
			var s = instance_create_layer(x, y, "Instances", o_dust_kickoff);
			s.direction = direction+180+dir_tendency+random_range(-45, 45);
			s.speed = random(1);
		}
		
		repeat(6) {
			var broken_piece = instance_create_layer(x, y, "Instances", o_broken_wall_pieces);
			broken_piece.direction = direction+180 + random_range(-30, 30);
		}
		break;
	} else if (position_meeting(x, y, o_player)) {
		var inst = instance_position(x, y, o_player);
		inst.healthpoints -= damage;
		with(instance_create_layer(x, y, "Instances", o_blood_splat_creator)) {
				direction = other.direction;
		}
		break;
	}
}
instance_destroy();
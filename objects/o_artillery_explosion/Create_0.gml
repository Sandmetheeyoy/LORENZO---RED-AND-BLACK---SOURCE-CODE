/// @description initialize
alarm[0] = 1;
repeat(10) { // particles
	var s = instance_create_layer(x, y, "Instances", o_dust_kickoff);
	s.direction = random(360)+random_range(-3, 3);
	s.speed = random(1.5);
}

if (instance_exists(o_enemies)) {
	with(o_enemies) {
		if (point_distance(x, y, other.x, other.y) < 128) {
			healthpoints -= 50;	
		}
	}
}
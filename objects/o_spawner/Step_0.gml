/// @description spawning enemies
counter++;
if (counter >= counter_limit) {
	var xx = x+random_range(-64, 64);
	var yy = y+random_range(-64, 64);
	if (place_empty(xx, yy, o_collision)) {
		var enemy = instance_create_layer(xx, yy, "Instances", o_enemies);
		enemy.direction = enemy_dir;
		enemy.stationary = false;
		enemy.look_in_one_dir = false;
	}
	counter = 0;
}
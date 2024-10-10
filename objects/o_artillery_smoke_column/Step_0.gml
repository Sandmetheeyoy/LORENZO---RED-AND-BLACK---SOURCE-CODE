/// @description Creating smoke
repeat(3) {
	instance_create_layer(x+random_range(-8, 8), y+random_range(-8, 8), "Instances", o_artillery_smoke);
}

direction += increment;
if (abs(direction - 270) < 15) {
	increment = 0;	
}
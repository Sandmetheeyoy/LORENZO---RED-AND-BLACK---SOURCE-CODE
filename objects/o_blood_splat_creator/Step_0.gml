/// @description do stuff
repeat(3) {
	direction += random_range(-3, 3);
	x += dcos(direction)*5;
	y -= dsin(direction)*5;
	instance_create_layer(x, y, "Instances", o_blood);
	var chance = random(100);
	if (chance <= 20) {
		repeat(10) {
			instance_create_layer(x+random_range(-10, 10), y+random_range(-10, 10), "Instances", o_blood);
		}
	}
	if (position_meeting(x+dcos(direction)*10, y-dsin(direction)*10, o_collision)) {
		break;
	}
}
instance_destroy();
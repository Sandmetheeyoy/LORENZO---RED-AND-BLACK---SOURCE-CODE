/// @description do something about lighting
visible = false;
repeat(250) {
	var xx = x;
	var yy = y;
	var dir = random(360);
	repeat(3) {
		xx += dcos(dir)*random_range(3, 8);
		yy -= dsin(dir)*random_range(3, 8);
		repeat(4) {
			if (place_empty(xx, yy, o_light_spot)) {
				instance_create_layer(xx+random_range(-8, 8), yy+random_range(-8, 8), "Instances", o_light_spot);	
			}
		}
		if (position_meeting(xx, yy, o_collision)) {
			break;	
		}
	}
}
instance_destroy();
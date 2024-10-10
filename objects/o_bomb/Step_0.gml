/// @description blow up at any moment
if (blow_up) {
	if (instance_exists(o_car)) {
		with (o_car) {
			if (distance_to_object(other) < 15) {
				hp -= 350;	
				burning = true;
			} else if (distance_to_object(other) < 32){
				hp -= 50;
				burning = true;
			}
		}
	}
	with(o_player) {
		if (point_distance(x, y, other.x, other.y) < 64) {
			healthpoints -= 100;	
			repeat(10) {
				var blood_splat_trail = instance_create_layer(x, y, "Instances", o_blood_splat_creator);
				blood_splat_trail.direction = point_direction(x, y, other.x, other.y) + 180 + random_range(-30, 30);
			}
		}
	}
	instance_create_layer(x, y, "Instances", o_explosion);
	instance_destroy();
}
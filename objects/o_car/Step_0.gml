/// @description burning and dying
if (burning) {
	repeat(4) {
		instance_create_layer(x-random_range(-36, 36), y-random_range(-13, 13), "Instances", o_fire);
	}
	burn_effect = true;
	burning = false;
}
if (burn_effect) {
	hp -= 1;	
}

if (hp <= 0) {
	instance_create_layer(x, y, "Instances", o_artillery_explosion);
	var broken = instance_create_layer(x, y, "Instances", o_broken_car);
	if (room == r_suit_bossroom_6) {
		broken.y += 32;	
		if (instance_exists(o_create_bullets)) {
			instance_destroy(o_create_bullets);	
		}
	}
	instance_destroy();
	burn_effect = false;
}	
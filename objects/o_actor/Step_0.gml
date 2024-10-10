/// @description movement 
sprite_index = leg_sprite;
//movement
if (!reachedPos) {
	if (instance_exists(o_breadcrumb)) {
		var crumb = instance_nearest(x, y, o_breadcrumb);
		direction = round(point_direction(x, y, crumb.x, crumb.y)/45)*45;
		if (place_meeting(x, y, crumb)) {
			if (crumb.object_index == o_mainbreadcrumb) {
				reachedPos = true;	
			}
			instance_destroy(crumb);
		}
	}
	movement_count++;
	if (movement_count >= counterLimit) {
		x += dcos(direction)*movespeed;
		y -= dsin(direction)*movespeed;
		image_index = !image_index;
		movement_count = 0;
	}
} else {
	image_index = 2; // standing	
	if (use_speech && speech != "") {
		if (speech_destroy) {
			with(o_actor) {
				if (speech_link_id == other.speech_link_id) {
					speech = "SILENCE....";	
				}
			}
			speech = "SILENCE....";
		}	
	}	
}
if (healthpoints <= 0) {
	instance_destroy();
	global.scrshake = 3;
	var inst = instance_create_layer(x, y, "Instances", o_enemy_corpse);
	inst.image_index = 1;
}
if (useAnimation) {
	if (animationFrames > sprite_get_number(body_sprite)-0.1) {
		actionsAfterAnimation[actionAfterAnimIndex](); // what do you do after running the animation
	}
}
generalActions[generalActionsIndex]();
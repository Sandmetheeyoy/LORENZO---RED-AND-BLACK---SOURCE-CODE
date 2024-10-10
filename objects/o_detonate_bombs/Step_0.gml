/// @description meeting player will trigger an explosion

if (mouse_check_button(mb_right)) {
	if (place_meeting(x, y, o_player)) {
		with(o_bomb) {
			blow_up = true;
		}
		with(o_connect_point_lines) {
			instance_destroy();
		}
		previous_connect_line = id;
		image_index = 1;
	}
	
} else {
	image_index = 0;
}

if (keyboard_check(ord("W")) ||
	keyboard_check(ord("A")) ||
	keyboard_check(ord("S")) || 
	keyboard_check(ord("D"))) {
		link_counter ++;
		if (link_counter >= 15) {
			var connect_point = instance_create_layer(o_player.x, o_player.y,"Instances", o_connect_point_lines);
			connect_point.backlink_index = previous_connect_line;
			previous_connect_line = connect_point.id;
			link_counter = 0;
		}
	}
if (keyboard_check_pressed(ord("E"))) {
	link_counter = 30;
}
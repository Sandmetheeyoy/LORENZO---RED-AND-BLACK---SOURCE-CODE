/// @description drawing the directionals

var gun_facing = round(direction/45);
default_torso = all_torsos_pistol[enemykind];
default_leg = all_legs[enemykind];
if (gun_index != 0) {
	default_torso = all_torsos_longgun[enemykind];
}

draw_sprite_ext(default_leg, image_index, x-2, y+1, 1, 1, 0, c_black, 0.5);
draw_sprite_ext(default_torso, gun_facing, x-2, y+1, 1, 1, 0, c_black, 0.5);

draw_sprite(default_leg, image_index, x, y); // reusing the image index for convenience
draw_sprite(default_torso, gun_facing, x, y);


//draw_rectangle(x+dcos(direction)*16-0.5, y-dsin(direction)*16-0.5, x+dcos(direction)*16+0.5
//, y-dsin(direction)*16+0.5, false);

// marking the main enemy
if (mark) {
	draw_rectangle_color(x-0.5, y-10.5, x+0.5, y-9.5, c_red, c_red, c_red, c_red, false);
}

/*/ fun
draw_rectangle_color(x-6, y-12.5, x+6, y-11.5, c_fuchsia, c_fuchsia, c_fuchsia, c_fuchsia, false);
draw_rectangle_color(x-6, y-12.5, x-6+(healthpoints/100)*12, y-11.5, c_aqua, c_aqua, c_aqua, c_aqua, false);
*/

/*if (lose_player >= 1) {
	if (!collision_line(x, y, o_player.x, o_player.y, o_collision, 1, 0)) {
		draw_line_width_color(x, y, o_player.x, o_player.y, 2, c_fuchsia, c_fuchsia);	
	}
}
*/
//draw_line_width_color(x, y, x+dcos(direction)*16, y-dsin(direction)*16, 2, c_red, c_red);
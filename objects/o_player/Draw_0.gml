/// @description drawing the aiming 

var gun_facing = round(direction/45);  

sprite_torso_longgun = s_player_torso_longgun;
sprite_torso = s_player_torso_pistol;
default_torso = sprite_torso;
default_leg = sprite_leg;
if (gun_index != 0) {
	default_torso = sprite_torso_longgun;	
}
draw_sprite_ext(default_leg, image_index, x-2, y+1, 1, 1, 0, c_black, 0.5);
draw_sprite_ext(default_torso, gun_facing, x-2, y+1, 1, 1, 0, c_black, 0.5);

draw_sprite(default_leg, image_index, x   , y); // reusing the image index for convenience
draw_sprite(default_torso, gun_facing, x, y);

if (UI_AIM_ASSIST) {
	draw_rectangle(x+dcos(direction)*16-0.5, y-dsin(direction)*16-0.5, x+dcos(direction)*16+0.5
	, y-dsin(direction)*16+0.5, false);
}

//draw_rectangle_color(x-7, y-12, x+7, y-9, c_fuchsia, c_fuchsia, c_fuchsia, c_fuchsia, false);
//draw_rectangle_color(x-7, y-12, x-7+14*(healthpoints/healthpoints_max), y-9, c_aqua, c_aqua, c_aqua, c_aqua, false);


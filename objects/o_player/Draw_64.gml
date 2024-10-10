/// @description drawing on the ui
var xx = display_get_width();
var yy = display_get_height();

// showing the entire UI
if (UI_USED) {
	o_mission_controller.freeze_mode = true;
} else {
	o_mission_controller.freeze_mode = false;
}

retract_ui_goal = 1024*!UI_USED;
UI_COUNTER++;
if (UI_COUNTER >= 5) {
	retract_ui = lerp(retract_ui, retract_ui_goal, 0.2);
	UI_COUNTER = 0;	
}
// drawing the UI
//draw_rectangle_color(0, -retract_ui, display_get_width(), -retract_ui+display_get_height(), c_fuchsia, c_fuchsia, c_fuchsia, c_fuchsia, false);
draw_sprite_ext(s_blank_ui, 0, 96, 96-retract_ui, 8, 3.25, 0, c_white, 1);	// UI is x-90, x-width = 155 * scale, y-width = 155 * 3.25
draw_text_transformed(128, 128-retract_ui, text_to_show + "\n\n\n\n\n TAB: EXIT", 2, 2, 0);
draw_sprite_ext(gun_ui_sprite[gun_index], 0, 96+155*8, 382-retract_ui, 4, 4, 0, c_white, 1);

// drawing gun ammo
var length_between_things = 32;
var coords_drawx = 128+155*8+96;
var coords_drawy = 382-retract_ui+128+96+length_between_things;
draw_sprite_ext(s_ammo_management_box
, 0
, coords_drawx
, coords_drawy
, 8, 8
, 0
, c_white
, 1);


draw_text_transformed(coords_drawx-32, coords_drawy, string(healthpoints), 5, 5, 0);

// bomb levels
var bomb_levels = (room == r_garage || room == r_suit_bossroom_6 || room == r_downtown);
/*if (bomb_levels) {
	if (point_distance(x, y, mouse_x, mouse_y) > 8) {
		draw_sprite_ext(s_crosshair, 5, display_mouse_get_x(), display_mouse_get_y(), 1, 1, 0, c_white, 1);
		mouse_UI_index = 6;
	}
} */
draw_sprite_ext(s_crosshair, mouse_UI_index, display_mouse_get_x(), display_mouse_get_y(), 1, 1, 0, c_white, 1);	

var dir = 90;
repeat(round((gun_ammo[gun_index]/gun_ammo_standard[gun_index])*360)) {
	var starting_x = display_mouse_get_x();
	var starting_y = display_mouse_get_y();
	repeat(5) {
		starting_x += dcos(dir)*(9+bomb_levels*2);
		starting_y -= dsin(dir)*(9+bomb_levels*2);
	}
	draw_sprite(s_ammo_indicator, 0, starting_x, starting_y);
	dir ++;
}
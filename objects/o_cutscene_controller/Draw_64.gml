/// @description drawing
var xx = display_get_width();
var yy = display_get_height();
display_set_gui_size(xx, yy);

draw_set_alpha(round(blackbox_alpha/0.25)*0.25);
draw_rectangle_color(0, 0, xx, yy, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);


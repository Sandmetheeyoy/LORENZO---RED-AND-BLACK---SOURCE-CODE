/// @description draw UI
var xx = display_get_width()/2;
var yy = display_get_height()/2;
// saving indication
save_message_alpha = max(save_message_alpha - 0.01, 0);
draw_set_halign(fa_center);
draw_set_alpha(save_message_alpha);
draw_rectangle_color(xx-96*4, yy-16*4, xx+96*4, yy+16*4, c_dkgrey, c_dkgrey, c_dkgrey, c_dkgrey, false);
draw_set_alpha(1);
draw_text_transformed_color(xx, yy, save_message, 2.5, 2.5, 0, c_white, c_white, c_white, c_white, save_message_alpha);
draw_set_halign(fa_left);
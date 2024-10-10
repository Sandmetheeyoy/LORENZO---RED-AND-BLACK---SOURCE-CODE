/// @description drawing scroll-up
var xx = display_get_width();
var yy = display_get_height();

display_set_gui_size(xx, yy);
var customFont = font_add_sprite_ext(s_custom_font, ":.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!-", false, 4);
draw_set_font(customFont);
if (transition) {
	yscreen = max(yscreen - 32, 0);
	draw_rectangle_color(0, 0, xx, round(yscreen/128)*128, c_black, c_black, c_black, c_black, false);
}

draw_sprite_ext(s_flashback, 0, 0, 0, 500, 500, 0, c_white, flash_alpha);
flash_alpha = max(flash_alpha - 0.1, 0);
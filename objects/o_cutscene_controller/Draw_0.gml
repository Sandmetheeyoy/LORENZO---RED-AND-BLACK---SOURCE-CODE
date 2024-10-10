/// @description drawing on room
var customFont = font_add_sprite_ext(s_custom_font, ":.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!-", false, 4);

draw_set_font(customFont);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(room_width/2, room_height/2, chapter_name_running, 0.8, 0.8, 0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

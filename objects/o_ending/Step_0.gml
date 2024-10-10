/// @description ending
if (room == r_suit_balcony_1) {
	if (!instance_exists(o_enemies)) {
		ending_alpha += 0.01;
		if (ending_alpha >= 1) {
			room_goto_next();
		}
	}
}
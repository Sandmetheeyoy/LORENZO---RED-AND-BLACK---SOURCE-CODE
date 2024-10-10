/// @description reaction to the player
if (distance_to_object(o_player) < 4) {
	speed = 2;
	direction = point_direction(x, y, o_player.x, o_player.y)+180;
}
speed = max(speed - 0.1, 0);
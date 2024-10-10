/// @description do things
if (instance_exists(o_table_decorations)) {
	with(o_table_decorations) {
		if (point_distance(x, y, other.x, other.y) < 8) {
			instance_destroy();	
		}
	}
}
instance_destroy();
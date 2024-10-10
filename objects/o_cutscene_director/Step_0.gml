/// @description until the scene starts
if (!instance_exists(o_mainbreadcrumb)) {
	wait_counter++;
	if (wait_counter >= wait_before_scene_starts) {
		room_goto_next();
	}	
}
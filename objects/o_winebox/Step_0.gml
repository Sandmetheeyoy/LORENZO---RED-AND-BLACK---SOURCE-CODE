/// @description do stuff
if (explosive && image_index == 1) {
	instance_create_layer(x, y, "Instances", o_explosion);
	instance_destroy();
}

if (image_number != 0) {
	image_xscale = 1.25;
	image_yscale = 1.25;
}
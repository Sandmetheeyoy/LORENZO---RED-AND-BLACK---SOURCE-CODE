/// @description create glass shards
repeat(6) {
	instance_create_layer(x, y, "Instances", o_glass_shattering);
}
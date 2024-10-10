/// @description initialize
repeat(25+power_) {
	var smoke =instance_create_layer(x+random_range(-12, 12), y+random_range(-12, 12), "Instances", o_artillery_smoke);
	smoke.image_speed = 2/30;
}
repeat(2+power_) {
	instance_create_layer(x+random_range(-3, 3), y+random_range(-3, 3), "Instances", o_artillery_smoke_column);	
}
repeat(0+power_) {
	var column = instance_create_layer(x, y, "Instances", o_artillery_smoke_column);
	column.direction = 90 + random_range(-3, 3);
	column.increment = choose(-0.5, 0.5);
}
global.scrshake = 5;
var explosion = audio_play_sound(snd_artillery_explosion, 1, 0);
audio_sound_gain(explosion, (power_/5)*0.2, 0);
instance_create_layer(x, y, "Instances", o_crater_artillery);
instance_destroy();
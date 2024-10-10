/// @description chance stuff
var dir = 0;;
if (x > 256) {
	dir = 180;
}
var chance = random(100);
if (chance <= 20) {
	var spark = instance_create_layer(x+dcos(dir)*12, y-dsin(dir)*12, "Instances", o_muzzleflash);
	var bullet = instance_create_layer(x+dcos(dir)*12, y-dsin(dir)*12, "Instances", o_bullet_player);
	bullet.direction = dir + random_range(-5, 5);
	bullet.damage = 5;
	global.scrshake = 4;
	var sound = audio_play_sound(choose(snd_shoot_pistol, snd_shotgun_blast, snd_tommygun_spray), 1, 0);
	audio_sound_gain(sound, 0.2, 0);
}

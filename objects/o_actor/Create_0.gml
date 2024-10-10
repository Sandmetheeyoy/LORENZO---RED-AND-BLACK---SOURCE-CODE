/// @description initialize
image_speed = 0;
image_index = 2;
prevFrame = 0;
movement_count = 0;
depth = -30;
direction = irandom(8)*45;
speech_destroy = false;
healthpoints = 10;
actionsDuringAnimation = [
	function() {
		
	},
	function() {
		if (round(prevFrame) != round(animationFrames)) {
			global.scrshake = 5;
			o_mission_controller.flash_alpha = 1;
			var shock_sound = audio_play_sound(snd_death, 1, 0);
			audio_sound_gain(shock_sound, 0.2, 0);
		}
	}
];
actionsAfterAnimation = [
	function() { // chill
		// chill	
	},
	function() { // commit suicide
		healthpoints -= 100;
		var dir = 45;
		repeat(5) {
			var splat_c = instance_create_layer(x, y, "Instances", o_blood_splat_creator)
			splat_c.direction = dir;
		}
	},
	
	// LORENZO WAR FLASHBACK
	function() {
		frameSpeed = 0;
		image_index = image_number-1;
		room_goto_next();
	},
	
	// MOVE TO NEXT SCENE
	function() {
		room_goto_next();	
	}
];

generalActions = [
	function() {
		// chill	
	},
	function() { // shooting at car
		if (point_distance(x, y, o_fire_at.x, o_fire_at.y) < 128) {
			
			var chance = random(100);
			if (chance <= 8) {
				var blast = audio_play_sound(choose(snd_pistol, snd_tommygun_spray, snd_shotgun_blast), 1, 0);	// shotgun blast
				audio_sound_gain(blast, 0.2, 0);
				instance_create_layer(x+dcos(direction)*12+random_range(-2, 2), y-dsin(direction)*12+random_range(-2, 2), "Instances", o_muzzleflash);
			}			
			direction = point_direction(x, y, o_fire_at.x, o_fire_at.y);
		}
	},
	
	function() { // smoke -> ONLY APPLIES TO CARS
		var smoke1 = instance_create_layer(x - 34 * image_xscale, y - 32, "Instances", o_dust_kickoff);
		smoke1.image_xscale = 4;
		smoke1.image_yscale = 4;
		smoke1.direction = 180+random_range(-10, 10);
		smoke1.speed = random(2);
		
		var smoke2 = instance_create_layer(x - 34 * image_xscale, y - 2, "Instances", o_dust_kickoff);
		smoke2.image_xscale = 4;
		smoke2.image_yscale = 4;
		smoke2.direction = 180+random_range(-10, 10);
		smoke2.speed = random(2);
	}
];
animationFrames = 0;
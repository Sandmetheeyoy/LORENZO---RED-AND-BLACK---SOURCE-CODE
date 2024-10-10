/// @description giving missions and management in the game
total_missions = 3;
current_missions = 15;
mission_index = 0;
// each mission should last about 5 minutes or someting lol

dialogue_index = 0; // showing dialogue
dialogue = [];
spare_variable = 0;
trigger_enemy = 0;

all_missions = [];

// freeze mode?
freeze_mode = 0;
yscreen = display_get_height();

flash_alpha = 0;

// screenshake
global.scrshake = 0;
actualshakex = 0;
actualshakey = 0;
camera_shake_count = 0;

backgroundeffects = [
	function() {
		
	}
	, 
	function () { // gun fire
		var chance = random(100);

		if (chance < 5) {
			var xx = random(room_width);
			var yy = random(room_height);
			var artexplode = instance_create_layer(xx, yy, "Instances", o_artillery_explosion);
			artexplode.power_ = 1;
		}
	}
];

background_music = 0;
background_rise = 0;
// playing music
if (play_music && o_settings.PLAY_MUSIC) {
	audio_stop_all();
	background_music = audio_play_sound(music_asset, 0, looping);
}
audio_sound_gain(background_music, background_rise, 0);
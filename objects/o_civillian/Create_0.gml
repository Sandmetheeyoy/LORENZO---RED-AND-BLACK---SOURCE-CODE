///@description initialize the NPC

texts = [];    
speech_index = 0;
speech_show = "";
speech_character_index = 1;
speech_counter = 0;
show_text_x = display_mouse_get_x();
show_text_y = display_mouse_get_y();
text_scale = 0;

dead_sprite = 0;
bullet_id = 0;
image_speed = 0;

timer = 0;

dialog_indicator = 0;
// functions after dialogue

after_dialogue = [
	function() {
		// nothing happens	
	},
	
	function() { // specific for a cafe level
		audio_stop_all();
		audio_play_sound(snd_cafe_fight, 0, 0);
		// spawns an enemy or rather BECOMES an enemy
		var enemy = instance_create_layer(x, y, "Instances", o_enemies);
		enemy.enemykind = 2;
		enemy.gun_index = 3;
		enemy.stationary = false;
		enemy.look_in_one_dir = false;
		enemy.mark = true;
		with(o_civillian) {
			if id != other.id { 
				var enemy_self = instance_create_layer(x, y, "Instances", o_enemies);
				enemy_self.enemykind = 2;
				enemy_self.gun_index = 1;
				enemy_self.stationary = false;
				enemy_self.look_in_one_dir = false;
			}
			instance_destroy();	
		}
		instance_destroy();
	},
	
	function() {
		with(o_goal) {
			direction = 270;
			speed = 5;
		}
	},
	
	function() {
		if (!instance_exists(o_bullet_creator)) {
			with(o_civillian) {
				if (body_sprite != s_old_man && body_sprite != s_donnie_m_torso_normal && body_sprite != s_romeo) {
					var bullet_create = instance_create_layer(x, y, "Instances", o_bullet_creator);
					bullet_id = bullet_create;
				}
			}
		}
	},
	
	function() {
		room_goto_next();	
	},
	
	function() {
		image_xscale = 0.1;
		image_yscale = 0.1;
	},
	
	function() {
		audio_play_sound(snd_mansion_fight, 0, 1);
		room_goto_next();	
	}
];

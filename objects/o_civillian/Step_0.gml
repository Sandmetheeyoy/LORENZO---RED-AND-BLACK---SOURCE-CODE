/// @description counting
if (array_length(texts) >= 2) {
	if (point_distance(x, y, mouse_x, mouse_y) < abs(8*image_xscale) && string_length(speech_show) < string_length(texts[speech_index])) {
		speech_counter++;
		if (speech_counter >= 5) {
			speech_show = speech_show + string_char_at(texts[speech_index], speech_character_index);
			speech_character_index ++;
			speech_counter = 0;	
			if (point_distance(x, y, mouse_x, mouse_y) < abs(8*image_xscale) && o_settings.CHARACTER_SPEAKNOISE_TOGGLE) {	
				audio_play_sound(snd_talking, 0, 0);	
			}
		}
	} 
}

if (room == r_pre_garage_4) {
	if (hp < 0) {
		if (body_sprite == s_donnie_m_torso_normal) {
			body_sprite = s_enemy_corpse;
			image_index = 0;
		} else if (body_sprite == s_enemy_torso_longgun){
			body_sprite = s_enemy_corpse;
			image_index = 0;
		} else if (body_sprite == s_romeo) {
			body_sprite = s_enemy_corpse;
			image_index = 1;
		} else if (body_sprite == s_enemy_spade_torso_longgun) {
			body_sprite = s_enemy_corpse;
			image_index = 1;
		}
		instance_destroy(bullet_id);
	}
	if (instance_exists(o_bullet_creator)) {
		timer++;
		if (timer >= 5 * 60) {
			with(o_civillian) {
				if (body_sprite != s_old_man) {
					hp = -50;	
					with(o_goal) {
						end_condition = true;	
					}
				}
			}
		}	
	}
}
/// @description depth

// end condition is for ending chapters
depth = -1;
win_conditions = [
	function() { // default way of winning: reach the goal to win
		if (place_meeting(x, y, o_player)) {
			if end_condition {
				alpha_transition_increment = 0.01;
			}
			return true;	
		}
	},
	function() { // if all enemies are dead and the goal is touched, you win
		if (!instance_exists(o_enemies) && place_meeting(x, y, o_player)) {
			if end_condition {
				alpha_transition_increment = 0.01;
			}
			return true;	
		}
	},
	function() { // if you have killed more than one person
		if (o_player.kills >= 1) {
			if (place_meeting(x, y, o_player)) {
				alpha_transition_increment = 0.01;
				return true;
			}
		}
	},
	function() {
		if (!instance_exists(o_car)) {
			if (place_meeting(x, y, o_player)) {
				alpha_transition_increment = 0.01;
				return true;
			}	
		}
	},
	function() {
		if (instance_exists(o_text)) {
			if (place_meeting(x, y, o_player)) {
				alpha_transition_increment = 0.01;
				return true;
			}
		}
	},
	function() {
		if (end_condition) {
			if place_meeting(x, y, o_player) {
				alpha_transition_increment = 0.01;
				return true;
			}	
		}
	}
]
alpha_transition = 0;
alpha_transition_increment = 0;
visible = false;
/// @description initialize
list_of_events = [
	function() {
		repeat(irandom(10)) {
			var xx = random(room_width);
			var yy = random(room_height);
			instance_create_layer(xx, yy, "Instances", o_artillery_explosion);
		}
	}
];
visible = false;
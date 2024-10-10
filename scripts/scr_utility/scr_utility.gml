// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inarray(n, arr){
	for (var i=0; i<array_length(arr); i++) {
		if (n == arr[i]) {
			return true;
		}
	}
	return false;
}

function findsource(directionToSource, xsource, ysource) {
	var xat = x;
	var yat = y;
	var dir = directionToSource;
	while (point_distance(x, y, xsource, ysource) > 16) {
		// looking for closest
		var closest_source = instance_nearest(x+dcos(dir)*16, y-dsin(dir)*16, o_sudden_event);
		var anglediff = (directionToSource - point_direction(x, y, closest_source.x, closest_source.y))/2;
		dir = point_direction(x, y, closest_source.x, closest_source.y) + anglediff;
		array_push(selectedpathfindblocks, closest_source);
	}
}	

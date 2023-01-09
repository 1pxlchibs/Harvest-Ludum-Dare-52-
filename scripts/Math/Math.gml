function toTile(val, size = 16){
	return floor(val/size)*size;
}

function vector2(_x,_y) constructor{
	x = _x;
	y = _y;
	
	static set = function(_x,_y){
		x = _x;
		y = _y;
	}
	
	static add = function(_vector){
		x += _vector.x;	
		y += _vector.y;	
	}
	
	static substract = function(_vector){
		x -= _vector.x;	
		y -= _vector.y;	
	}
	
	static multiply = function(_scalar){
		x *= _scalar;	
		y *= _scalar;	
	}
	
	static divide = function(_scalar){
		x /= _scalar;	
		y /= _scalar;	
	}
}
	
	
///@description RoomToGui(x, y)
function RoomToGui(_x, _y) {
	//insert the x position you want to follow and they will be relatively placed on the gui layer
	var cx = camera_get_view_x(view_camera[0]);
	var xx = (_x-cx);
	
	//insert the y position you want to follow and they will be relatively placed on the gui layer
	var cy = camera_get_view_y(view_camera[0]);
	var yy = (_y-cy);

	//returns x & y
	return {
		x : xx,
		y : yy
	}
}

///@description GuiToRoomi(x, y)
function GuiToRoom(_x, _y){
	//insert the x gui position you want to follow and they will be relatively placed on in the room
	var cx = camera_get_view_x(view_camera[0]);
	var xx = _x+cx;
	
	//insert the y gui position you want to follow and they will be relatively placed on in the room
	var cy = camera_get_view_y(view_camera[0]);
	var yy = _y+cy;
	
	//returns x & y
	return {
		x : xx,
		y : yy
	}
}
	
function sine_wave(time, period, amplitude, midpoint) {
    return sin(time * 2 * pi / period) * amplitude + midpoint;
}

function sine_between(time, period, minimum, maximum) {
    var midpoint = mean(minimum, maximum);
    var amplitude = maximum - midpoint;
    return sine_wave(time, period, amplitude, midpoint);
}

function delta_time_get() {
	return delta_time/1000000;
}

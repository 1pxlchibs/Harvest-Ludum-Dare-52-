if (cinematicBar){
	cinematicBarLerp = lerp(cinematicBarLerp,global.settings.inGameResH*cinematicBarPercent,0.2);
	
	var _x, _y, _width, _height, _color;
	_color = c_black;
	
	draw_set_color(_color);
	
	_x = 0;
	_y = 0;
	_width = global.settings.inGameResW;
	_height = cinematicBarLerp;
	draw_rectangle(_x,_y,_width,_y+_height,false);
	
	_x = 0;
	_y = global.settings.inGameResH;
	draw_rectangle(_x,_y-_height,_width,_y,false);	
	
	draw_set_color(c_white);
} else{
	cinematicBarLerp = lerp(cinematicBarLerp,0,0.2);
}









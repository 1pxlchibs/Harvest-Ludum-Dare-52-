createCamera = function(){
	application_surface_enable(false);
	
	camera = camera_create();
	view_set_visible(0, true);
	view_set_camera(0, camera);
	
	view_surf = -1;
}

clampToRoom = function(){
	//clamp the camera to the room size
	x = clamp(x,32,room_width-global.settings.inGameResW-32);
	y = clamp(y,32,room_height-global.settings.inGameResH-32);
}

moveToPoint = function(xx,yy){
	//lerp the camera so it smoothly follows the hook
	x = lerp(x,xx-global.settings.inGameResW/2,camSpeed);
	y = lerp(y,yy-global.settings.inGameResH/2,camSpeed);
	
	camera_set_view_pos(camera, floor(x+xOffset), floor(y+yOffset));
}

moveToObject = function(object){
	if (object != -1 and instance_exists(object)){
		//lerp the camera so it smoothly follows the hook
		x = ease(x,object.x-global.settings.inGameResW/2,camSpeed,"linear");
		y = ease(y,object.y-global.settings.inGameResH/2,camSpeed,"linear");
	}
	
	camera_set_view_pos(camera, floor(x+xOffset), floor(y+yOffset));
}

moveOffset = function(xx,yy){
	xOffset = xx;
	yOffset = yy;
}

moveBetween = function(x1,y1,x2,y2,strength = 0.1){
	var xTo = lerp(x1,x2,strength);
	var yTo = lerp(y1,y2,strength);
	
	//lerp the camera so it smoothly follows the hook
	x = lerp(x,xTo-global.settings.inGameResW/2,camSpeed);
	y = lerp(y,yTo-global.settings.inGameResH/2,camSpeed);
	
	camera_set_view_pos(camera, floor(x+xOffset), floor(y+yOffset));
}

refreshResolution = function(width = undefined, height = undefined){
	var tar_width = width ?? global.resolution[oController.resolutionSelected][0];
	var tar_height = height ?? global.resolution[oController.resolutionSelected][1];
	
	
	window_set_size(tar_width,tar_height);	
}

refreshView = function(width = undefined, height = undefined){
	var tar_width = width ?? global.settings.inGameResW;
	var tar_height = height ?? global.settings.inGameResH;
	
	display_set_gui_size(tar_width,tar_height);
	camera_set_view_size(camera,tar_width+1, tar_height+1);
}

screenshake = function(intensity){
	camShakeIntensity = intensity;
	var _x = irandom_range(-camShakeIntensity,camShakeIntensity);
	var _y = irandom_range(-camShakeIntensity,camShakeIntensity);

	moveOffset(_y,_y);
}

cinemaBars = function(percent, _zoom = 1){
	cinematicBar = true;
	zoom = _zoom;
}
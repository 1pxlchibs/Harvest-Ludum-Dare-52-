hook = oPlayer;

cinematicBar = false;
zoom = 1;

//move camera
xOffset = ease(xOffset,0,camSpeed,Easings.LINEAR);
yOffset = ease(yOffset,0,camSpeed,Easings.LINEAR);

//clamp the camera to room
clampToRoom();

if (keyboard_check(ord("R"))){
	cinemaBars(0.1,1.5);
}

zoomLerp = ease(zoomLerp,zoom,0.1,Easings.LINEAR);
zoom = clamp(zoom,1,2);
hook = -1;

xOffset = 0;
yOffset = 0;

camSpeed = .1;
camShakeIntensity = 0;

zoom = 1;
zoomLerp = 1;

cinematicBar = false;
cinematicBarPercent = 0.1;
cinematicBarLerp = 0;


event_user(15);

//Create Camera
createCamera();

//Set Camera View Size
refreshResolution();
refreshView();
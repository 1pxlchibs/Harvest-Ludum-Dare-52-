depth = -y;

fsm.step();

fsm.trigger("t_idle");
fsm.trigger("t_run");

oCamera.moveToObject(id);

if (input_check_pressed("nextItem")){
	currentHeld++;
	if (currentHeld > 3){
		currentHeld = 0;
	}
}

if (input_check_pressed("previousItem")){
	currentHeld--;
	if (currentHeld < 0){
		currentHeld = 3;
	}
}


if (input_check_pressed("interact")){
	global.time.day++;	
}
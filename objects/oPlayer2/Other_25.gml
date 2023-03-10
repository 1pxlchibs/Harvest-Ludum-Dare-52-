init_sprite = function(){
	hand_front = 0;
	hand_back = 0;

	sprites = {
		idle: sCharacterIdle,
		run: sCharacterRun,
		idle_hand_front: sCharacterHandFrontIdle,
		idle_hand_back: sCharacterHandBackIdle,
		run_hand_front: sCharacterHandFrontRun,
		run_hand_back: sCharacterHandBackRun,
		hold_hand_front: sCharacterHandFrontHold,
		hold_hand_back: sCharacterHandBackHold,
	}
	
	hand_track = {
		idle: [
			{x: 3, y: 1},
			{x: 3, y: 0},
			{x: 3, y: 0},
			{x: 3, y: 1}
		],
		run: [
			{x: -2, y: -2},
			{x: -1, y: -1},
			{x: 1, y: 0},
			{x: 3, y: -1},
			{x: 4, y: -3},
			{x: 4, y: -4},
			{x: 3, y: -2},
			{x: 2, y: -1},
		]
	}
}

get_hand_track = function(name = -1){
	if (name != -1){
		return hand_track[$ name];
	}
	
	return hand_track[$ fsm.get_current_state()];
}	

get_sprite = function(name = -1){
	if (name != -1){
		return sprites[$ name];
	}
	
	return sprites[$ fsm.get_current_state()];
}

set_facing = function(){
	if (xx < 0) {face = -1;} 
	if (xx > 0) {face = 1;}	
}
	
get_input = function(){
	xx = input_check("right") - input_check("left");
	yy = input_check("down") - input_check("up");	
}

get_move = function(){
	if (place_meeting(x,y+vspd,oParentCollider)){
		repeat(abs(vspd)){
			if (!place_meeting(x,y+sign(vspd),oParentCollider))
			{
				y+=sign(vspd);
			} else {break;}
		}
		vspd = 0;
	}

	y+=vspd;

	if (place_meeting(x+hspd,y,oParentCollider)){
		repeat(abs(hspd)){
			if (!place_meeting(x+sign(hspd),y,oParentCollider))
			{
				x+=sign(hspd);
			} else {break;}
		}
		hspd = 0;
	}
	
	x+=hspd;	
	
	hspd=xx*spd;
	vspd=yy*spd;
	
	direction = point_direction(0,0,xx,yy);
	hspd = lengthdir_x(spd*delta_time_get(),direction);
	vspd = lengthdir_y(spd*delta_time_get(),direction);
}


//set_direction_sprite = function(){
//	if (vspd <= 0 and hspd = 0){
//		sprite_index = get_sprite("run_back");
//	}
//	if (vspd <= 0 and hspd != 0){
//		sprite_index = get_sprite("run_backSide");
//	}
//	if (vspd >= 0 and hspd = 0){
//		sprite_index = get_sprite("run_front");
//	}
//	if (vspd >= 0 and hspd != 0){
//		sprite_index = get_sprite("run_frontSide");
//	}
//}
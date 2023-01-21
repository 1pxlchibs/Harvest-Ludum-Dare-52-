init_sprite = function(){
	hand_front = 0;
	hand_back = 0;

	sprites = {
		idle: sCharacterIdle,
		run: sCharacterRun,
		tool: sCharacterTool,
		idle_hand_front: sCharacterHandFrontIdle,
		idle_hand_back: sCharacterHandBackIdle,
		run_hand_front: sCharacterHandFrontRun,
		run_hand_back: sCharacterHandBackRun,
		hold_hand_front: sCharacterHandFrontHold,
		hold_hand_back: sCharacterHandBackHold,
		tool_hand_back: sCharacterHandBackTool,
	}
	
	hand_track = {
		idle: [
			{x: 3, y: 1, angle: 0},
			{x: 3, y: 0, angle: 0},
			{x: 3, y: 0, angle: 0},
			{x: 3, y: 1, angle: 0}
		],
		run: [
			{x: -2, y: -2, angle: 0},
			{x: -1, y: -1, angle: 0},
			{x: 1, y: 0, angle: 0},
			{x: 3, y: -1, angle: 0},
			{x: 4, y: -3, angle: 0},
			{x: 4, y: -4, angle: 0},
			{x: 3, y: -2, angle: 0},
			{x: 2, y: -1, angle: 0},
		],
		use: [ 
			{x: 2, y: 0, angle: 0},
			{x: 5, y: -4, angle: 20},
			{x: 6, y: 1, angle: -80},
			{x: 0, y: 2, angle: -40},
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

set_facing_cursor = function(){
	if (x > oHeld.interact_x_lerp) {face = -1;}
	if (x < oHeld.interact_x_lerp) {face = 1;}
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

switch_held = function(){
	if (input_check("nextItem")){
		currentHeld++;
		if (currentHeld > 3){
			currentHeld = 0;
		}
		
		update_held();
	}

	if (input_check("previousItem")){
		currentHeld--;
		if (currentHeld < 0){
			currentHeld = 3;
		}
		
		update_held();
	}	
}

update_held = function(){
	hand_back = get_sprite(fsm.get_current_state()+"_hand_back");
	hand_front = get_sprite(fsm.get_current_state()+"_hand_front");
	
	with(oHeld){
		if (ownerId = other.id){
			instance_destroy();
		}
	}
	
	var _struct = pxl_inventory_get(global.playerInv,currentHeld);
	if (_struct != -1){
		if (!instance_exists(oHeld)){
			with(instance_create_depth(x,y,-y,oHeld)){
				item_struct = pxl_inventory_get(global.playerInv,other.currentHeld);
				ownerId = other.id;
			}
		} else{
			if (pxl_inventory_get(global.playerInv,currentHeld).id != oHeld.item_struct.id){
				item_struct = pxl_inventory_get(global.playerInv,currentHeld);
				ownerId = other.id;
			}
		}
	}
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
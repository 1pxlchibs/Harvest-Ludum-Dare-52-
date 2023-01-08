init_sprite = function(){
	sprites = {
		idle: sPlayer,
	}
}

get_sprite = function(name = -1){
	if (name != -1){
		return sprites[$ name];
	}
	return sprites[$ fsm.get_current_state()];
}

set_facing = function(){
	if (hspd < 0) {face = -1;} 
	if (hspd > 0) {face = 1;}	
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
	instance_destroy(oHeld);
	
	var _struct = pxl_inventory_get(global.playerInv,currentHeld);
	if (_struct != -1){
		if (!instance_exists(oHeld)){
			with(instance_create_depth(x,y,-y,oHeld)){
				item_struct = pxl_inventory_get(global.playerInv,other.currentHeld);
			}
		} else{
			if (pxl_inventory_get(global.playerInv,currentHeld).id != oHeld.item_struct.id){
				item_struct = pxl_inventory_get(global.playerInv,currentHeld);
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
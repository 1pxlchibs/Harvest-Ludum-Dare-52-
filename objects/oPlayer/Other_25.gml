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

dig_spot = function(x, y){
	if (!collision_point(interactX+1, interactY+1, oFarmland, true, false)){
		instance_create_layer(interactX,interactY,"PlantableLand",oFarmland);
	}
}

plant_spot = function(x, y){
	var _inst = collision_point(interactX+1, interactY+1, oFarmland, true, false);
	if (_inst != noone){
		with(_inst){
			if (plant = -1){
				day = global.time.day;
				plant = pxldata_get_item(global.playerInv[other.currentHeld].id);
				inventory_remove_pos(global.playerInv, other.currentHeld);
			}
		}
		
		show_debug_message(string(_inst));
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
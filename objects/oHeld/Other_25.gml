dig_spot = function(x, y){
	if (!collision_point(interact_x+1, interact_y+1, oFarmland, true, false)){
		instance_create_layer(interact_x,interact_y,"PlantableLand",oFarmland);
	}
}

plant_spot = function(x, y){
	var _inst = collision_point(interact_x+1, interact_y+1, oFarmland, true, false);
	if (_inst != noone){
		with(_inst){
			if (plant = -1){
				day = global.time.day;
				plant = pxl_data_get_item(global.playerInv[oPlayer.currentHeld].id);
				pxl_inventory_remove_pos(global.playerInv, oPlayer.currentHeld);
			}
		}
		
		show_debug_message(string(_inst));
	}
}
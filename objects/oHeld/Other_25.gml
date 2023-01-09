dig_spot = function(x, y){
	var lay_id = layer_get_id("TilesSoil");
	var map_id = layer_tilemap_get_id(lay_id);
	
	if (tilemap_get_at_pixel(map_id,x+1, y+1) != 0){
		var _inst = collision_point(x+1, y+1, oFarmland, true, false);
		if (_inst != noone){
			if (_inst.plant != -1){
				pxl_data_spawn_item(x,y,_inst.plant);
			}
			instance_destroy(_inst);
		} else{
			instance_create_layer(x,y,"PlantableSoil",oFarmland);
			audio_play_sound(sndHoe4,10,false);
		}
	}
}

plant_spot = function(x, y){
	var _inst = collision_point(x+1, y+1, oFarmland, true, false);
	if (_inst != noone){
		with(_inst){
			if (plant = -1){
				day = global.time.day;
				plant = pxl_data_get_item(global.playerInv[oPlayer.currentHeld].id);
				pxl_inventory_remove_pos(global.playerInv, oPlayer.currentHeld);
				audio_play_sound(sndPlanting,10,false);
			}
		}
	}
}

place_tech = function(x, y){
	var lay_id = layer_get_id("TilesSoil");
	var map_id = layer_tilemap_get_id(lay_id);
	
	if (tilemap_get_at_pixel(map_id,x+1, y+1) = 0){
		var _inst = collision_point(x+1, y+1, oParentCollider, true, false);
		if (_inst != noone){
			with(_inst){
				if (tech_struct != -1){
					pxl_data_spawn_item(x,y,tech_struct);
				}
			}
			instance_destroy(_inst);
		} else{
			with(instance_create_depth(x,y,-y,oTech)){
				tech_struct = pxl_data_get_item(global.playerInv[oPlayer.currentHeld].id);
				pxl_inventory_remove_pos(global.playerInv, oPlayer.currentHeld);
			}
		}
	}
}
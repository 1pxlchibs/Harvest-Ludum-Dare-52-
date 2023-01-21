dig_spot = function(x, y){
	var lay_id = layer_get_id("TilesSoil");
	var map_id = layer_tilemap_get_id(lay_id);
	
	if (tilemap_get_at_pixel(map_id,x+1, y+1) != 0){
		var _inst = collision_point(x+1, y+1, oFarmland, true, false);
		if (_inst != noone){
			repeat(16){
				var _ranx = irandom_range(-8,8);
				var _rany = irandom_range(-8,8);
				advanced_part_particles_create(oParticleManager.part_sys,x+8-_ranx,y-_rany+8,oParticleManager.part_dirt,irandom_range(1,2));
			}
			audio_play_sound(sndHoe4,10,false);
			if (_inst.data != -1){
				if (_inst.grown){
					_inst.pickup();
					return;	
				}
				pxl_data_spawn_item(x,y,_inst.data);
				_inst.data = -1;
				return;
			}
			instance_destroy(_inst);
		} else{
			instance_create_layer(x,y,"PlantableSoil",oFarmland);
			repeat(16){
				var _ranx = irandom_range(-8,8);
				var _rany = irandom_range(-8,8);
				advanced_part_particles_create(oParticleManager.part_sys,x+8-_ranx,y-_rany+8,oParticleManager.part_dirt,irandom_range(1,2));
			}
			audio_play_sound(sndHoe4,10,false);
		}
	}
}

plant_spot = function(x, y){
	var _inst = collision_point(x+1, y+1, oFarmland, true, false);
	if (_inst != noone){
		with(_inst){
			if (data = -1){
				day = global.time.day;
				data = pxl_data_get_item(global.playerInv[other.ownerId.currentHeld].id);
				pxl_inventory_remove_pos(global.playerInv, other.ownerId.currentHeld);
				audio_play_sound(sndPlanting,10,false);
				
				repeat(16){
					var _ranx = irandom_range(-8,8);
					var _rany = irandom_range(-8,8);
					advanced_part_particles_create(oParticleManager.part_sys,x+8-_ranx,y-_rany+8,oParticleManager.part_dirt,irandom_range(1,2));
				}
			}
		}
	}
}

place_tech = function(x, y){
	var lay_id = layer_get_id("TilesSoil");
	var map_id = layer_tilemap_get_id(lay_id);

	if (tilemap_get_at_pixel(map_id,x+1, y+1) = 0){
		var _inst = collision_point(x+1, y+1, oTech, true, false);
		if (_inst != noone){
			with(_inst){
				if (data != -1){
					pxl_data_spawn_item(x,y,data);
				}
			}
			instance_destroy(_inst);
		} else{
			with(instance_create_depth(x,y,-y,oTech)){
				data = pxl_data_get_item(global.playerInv[other.ownerId.currentHeld].id);
				pxl_inventory_remove_pos(global.playerInv, other.ownerId.currentHeld);
			}
			audio_play_sound(sndPlanting,10,false);
		}
	}
}

remove_tech = function(x, y){
	var _inst = collision_point(x, y, oTech, true, false);
	if (_inst != noone){
		with(_inst){
			if (data != -1){
				pxl_data_spawn_item(x,y,data);
			}
		}
		instance_destroy(_inst);
	}
}

chop = function(x, y){
	var _inst = collision_point(x, y, oTree, true, false);
	if (_inst != noone){
		with(_inst){
			hit = true;
			shake = 2;
		}
		audio_play_sound(choose(sndAxe1,sndAxe2,sndAxe3),10,false);
	}
	
}
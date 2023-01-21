// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LDTKImporter(level){
	var _snapString = string_from_file(working_directory + "/levels/" + level + ".ldtkl");
	var _level = snap_from_json(_snapString);
	
	//set room dimension
	room_set_width(room,_level.pxlWid);
	room_set_height(room,_level.pxlHei);
	
	
	var entities = _level.layerInstances[0];
	var level_grid = _level.layerInstances[1];
	
	//place grass tiles
	var tile_data = level_grid.autoLayerTiles;
	for (var i = 0; i < array_length(tile_data); i++;){
		var _tile = tile_data[i];
		
		var lay_id = layer_get_id("Grass_Tiles");
		var map_id = layer_tilemap_get_id(lay_id);
		
		tilemap_set(map_id,_tile.t,round(_tile.px[0]/16),round(_tile.px[1]/16));	
	}

	//place entities
	var entity_data = entities.entityInstances;
	for (var i = 0; i < array_length(tile_data); i++;){
		var _entity = entity_data[i];
		
		switch(_entity.__tags[0]){
			case "Tree":
				instance_create_depth(_entity.px[0],_entity.px[1],-_entity.px[1],oTree,{
					drop: _entity.fieldInstances
				});
			break;
		}
	}
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tile_meeting(xx,yy,_layer){
	var _tm = layer_tilemap_get_id(_layer);

	var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (xx - x), y),
	_y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (yy - y)),
	_x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (xx - x), y),
	_y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (yy - y));

	for(var _x = _x1; _x <= _x2; _x++){
		for(var _y = _y1; _y <= _y2; _y++){
			if(tile_get_index(tilemap_get(_tm, _x, _y))){
				return true;
			}
		}
	}

	return false;
}

function tile_meeting_precise(xx,yy,_layer){
	var _tm = layer_tilemap_get_id(_layer),
	_checker = oPreciseTileChecker;
	
	if(!instance_exists(_checker)) instance_create_depth(0,0,0,_checker); 
	
	var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (xx - x), y),
	_y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (yy - y)),
	_x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (xx - x), y),
	_y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (yy - y));

	for(var _x = _x1; _x <= _x2; _x++){
		for(var _y = _y1; _y <= _y2; _y++){
			var _tile = tile_get_index(tilemap_get(_tm, _x, _y));
			if(_tile){
				if(_tile == 1) return true;

				_checker.x = _x * tilemap_get_tile_width(_tm);
				_checker.y = _y * tilemap_get_tile_height(_tm);
				_checker.image_index = _tile;

				if(place_meeting(xx,yy,_checker)) return true;
			}
		}
	}

	return false;
}
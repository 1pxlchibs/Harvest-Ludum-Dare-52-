// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pxl_data_get_item(_id){
	var _snapString = string_from_file("harvest_DB.json");
	var _database = snap_from_json(_snapString);
	
	var _item = _database[$ _id];
	
	return variable_struct_copy(_item);
}

function pxl_data_spawn_item(x, y, _struct, amount = 1){
	repeat(amount){
		with(instance_create_depth(x+irandom_range(-4,4),y+irandom_range(-4,4),0,oLoot)){
			loot_struct = _struct;
		}
	}
}


function interact(distance = 32,_id = id){
	if (distance_to_object(oPlayer) < distance){
		if (input_check_pressed("interact")){
			return(true);
		}
	}
}
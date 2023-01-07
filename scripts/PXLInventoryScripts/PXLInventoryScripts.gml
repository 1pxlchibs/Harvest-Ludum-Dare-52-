// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_create(x,y,array){
	var _x = x+16;
	var _y = y+16;
	return instance_create_depth(_x, _y, D_GUI_BOTTOM, oInventory, {
		inventory : array
	});
}

function inventory_add(array, _struct, amount = 1){
	var i = -1;
	//get type and _id
	var _type = _struct.type;
	var _id = _struct.id;
	
	var fail = false;
	var stack = false;
	//check if it already exists
	for(var j= 0; j < array_length(array); j++){
		var _item_struct = array[j];
		if (_item_struct != -1){
			if (_item_struct.id = _struct.id){
				//check if item can stack
				if (_struct.stack + amount <= _struct.stackLimit && _struct.stackable){
					stack = true;
				}
				break;
			}
		}
	}
	//if not, find empty slot
	var _item_struct = 0;
	if (!stack){
		do{
			i++;
			_item_struct = array[i];
		}  until(_item_struct = -1 or i = array_length(array));
		if (_item_struct != -1){
			fail = true;
		}
	}
	
	
	if (fail = false){
		array[i] = _struct;
		
		if (stack){
			_item_struct = array[j];
			_item_struct.stack += amount;
		}
	} else{
		//var old_weapon = global.playerInv[global.pl_weaponselect];
		//var old_id = old_weapon.id;
		//var old_type = old_weapon.type;
		//instance_destroy(asset_get_index("obj_"+old_id));
		
		//with(instance_create_depth(obj_player.x,obj_player.y,-obj_player.y,obj_pickup)){
		//	pickup_list = global.playerInv[global.pl_weaponselect];
		//}
		//array[global.pl_weaponselect] = _struct;
	}

}

function inventory_remove_pos(array, _pos){
	array[_pos] = -1;
}

// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pxl_inventory_create(x,y,array, columns = 4){
	var _x = x+16;
	var _y = y+16;
	if (is_string(array)){
		array = variable_instance_get(id,array);	
	}
	return instance_create_depth(_x, _y, D_GUI_MIDDLE, oInventory, {
		inventory : array,
		columns : columns
	});
}

function pxl_inventory_shop_create(x,y,array, columns = 4){
	var _x = x+16;
	var _y = y+16;
	return instance_create_depth(_x, _y, D_GUI_MIDDLE, oShopInventory, {
		inventory : array,
		columns : columns
	});
}

function pxl_inventory_add(array, _struct, amount = 1){
	//check if it already exists
	for(var j= 0; j < array_length(array)-1; j++;){
		var _item_struct = array[j];
		
		if (_item_struct != -1){
			if (_struct.id = _item_struct.id){
				//check if item can stack
				if (_struct.stackable){
					array[j].stack += amount;
					return;
				}
			}
		}
	}
	
	for(var i= 0; i < array_length(array)-1; i++;){
		var _item_struct = array[i];
		if (_item_struct = -1){
			_struct.stack = amount;
			array[i] = _struct;
			return;
			break;
		}
	}
}

function pxl_inventory_remove_pos(array, pos, amount = 1){
	var _struct = array[pos];
	
	if (_struct != -1){
		var _amount = _struct.stack;
		
		if (amount <= _amount){
			array[pos].stack -= amount;
		}
		
		if (_amount <= 1){
			array[pos] = -1;
		}
	}
}

function pxl_inventory_get(array, pos){
	return array[pos];
}
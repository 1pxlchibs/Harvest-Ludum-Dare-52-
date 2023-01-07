// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_create(x,y,array){
	var _x = x;
	var _y = y;
	return instance_create_depth(_x, _y, D_GUI_BOTTOM, oInventory, {
		inventory : array
	});
}
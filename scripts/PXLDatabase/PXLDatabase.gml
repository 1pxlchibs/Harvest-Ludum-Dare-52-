// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pxldata_get_item(_id){
	var _snapString = string_from_file("harvest_DB.json");
	var _database = snap_from_json(_snapString);
	
	var _item = _database[$ _id];
	
	return variable_struct_copy(_item);
}

function pxldata_get_string(struct,variable){
	return struct[$ variable][$ global.settings.language];
}
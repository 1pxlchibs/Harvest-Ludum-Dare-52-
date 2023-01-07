// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_item(id){
	var _snapString = string_from_file("harvest_DB.json");
	var _database = snap_from_json(_snapString);
	
	return _database[$ id];
}
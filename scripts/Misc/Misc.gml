// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function animation_end() {
	return (image_index + image_speed*sprite_get_speed(sprite_index)/(sprite_get_speed_type(sprite_index)==spritespeed_framespergameframe? 1 : game_get_speed(gamespeed_fps)) >= image_number);	
}

function sprite_broadcast(message_type,callback) {
	if (event_data[? "event_type"] == "sprite event"){
		if (event_data[? "message"] == message_type){
			callback();
		}
	}	
}

function variable_struct_copy(struct){
    var key, value;
    var newCopy = {};
    var keys = variable_struct_get_names(struct);
    for (var i = array_length(keys)-1; i >= 0; --i) {
            key = keys[i];
            value = struct[$ key];
            variable_struct_get(struct, key);
            variable_struct_set(newCopy, key, value)
    }
    return newCopy;
}

function variable_struct_merge(src, dest) {
	// WARNING! DOESN'T DO A DEEP MERGE- child structs are overwritten
	// Applies properties from src, into dest. Matching properties are overridden in dest
	var srcNames = variable_struct_get_names(src);
	for(var i=0; i<array_length(srcNames); i++) {
		var name = srcNames[i];
        
		variable_struct_set(dest, name, src[$ name]);
	}
	return dest;
}

function variable_struct_merge_deep(src, dest) {
	// Deeply Applies properties from src, into dest. Matching properties are overridden in dest
	var srcNames = variable_struct_get_names(src);
	for(var i=0; i<array_length(srcNames); i++) {
		var name = srcNames[i];
        
		// Note: is_struct returns true for methods
		if (is_struct(src[$ name]) and !is_method(src[$ name])) {
			if (!variable_struct_exists(dest, name) or !is_struct(dest[$ name])) {
				dest[$ name] = {};
			}
			variable_struct_merge_deep(src[$ name], dest[$ name]);
		} else {
			variable_struct_set(dest, name, src[$ name]);
		}
		//dest[$ name] = src[$ name];
	}
	return dest;
}
	
/// @description	With this function you can create an array of names from a source array filtered through key comparison
function database_get_array_filtered(source, key, value){
	var _nameArray = variable_struct_get_names(source);
	var _newArray = [];
	for(i = 0; i < array_length(_nameArray); i++){
		var _struct = source[$ _nameArray[i]];
		
		if (_struct[$ key] = value){
			array_push(_newArray,_struct);	
		}
	}
	
	return _newArray;
}
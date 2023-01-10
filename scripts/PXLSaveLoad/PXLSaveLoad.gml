// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pxl_save() constructor {
	_wrapper = {};
	
	json_save = function(data, filename) {
		var _str = snap_to_json(data,true);
	    var _buff = buffer_create(string_byte_length(_str) + 1, buffer_grow, 1);
	    buffer_write(_buff, buffer_string, _str);
	    buffer_save(_buff, filename);
	    buffer_delete(_buff);
	}

	
	save = function(_variable,_key){
		variable_struct_set(_wrapper,_key,_variable);
		show_debug_message("Saved: ["+_key+"]");
	}
	
	save_objects = function(_object,_key){
		var _array = [];
		with(_object){
			var _struct = {};
			_struct.x = x;
			_struct.y = y;
			_struct.data = data;
			
			array_push(_array,_struct);
		}
		save(_array,_key);
	}
	
	save(GM_version, "version");
	
	save(global.playerInv, "playerInventory");
	save(global.time, "time");
	save(global.stats, "stats");
	
	save_objects(oFarmland, "farmland");
	save_objects(oTech, "tech");
	
	json_save(_wrapper,"sunsetcounty01.save");
	delete _wrapper;
}

function pxl_load() constructor {
	_wrapperload = {};
	json_load = function(filename) {
		var _struct = {};
		var _buff = buffer_load(filename);
		_struct = snap_from_json(buffer_read(_buff, buffer_text))
		buffer_delete(_buff);
		return _struct;
	}
	
	load = function(_key, _incase = 0){
		//TODO ------- SET TO SELF
		if (variable_struct_exists(_wrapperload,_key)){
			var _variable = _wrapperload[$ _key];
			if (_variable = undefined or _variable = noone){
				show_debug_message("FAILED TO LOAD: ["+_key+"] / assigning ["+string(_incase)+"] instead");
				return(_incase);

			}
			show_debug_message("Loaded: ["+_key+"] with value ["+string(_variable)+"]");
			return(_variable);
		} else{
			show_debug_message("FAILED TO LOAD: ["+_key+"] / assigning ["+string(_incase)+"] instead");
			return(_incase);
		}
	}
	
	load_objects = function(object, _key){
		for(var i = 0; i < array_length(_wrapperload[$ _key]); i++;){
			var _struct = _wrapperload[$ _key][i];
			with(instance_create_depth(_struct.x,_struct.y,-_struct.y,object)){
				data = _struct.data;
			}
		}
	}
	
	if (file_exists("sunsetcounty01.save")) {
		_wrapperload = json_load("sunsetcounty01.save");
		
		global.playerInv = load("playerInventory");
		global.time = load("time");
		global.stats = load("stats");
		
		load_objects(oFarmland, "farmland");
		load_objects(oTech, "tech");
	}
	delete _wrapperload;
}
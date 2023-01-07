// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PXLTimer() constructor{
	pxlTimer_struct = {};
	
	static add = function(name, time, _func = -1){
		var setTime = time;
		
		//check if time is an array
		if (is_array(time)){
			//if it is set time_current to random range
			setTime = irandom_range(time[0],time[1]);
		}
		
		//set timer struct
		var _struct = {
			timer_length : time,
			timer_current : setTime,
			timer_method : _func
		}
		
		//set the new timer
		variable_struct_set(pxlTimer_struct,name,_struct);
	}
	
	static step = function(name, _reset = false){
		var _struct = variable_struct_get(pxlTimer_struct,name);
		
		if (_struct.timer_current <= 0){
			if (_struct.timer_method != -1){	
				_struct.timer_method();
			}
			if (_reset){
				reset(name);	
			}
			return true;	
		} else{
			_struct.timer_current--;	
		}
		return false;
	}
	
	static get_stage = function(name){
		var _struct = variable_struct_get(pxlTimer_struct,name);
		if (_struct.timer_length > 0){
			return _struct.timer_current/_struct.timer_length;
		}
		return 1;
	}
	
	static get_current = function(name){
		var _struct = variable_struct_get(pxlTimer_struct,name);
		return _struct.timer_current;
	}
	
	static get_length = function(name){
		var _struct = variable_struct_get(pxlTimer_struct,name);
		return _struct.timer_length;
	}
	
	static set = function(name, time){
		var setTime = time;
		
		//check if time is an array
		if (is_array(time)){
			//if it is set time_current to random range
			setTime = irandom_range(time[0],time[1]);
		}
		
		var _struct = variable_struct_get(pxlTimer_struct,name);
		
		_struct.timer_current = setTime;
		_struct.timer_length = time;
	}
		
	static reset = function(name){
		var _struct = variable_struct_get(pxlTimer_struct,name);
		
		if (is_array(_struct.timer_length)){
			var array = _struct.timer_length;
			_struct.timer_current = irandom_range(array[0],array[1]);
		} else{
			_struct.timer_current = _struct.timer_length;
		}
	}
	
	static reset_all = function(){
		var _array = variable_struct_get_names(pxlTimer_struct);
		
		for(var i = 0; i < array_length(_array); i++;){
			var _struct = variable_struct_get(pxlTimer_struct,_array[i]);
			
			if (is_array(_struct.timer_length)){
				var array = _struct.timer_length;
				_struct.timer_current = irandom_range(array[0],array[1]);
			} else{
				_struct.timer_current = _struct.timer_length;
			}
		}
	}
 }
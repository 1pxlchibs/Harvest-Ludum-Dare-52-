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
		oHud.interact_prompt = true;
		if (input_check_released("interact")){
			return(true);
		}
	}
}

function create_audio_emitter(falloff_start, falloff_max) {
	emitter = audio_emitter_create();
	audio_falloff_set_model(audio_falloff_linear_distance);
	audio_emitter_falloff(emitter,falloff_start,falloff_max,2)
}

function play_audio_emitter(sound, pitch_min, pitch_max, loop) {

	audio_emitter_position(emitter,x,y,0);
	var _sound = audio_play_sound_on(emitter,sound,loop,10);
	audio_emitter_velocity(emitter, hspeed, vspeed, 0);
	audio_emitter_pitch(emitter,random_range(pitch_min,pitch_max));

	return(_sound);
}

function new_day(){
	var _money_made = 0;
	_money_made += round(global.stats.power_level/100);
	
	for(var i = 0; i < array_length(global.sell_array); i++;){
		var _struct = global.sell_array[i];
		if (_struct != -1){
			_money_made += (_struct.price * _struct.stack);
			
			global.sell_array[i] = -1;
		}
	}

	return _money_made;
}

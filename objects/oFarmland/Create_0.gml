/// @description Insert description here
// You can write your code in this editor
day = global.time.day;

timers = new PXLTimer();

timers.add("stage_cooldown",1);

data = -1;

loot_surf = 0;
loot_shine = 0;

grown = false;

pickup = function(){
	pxl_data_spawn_item(x,y, pxl_data_get_item(data.returns),irandom_range(data.yield[0],data.yield[1]));
	grown = false;
	if (data.renewable){
		var _id = data.id;
		data = -1;	
			
		data = pxl_data_get_item(_id);
		data.currentStage = array_length(data.stages)-1;
	} else{
		data = -1;	
	}
		
	day = global.time.day;
}
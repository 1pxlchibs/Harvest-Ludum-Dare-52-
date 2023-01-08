if (plant != -1){
	if (day != global.time.day && !grown){	
		plant.stages[plant.currentStage]--;
		
		if (plant.stages[plant.currentStage] <= 0){
			plant.stages[plant.currentStage] = 0;
			plant.currentStage++;
		}
	
		if (plant.currentStage > array_length(plant.stages)-1){
			plant.currentStage = array_length(plant.stages);
			grown = true;
		}
		
		day = global.time.day;
	}
}

if (grown){
	if (interact()){
		pxl_data_spawn_item(x,y, pxl_data_get_item(plant.returns),irandom_range(plant.yield[0],plant.yield[1]));
		grown = false;
		if (plant.renewable){
			var _id = plant.id;
			plant = -1;	
			
			plant = pxl_data_get_item(_id);
			plant.currentStage = array_length(plant.stages)-1;
		} else{
			plant = -1;	
		}
		
		day = global.time.day;
	}	
}


if (plant != -1){
	if (day != global.time.day){	
		plant.stages[plant.currentStage]--;
		
		if (plant.stages[plant.currentStage] <= 0){
			plant.stages[plant.currentStage] = 0;
			plant.currentStage++;
		}
	
		if (plant.currentStage > array_length(plant.stages)-1){
			plant = -1;
		}
		
		day = global.time.day;
	}
}


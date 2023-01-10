if (data != -1){
	if (day != global.time.day && !grown){	
		data.stages[data.currentStage]--;
		
		if (data.stages[data.currentStage] <= 0){
			data.stages[data.currentStage] = 0;
			data.currentStage++;
		}
	
		if (data.currentStage > array_length(data.stages)-1){
			data.currentStage = array_length(data.stages);
			grown = true;
		}
		
		day = global.time.day;
	}
}

if (grown){
	if (interact()){
		pickup();
	}	
}


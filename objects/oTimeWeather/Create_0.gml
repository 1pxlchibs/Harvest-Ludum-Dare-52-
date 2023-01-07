global.time = {
	day : 0,
	hour : 0,
	minute : 0
}

gameTimer = time_source_create(time_source_game, 2, time_source_units_seconds, function(){
	global.time.minute++;
	
	if (global.time.minute =  60){
		global.time.minute = 0;
		global.time.hour++;
		
		if (global.time.hour = 24){
			global.time.hour = 0;
			global.time.day++;
		}
	}
	
	time_source_reset(gameTimer); 
	time_source_start(gameTimer);
})


time_source_start(gameTimer);


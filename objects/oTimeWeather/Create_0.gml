global.time = {
	day : 0,
	hour : 6,
	minute : 0
}

gameTimer = time_source_create(time_source_game, 2, time_source_units_seconds, function(){
	global.time.minute+=15;
	
	if (global.time.minute = 60){
		global.time.minute = 0;
		global.time.hour++;
		
		if (global.time.hour = 24){
			oController.dayEnded = true;
			oController.dayEndedMoney = new_day();
		}
	}
	
	time_source_reset(gameTimer); 
	time_source_start(gameTimer);
})


time_source_start(gameTimer);


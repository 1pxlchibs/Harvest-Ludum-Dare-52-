colors[0] = #0c0b42;
colors[1] = #0c0b42;
colors[2] = #0c0b42;
colors[3] = #0c0b42;
colors[4] = #032769;
colors[5] = #144491;
colors[6] = #ffb84a;
colors[7] = #ffdeaa;
colors[8] = #ffffff;
colors[9] = #ffffff;
colors[10] = #ffffff;
colors[11] = #ffffff;
colors[12] = #ffffff;
colors[13] = #ffffff;
colors[14] = #ffffff;
colors[15] = #ffffff;
colors[16] = #ffffff;
colors[17] = #ffb84a;
colors[18] = #ed7b39;
colors[19] = #dc3838;
colors[20] = #6c2f51;
colors[21] = #032769;
colors[22] = #0c0b42;
colors[23] = #0c0b42;

current_color = global.time.hour;
next_color = global.time.hour+1;
if (global.time.hour = 23){
	next_color = 0;
}

color = merge_color(colors[current_color],colors[next_color],global.time.minute/60);

gameTimer = time_source_create(time_source_game, 2, time_source_units_seconds, function(){
	global.time.minute+=5;
	
	if (global.time.minute = 60){
		global.time.minute = 0;
		global.time.hour++;
		
		if (global.time.hour >= 24){
			global.time.hour = 0;
		}
		
		current_color = global.time.hour;
		next_color = global.time.hour+1;
		if (global.time.hour = 23){
			next_color = 0;
		}
	}
	
	color = merge_color(colors[current_color],colors[next_color],global.time.minute/60);
	
	oController.bulbRenderer.SetAmbientColor(color);
	
	time_source_reset(gameTimer); 
	time_source_start(gameTimer);
})

time_source_start(gameTimer);
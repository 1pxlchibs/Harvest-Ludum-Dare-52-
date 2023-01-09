if (dayEnded){
	oController.fadein_alpha = 1;
	draw_rectangle_color(0,0,global.settings.inGameResW,global.settings.inGameResH,c_black,c_black,c_black,c_black,false);	
	
	scribble("[fDefaultBold][wave]Day Completed!").blend(#B7DDEA,1).align(fa_middle,fa_top).draw(global.settings.inGameResW/2,global.settings.inGameResH/2-80);
	scribble("[fDefaultBold]Total Money Made: "+string(dayEndedMoney)).blend(#B7DDEA,1).align(fa_middle,fa_top).draw(global.settings.inGameResW/2,global.settings.inGameResH/2-40);
	scribble("[fDefaultBold]Total Power Generated: "+string(global.stats.power_level)).blend(#B7DDEA,1).align(fa_middle,fa_top).draw(global.settings.inGameResW/2,global.settings.inGameResH/2-20);
	scribble("Space to skip to next day").blend(#B7DDEA,1).align(fa_middle,fa_top).draw(global.settings.inGameResW/2,global.settings.inGameResH/2+20);
	
	if (keyboard_check_pressed(vk_space)){
		dayEnded = false;
		
		global.time.hour = 0;
		global.time.day++;
		
		global.stats.money += dayEndedMoney;
		global.stats.power_level = 0;
		
		dayEndedMoney = 0;
	}
}



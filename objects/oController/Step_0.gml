if (timers.step("lootpitch")){
	lootpitch = 1;
}

fadein_alpha = lerp(fadein_alpha,0,0.01);

lootpitch = clamp(lootpitch,1,2);
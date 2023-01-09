if (place_meeting(x,y,oPlayer) && !oController.dayEnded){
	if (interact()){
		oController.dayEnded = true;
		oController.dayEndedMoney = new_day();
	}
}

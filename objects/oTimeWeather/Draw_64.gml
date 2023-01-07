var _hour = string(global.time.hour)
var _minute = string(global.time.minute);
var _day = "Day: " + string(global.time.day);

if (global.time.hour < 10){
	_hour = "0" + string(global.time.hour);
}

if (global.time.minute < 10){
	_minute = "0" + string(global.time.minute);
}

draw_text(5,5,_hour +":" + _minute);
draw_text(5,25,_day);
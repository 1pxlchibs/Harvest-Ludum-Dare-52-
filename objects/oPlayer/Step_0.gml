depth = -y;

mask_index = get_sprite("idle");

fsm.step();

fsm.trigger("t_idle");
fsm.trigger("t_run");

oCamera.moveToObject(id);

if (keyboard_check_pressed(ord("F"))){
	global.time.day++;	
}
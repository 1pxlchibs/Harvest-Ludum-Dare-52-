depth = -y;

fsm.step();

fsm.trigger("t_idle");
fsm.trigger("t_run");

oCamera.moveToObject(id);


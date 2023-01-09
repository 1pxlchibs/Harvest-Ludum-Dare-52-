fsm.step();

x = oPlayer.x;
y = oPlayer.y;

depth = oPlayer.depth+1;

switch(item_struct.type){
	case "tech":
		x_offset = -8;
		y_offset = -32;
	break;
}

interact_x_lerp = lerp(interact_x_lerp,interact_x,0.3);
interact_y_lerp = lerp(interact_y_lerp,interact_y,0.3);

if (item_struct = -1 || pxl_inventory_get(global.playerInv,oPlayer.currentHeld) = -1){
	instance_destroy();
}
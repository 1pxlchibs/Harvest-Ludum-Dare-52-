fsm.step();

x = ownerId.x;
y = ownerId.y;

depth = ownerId.depth+1;

switch(item_struct.type){
	case "tech":
		x_offset = -8;
		y_offset = -32;
	break;
}

interact_x_lerp = lerp(interact_x_lerp,interact_x,0.3);
interact_y_lerp = lerp(interact_y_lerp,interact_y,0.3);

if (item_struct = -1 || pxl_inventory_get(global.playerInv,ownerId.currentHeld) = -1){
	instance_destroy();
}
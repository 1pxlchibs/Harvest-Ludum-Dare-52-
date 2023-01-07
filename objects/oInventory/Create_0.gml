for(var i = 0; i < array_length(inventory); i++;){
	var xoffset = x + (i mod columns) * 33;
	var yoffset = y +  (i div columns) * 33;
	
	instance_create_depth(xoffset, yoffset, D_GUI_MIDDLE, oSlot, {
		sprite_index : sSlot,
		inventoryRef : inventory,
		inventoryPos : i
	});	
}

drawGUI = function(){
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, global.settings.inGameResW, global.settings.inGameResH, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	if (global.inventoryManager.itemCurrent != -1){
		var _string = global.inventoryManager.itemCurrent.name[$ global.settings.language];
		draw_text(oCursor.xGui, oCursor.yGui, _string);
		
		if (global.inventoryManager.itemCurrent.stack > 1){
			draw_text(oCursor.xGui, oCursor.yGui+10, string(global.inventoryManager.itemCurrent.stack));
		}
	}
}
event_inherited();

clicked = function(){
	//if slot not empty
	if (inventoryRef[inventoryPos] != -1){
		//if currently holding an item
		if (global.inventoryManager.itemCurrent != -1){
			//if slot has same item as held and can be stacked, stack it
			if (global.inventoryManager.itemCurrent.id = inventoryRef[inventoryPos].id){
				inventoryRef[inventoryPos].stack += global.inventoryManager.itemCurrent.stack;
				
				//clear old slot
				array_set(global.inventoryManager.itemOldInventory, global.inventoryManager.itemOldPos, -1);
			
				//clear item
				global.inventoryManager.itemCurrent = -1;
				global.inventoryManager.itemOldPos = -1;
				global.inventoryManager.itemOldInventory = -1;
			} else{
				//replace old slot with new slot
				array_set(global.inventoryManager.itemOldInventory, global.inventoryManager.itemOldPos, inventoryRef[inventoryPos]);
			
				//place item to new slot
				inventoryRef[inventoryPos] = variable_struct_copy(global.inventoryManager.itemCurrent);
				
				//clear item
				global.inventoryManager.itemOldPos = -1;
				global.inventoryManager.itemOldInventory= -1;
				global.inventoryManager.itemCurrent = -1;
			}
		} else{
			//if not holding an item
			global.inventoryManager.itemCurrent = variable_struct_copy(inventoryRef[inventoryPos]); //take the item
			global.inventoryManager.itemOldPos = inventoryPos; //take note of old position
			global.inventoryManager.itemOldInventory= inventoryRef; //take note of old inventory
			
			array_set(inventoryRef,inventoryPos, -1);
		}
	} else{
		//if slot empty
		//if currently holding an item
		if (global.inventoryManager.itemCurrent != -1){	
			//place item to new slot
			inventoryRef[inventoryPos] = variable_struct_copy(global.inventoryManager.itemCurrent);
				
			//clear item
			global.inventoryManager.itemOldPos = -1;
			global.inventoryManager.itemOldInventory= -1;
			global.inventoryManager.itemCurrent = -1;
		}
	}
}
	
alt_clicked = function(){
	//if slot not empty
	if (inventoryRef[inventoryPos] != -1){
		//if currently holding an item
		if (global.inventoryManager.itemCurrent != -1){
			//if slot has same item as held and can be stacked, stack it
			if (global.inventoryManager.itemCurrent.id = inventoryRef[inventoryPos].id){
				inventoryRef[inventoryPos].stack++;
				global.inventoryManager.itemCurrent.stack--;
			} else{
				//switch items
				var _slotItem = inventoryRef[inventoryPos];
				var _heldItem = global.inventoryManager.itemCurrent;
				
				inventoryRef[inventoryPos] = variable_struct_copy(_heldItem);
				global.inventoryManager.itemCurrent = variable_struct_copy(_slotItem);
			}
		} else{
			//if not holding an item
			if (inventoryRef[inventoryPos].stack > 1){
				var stackSplit = round(inventoryRef[inventoryPos].stack/2);
				
				global.inventoryManager.itemCurrent = variable_struct_copy(inventoryRef[inventoryPos]);
				global.inventoryManager.itemCurrent.stack = stackSplit;
				
				inventoryRef[inventoryPos].stack -= stackSplit;
				
			} else{
				global.inventoryManager.itemCurrent = variable_struct_copy(inventoryRef[inventoryPos]);
				
				array_set(inventoryRef,inventoryPos, -1);
			}
		}
	} else{
		//if slot empty
		//if currently holding an item
		if (global.inventoryManager.itemCurrent != -1){
			inventoryRef[inventoryPos] = variable_struct_copy(global.inventoryManager.itemCurrent);
			inventoryRef[inventoryPos].stack = 1;
			
			global.inventoryManager.itemCurrent.stack--;
		}
	}
}

cursorIn = function(){
	return point_in_rectangle(oCursor.xGui, oCursor.yGui, x - sprite_width / 2, y - sprite_height / 2 - 2, x + sprite_width / 2, y + sprite_height / 2 - 2);	
}

step = function(){
	if (inventoryRef[inventoryPos] != -1){
		if (inventoryRef[inventoryPos].stack	< 1){
			array_set(inventoryRef,inventoryPos, -1);
		}
	}
	
	if (global.inventoryManager.itemCurrent != -1){
		if (global.inventoryManager.itemCurrent.stack < 1){
			global.inventoryManager.itemCurrent = -1;
		}
	}
}

drawGUI = function(){
	var _color = c_white;
	if (hover){
		_color = c_red;	
		
		if (input_check_pressed("shoot")){
			clicked();
		}
		if (input_check_pressed("alt_shoot")){
			alt_clicked();
		}
	}
	
	draw_set_color(_color);
	draw_sprite(sprite_index, image_index, x, y);	
	if (inventoryRef[inventoryPos] != -1){
		draw_set_halign(fa_middle);
		draw_set_valign(fa_middle);
		draw_text(x, y, string(inventoryRef[inventoryPos].id));
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		if (inventoryRef[inventoryPos].stack > 1){
			draw_text(x, y, string(inventoryRef[inventoryPos].stack));
		}
	}
	draw_set_color(c_white);
}
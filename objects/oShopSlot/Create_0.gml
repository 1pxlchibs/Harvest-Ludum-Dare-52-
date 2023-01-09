event_inherited();
hover = false;

clicked = function(){
	//if slot not empty
	if (inventoryRef[inventoryPos] != -1){
		//if currently holding an item
		if (global.inventoryManager.itemCurrent = -1 && global.stats.money >= inventoryRef[inventoryPos].price){
			global.stats.money -= inventoryRef[inventoryPos].price;
			
			global.inventoryManager.itemCurrent = variable_struct_copy(inventoryRef[inventoryPos]); //take the item
			global.inventoryManager.itemOldPos = inventoryPos; //take note of old position
			global.inventoryManager.itemOldInventory= inventoryRef; //take note of old inventory
			
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
	return point_in_rectangle(oCursor.xGui, oCursor.yGui, x+invID.xx - sprite_width / 2, y+invID.yy - sprite_height / 2 - 2, x + sprite_width / 2, y + sprite_height / 2 - 2);	
}

step = function(){
	if (inventoryRef[inventoryPos] != -1){
		if (inventoryRef[inventoryPos].stack < 1){
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
	}
	
	draw_set_color(_color);
	draw_sprite(sprite_index, image_index, x+invID.xx, y+invID.yy);	
	if (inventoryRef[inventoryPos] != -1){
		var _sprite = asset_get_index("spr_"+inventoryRef[inventoryPos].id);
		var width = sprite_get_width(_sprite);
		var height = sprite_get_height(_sprite);

		var xoffset = sprite_get_xoffset(_sprite);
		var yoffset = sprite_get_yoffset(_sprite);
		
		var xmid = width/2-xoffset;
		var ymid = height/2-yoffset;
		var _x = x+invID.xx-xmid;
		var _y = y+invID.yy-ymid;
		
		var _image = 0;
		switch(inventoryRef[inventoryPos].type){
			case "vegetable":
				var _sprite = asset_get_index("spr_"+inventoryRef[inventoryPos].id+"_icon");
			break;
			case "fruit":
				var _sprite = asset_get_index("spr_"+inventoryRef[inventoryPos].id+"_icon");
			break;
		}
			
		draw_sprite(_sprite, _image, _x, _y);

		scribble("[fDefaultBold]"+string(inventoryRef[inventoryPos].price)+"$").blend(#B7DDEA,1).transform(0.5,0.5,0).draw(x+invID.xx+4, y+invID.yy+4);
	}
	draw_set_color(c_white);
}
	
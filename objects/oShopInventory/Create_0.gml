var _id = id;

for(var i = 0; i < array_length(inventory); i++;){
	var xoffset = x + (i mod columns) * 33 - (columns/2*33);
	var yoffset = y +  (i div columns) * 33 - ((array_length(inventory)/columns)/2*33);
	
	instance_create_depth(xoffset, yoffset, D_GUI_MIDDLE, oShopSlot, {
		sprite_index : sSlot,
		inventoryRef : inventory,
		inventoryPos : i,
		invID: _id
	});	
}

drawGUI = function(){
	if (global.inventoryManager.itemCurrent != -1){
		var _sprite = asset_get_index("spr_"+global.inventoryManager.itemCurrent.id);
		var _image = 0;
			
		draw_sprite(_sprite, _image, oCursor.xGui, oCursor.yGui);

		if (global.inventoryManager.itemCurrent.stack > 1){
			draw_text(oCursor.xGui, oCursor.yGui+10, string(global.inventoryManager.itemCurrent.stack));
		}
	}
}
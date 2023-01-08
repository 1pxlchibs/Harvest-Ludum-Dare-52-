if (loot_struct != -1){
	sprite_index = asset_get_index("spr_"+loot_struct.id);
	switch(loot_struct.type){
		case "tool":
			image_index = 0;
		break;
		case "crop":
			image_index = 0;
		break;
		case "vegetable":
			image_index = image_number-1;
		break;
		case "fruit":
			image_index = image_number-1;
		break;
	}
	
	draw_sprite(sprite_index,image_index,x,y);
}
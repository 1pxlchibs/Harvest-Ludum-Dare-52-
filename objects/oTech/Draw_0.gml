if (tech_struct != -1){
	if (hour != global.time.minute){
		oController.power_level += tech_struct.power;
		hour = global.time.minute;
	}
	sprite_index = asset_get_index("spr_"+tech_struct.id);
	draw_sprite(sprite_index,image_index,x,y);
}
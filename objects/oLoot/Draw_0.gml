if (loot_struct != -1){
	loot_shine += 0.2;
	
	
	
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
	
	var _sine = sine_between(current_time/1000,2,0,4);
	
	draw_spot_shadow(0,7,,,0.3);
	
	//if (!surface_exists(loot_surf)){
	//	loot_surf = surface_create(32,32);
	//}
	//surface_set_target(loot_surf);
	//draw_sprite(sprite_index,image_index,0,0);
	
	//gpu_set_colorwriteenable(1,1,1,0);
	//draw_sprite(sItemShine,loot_shine,0,0);
	//gpu_set_colorwriteenable(1,1,1,1);
	//surface_reset_target();
	
	//draw_surface_ext(loot_surf,x,y+_sine-z,1,1,0,c_white,1);
	
	draw_sprite(sprite_index,image_index,x,y+_sine-z);
	
}
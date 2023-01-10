draw_self();


if (data != -1){
	draw_sprite(asset_get_index("spr_"+data.returns+"_crop"),data.currentStage,x,y);
	
	//if (grown){
	//	loot_shine += 0.2;
	
	//	if (!surface_exists(loot_surf)){
	//		loot_surf = surface_create(32,32);
	//	}
	
	//	surface_set_target(loot_surf);
	//	draw_sprite(asset_get_index("spr_"+plant.id),plant.currentStage,0,0);
	
	//	gpu_set_colorwriteenable(1,1,1,0);
	//	draw_sprite(sItemShine,loot_shine,0,-16);
	//	gpu_set_colorwriteenable(1,1,1,1);
	//	surface_reset_target();
	
	//	draw_surface_ext(loot_surf,x,y,1,1,0,c_white,1);
	//}
}
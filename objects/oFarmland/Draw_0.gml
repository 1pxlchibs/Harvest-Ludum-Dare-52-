draw_self();

if (plant != -1){
	draw_sprite(asset_get_index("spr_"+plant.id),plant.currentStage,x,y);
}
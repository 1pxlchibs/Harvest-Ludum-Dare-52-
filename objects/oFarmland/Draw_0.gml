draw_self();

if (plant != -1){
	draw_sprite(asset_get_index("spr_"+plant.returns),plant.currentStage,x,y);
}
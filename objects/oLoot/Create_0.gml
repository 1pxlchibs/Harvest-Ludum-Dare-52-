depth = -y;
image_speed = 0;

loot_surf = 0;
loot_shine = 0;

loot_struct = -1;

loot_speed = 0;

timers = new PXLTimer();

timers.add("move",0.2*game_get_speed(gamespeed_fps),function(){
	depth = -y;
	if (distance_to_object(oPlayer) < 32){
		loot_speed = lerp(loot_speed,3,0.1);
		mp_potential_step_object(oPlayer.x,oPlayer.y,loot_speed,oParentCollider);
	
		if (distance_to_object(oPlayer) < 4){
			pxl_inventory_add(global.playerInv,loot_struct);
			instance_destroy();
		}
	}
});
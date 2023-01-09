if (timers.step("move")){
	depth = -y;
	if (distance_to_object(oPlayer) < 32){
		active = true;
	}
	if (active){
		loot_speed = lerp(loot_speed,3,0.1);
		direction = lerp(direction,point_direction(x,y,oPlayer.x,oPlayer.y),0.5);
		speed = loot_speed;
	
		if (distance_to_object(oPlayer) < 4){
			pxl_inventory_add(global.playerInv,loot_struct);
			instance_destroy();
			
			audio_play_sound(sndLoot,10,false,1,0,oController.lootpitch);
			oController.lootpitch += 0.05;
			oController.timers.reset("lootpitch");
			
			show_debug_message("destroyed");
		}
	}	
} else{
	if (z > 0) {
		z += zspeed;
		zspeed += zgravity;
	}
	if (z < 0){
		bounced = true;
		z = -z;
		zspeed = abs(zspeed) * 0.6 - 0.7;
		if (zspeed < 1){
			z = 0;
			zspeed = 0;
		}
	}

	x += lengthdir_x(_speed*delta_time_get(), _direction);
	y += lengthdir_y(_speed*delta_time_get(), _direction);
		
	_speed -= _speed*0.02;
}

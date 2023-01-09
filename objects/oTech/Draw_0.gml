if (tech_struct != -1){
	if(irandom(8) = 1){
		var _ranx = irandom_range(-8,8);
		var _rany = irandom_range(-8,8);
		advanced_part_particles_create(oParticleManager.part_sys,x+8-_ranx,y-_rany+8,oParticleManager.part_bolt,1);
	}
			
	if (hour != global.time.minute){
		global.stats.power_level += tech_struct.power;
		hour = global.time.minute;
	}

	sprite_index = asset_get_index("spr_"+tech_struct.id);
	draw_sprite(sprite_index,image_index,x,y);
}
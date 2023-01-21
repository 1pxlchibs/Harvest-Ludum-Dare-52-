if (hit){
	if (timers.step("durability")){
		pxl_data_spawn_item(x,y,data,drop_amount);
		instance_destroy();
	}
	hit = false;
}
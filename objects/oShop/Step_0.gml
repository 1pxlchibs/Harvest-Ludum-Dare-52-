if (showInventory){
	if (input_check_pressed("inventory")){
		showInventory = false;
	}
	if (inventory = -1){
		inventory = pxl_inventory_shop_create(global.settings.inGameResW*0.65,global.settings.inGameResH/2,global.shop_inventory);
		player_inventory = pxl_inventory_create(global.settings.inGameResW*0.35,global.settings.inGameResH/2,global.playerInv);
	}
} else{
	if (inventory != -1){
		instance_destroy(inventory);
		instance_destroy(player_inventory);
		inventory = -1;
		player_inventory = -1;
	}
}

if (!oHud.showInventory){
	if (interact()){
		showInventory = !showInventory;
	}
}
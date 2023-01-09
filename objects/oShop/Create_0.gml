/// @description Insert description here
// You can write your code in this editor
global.shop_inventory = array_create(16,-1);

pxl_inventory_add(global.shop_inventory,pxl_data_get_item("beetroot_seeds"));
pxl_inventory_add(global.shop_inventory,pxl_data_get_item("cabbage_seeds"));
pxl_inventory_add(global.shop_inventory,pxl_data_get_item("carrot_seeds"));
pxl_inventory_add(global.shop_inventory,pxl_data_get_item("cauliflower_seeds"));
pxl_inventory_add(global.shop_inventory,pxl_data_get_item("corn_seeds"));
pxl_inventory_add(global.shop_inventory,pxl_data_get_item("onion_seeds"));
pxl_inventory_add(global.shop_inventory,pxl_data_get_item("potato_seeds"));
pxl_inventory_add(global.shop_inventory,pxl_data_get_item("pumpkin_seeds"));
pxl_inventory_add(global.shop_inventory,pxl_data_get_item("strawberry_seeds"));
pxl_inventory_add(global.shop_inventory,pxl_data_get_item("tomato_seeds"));
pxl_inventory_add(global.shop_inventory,pxl_data_get_item("wheat_seeds"));
pxl_inventory_add(global.shop_inventory,pxl_data_get_item("solar_panel_1"));
pxl_inventory_add(global.shop_inventory,pxl_data_get_item("solar_panel_2"));
pxl_inventory_add(global.shop_inventory,pxl_data_get_item("solar_panel_3"));

image_speed = 0;

showInventory = false;

inventory = -1;
player_inventory = -1;

depth = -y;



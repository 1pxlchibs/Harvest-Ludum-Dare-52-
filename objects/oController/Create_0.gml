#macro D_GUI_OVERTOP -13000
#macro D_GUI_TOP -12000
#macro D_GUI_MIDDLE -11000
#macro D_GUI_BOTTOM -10000
#macro D_CAMERA -9000

resolutionSelected = 1;

athing = false;

#region ------------------SETTINGS------------------
global.resolution[0][0] = 1280;
global.resolution[0][1] = 720;

global.resolution[1][0] = 1920;
global.resolution[1][1] = 1080;

global.settings = {
	inGameResW : 512,
	inGameResH : 288,
	
	guiResW : global.resolution[other.resolutionSelected][0],
	guiResH : global.resolution[other.resolutionSelected][1],
	
	language : "eng"
}
#endregion

#region ----------INVENTORY MASTER----------
global.inventoryManager = {
	itemCurrent : -1,
	itemOldPos : -1,
	itemOldInventory : -1
}

global.playerInv = array_create(16,-1);

player_inventory = inventory_create(10,50,global.playerInv);

inventory_add(global.playerInv,pxldata_get_item("hoe"),1);
inventory_add(global.playerInv,pxldata_get_item("cabbage_seeds"),4);
inventory_add(global.playerInv,pxldata_get_item("carrot_seeds"),8);
#endregion

instance_create_depth(0,0,D_CAMERA,oCamera);
instance_create_depth(0,0,D_GUI_OVERTOP,oCursor);
instance_create_depth(0,0,D_GUI_OVERTOP,oParticleManager);
instance_create_depth(0,0,D_GUI_OVERTOP,oTimeWeather);

bulbRenderer = new BulbRenderer(#f9c57d, BULB_MODE.HARD_BM_ADD, true);

global.planters = array_create();

// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pxlui_create() constructor{
	
	//Create a struct for the ui controller, this will hold the pages.
	uiBook = {};
	
	anchorX = 200;
	anchorY = 200;
	
	function load_element(pageName, element, i){
		var t_x = element.xx;
		var t_y = element.yy;
		if (is_string(element.xx)){
			t_x = global.settings.inGameResW * (element.xx / 100);	
		}
		if (is_string(element.yy)){
			t_y = global.settings.inGameResH * (element.yy / 100);	
		}
		
		var inst = instance_create_depth(t_x, t_y, D_GUI_BOTTOM - i, element.object, element);
		with(inst){
			create(pageName, inst);	
		}
	}
	
	function add_page(pageName, pageArray){
		//add a page to the book
		uiBook[$ pageName] = pageArray;
	}
	
	function delete_page(pageName){
		//delete a page from the book
		variable_struct_remove(uiBook,pageName);
	}
	
	function load_page(pageName){
		var page = uiBook[$ pageName];
		
		if (!is_undefined(page)) {
			for(var i = 0; i < array_length(page); i++) {
				var element = page[i];
				load_element(pageName, element, i);
			}
		}
	}
		
	function close_page(pageName){
		with(pPXLUIElement){
			if (page = pageName){
				instance_destroy();	
			}
		}
	}
}
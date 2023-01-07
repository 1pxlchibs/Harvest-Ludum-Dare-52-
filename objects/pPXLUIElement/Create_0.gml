create = function(pageName, id){
	id.page = pageName;
	id.hover = false;
	id.depth_original = depth;
	id.color = c_white;
	id.alpha = 1;
	
	id.xMod = 0;
	id.yMod = 0;
	id.xscaleMod = 0;
	id.yscaleMod = 0;
	switch(id.halign){
		case fa_left:
			id.xalign = width/2;
			
			id.x1collision = 0;
			id.x2collision = width;
			
			id.htextAlign = width/2;
		break;
		case fa_middle:
			id.xalign = 0;
			
			id.x1collision = -width/2;
			id.x2collision = width/2;
			
			id.htextAlign = 0;
		break;
		case fa_right:
			id.xalign = -width/2;
			
			id.x1collision = -width;
			id.x2collision = 0;
			
			id.htextAlign = -width/2;
		break;
	}
	switch(id.valign){
		case fa_top:
			id.yalign = height/2;
			
			id.y1collision = 0;
			id.y2collision = height;
			
			id.vtextAlign = height/2;
		break;
		case fa_middle:
			id.yalign = 0;
			
			id.y1collision = -height/2;
			id.y2collision = height/2;
			
			id.vtextAlign = 0;
		break;
		case fa_bottom:
			id.yalign = -height/2;
			
			id.y1collision = -height;
			id.y2collision = 0;

			id.vtextAlign = -height/2;
		break;
	}
}

beginStep = function(id){
	id.hover = false;
	id.color = global.pxlui_theme[$ global.pxlui_theme_current].color.base;
}
	
step = function(id){
	
}

drawGUI = function(id){
	
}
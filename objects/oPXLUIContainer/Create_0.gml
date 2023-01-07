event_inherited();

create = function(pageName, id){
	id.page = pageName;
	id.hover = false;
	id.depth_original = depth;

	id.sprite = global.pxlui_theme[$ global.pxlui_theme_current].container;
	id.color = global.pxlui_theme[$ global.pxlui_theme_current].color.base;
	id.alpha = 0.7;
	
	id.xdif = 0;
	id.ydif = 0;
	
	id.drag = false;
	
	id.children = [];
	
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
			id.yalign = id.height/2;
			
			id.y1collision = 0;
			id.y2collision = id.height;
			
			id.vtextAlign = id.height/2;
		break;
		case fa_middle:
			id.yalign = 0;
			
			id.y1collision = -id.height/2;
			id.y2collision = id.height/2;
			
			id.vtextAlign = 0;
		break;
		case fa_bottom:
			id.yalign = -id.height/2;
			
			id.y1collision = -id.height;
			id.y2collision = 0;

			id.vtextAlign = -id.height/2;
		break;
	}
		
	if (!is_undefined(id.elements)){
		for(var i = 0; i < array_length(id.elements); i++) {
			var element = id.elements[i];
			
			var t_x = id.x + id.x1collision + element.xx;
			var t_y = id.y + id.y1collision + element.yy;
			if (is_string(element.xx)){
				t_x = id.x + id.x1collision + id.width * (element.xx / 100);	
			}
			if (is_string(element.yy)){
				t_y = id.y + id.y1collision + id.height * (element.yy / 100);	
			}

			var inst = instance_create_depth(t_x, t_y, id.depth_original - i-1, element.object, element);
			array_push(id.children,inst);
			with(inst){
				create(inst);	
			}
		}
	}
}

beginStep = function(id){
	id.hover = false;
	id.pressed = false;
	id.color = global.pxlui_theme[$ global.pxlui_theme_current].color.base;
}

cursorIn = function(){
	return point_in_rectangle(oCursor.xGui, oCursor.yGui, x + x1collision, y + y1collision, x + x2collision, y + y2collision);
}

_cursorIn = function(){
	if (point_in_rectangle(oCursor.xGui, oCursor.yGui, x + x1collision, y + y1collision, x + x2collision, y + y1collision + 16) || drag){
		return true;	
	}
	return false;
}

onhover = function(id){
	id.color = global.pxlui_theme[$ global.pxlui_theme_current].color.selection;
}

onclick = function(id){
	with(pPXLUIElement){
		id.depth = id.depth_original;
	}
	id.depth = id.depth_original - 100;
	
	for(var i = 0; i < array_length(id.children); i++){
		var element = id.children[i];
		element.depth = id.depth - i-1;
	}
	
	id.drag = true;
	
	id.xdif = oCursor.xGui - id.x;
	id.ydif = oCursor.yGui - id.y;
}

onhold = function(id){
	if (id.drag){
		id.x = oCursor.xGui - id.xdif;
		id.y = oCursor.yGui - id.ydif;
	
		for(var i = 0; i < array_length(id.children); i++) {
			var element = id.children[i];
		
			var t_x = id.x + id.x1collision + element.xx;
			var t_y = id.y + id.y1collision + element.yy;
			if (is_string(element.xx)){
				t_x = id.x + id.x1collision + id.width * (element.xx / 100);	
			}
			if (is_string(element.yy)){
				t_y = id.y + id.y1collision + id.height * (element.yy / 100);	
			}
			element.x = t_x;
			element.y = t_y;
		}
	}
}

onrelease = function(id){
	id.drag = false;
}

drawGUI = function(){
	if (id.hover || id.drag){
		if (id._cursorIn()){
			id.onhover(id);
		
			if (PXLUI_CLICK_CHECK_PRESSED) id.onclick(id);
		}
		if (PXLUI_CLICK_CHECK) id.onhold(id);
		if (PXLUI_CLICK_CHECK_RELEASED) id.onrelease(id);
	}

	draw_sprite_ext(id.sprite, 1, id.x + id.xalign + id.xMod,  id.y + id.yalign + id.yMod, 
					id.width/sprite_get_width(id.sprite) + id.xscaleMod, id.height/sprite_get_height(id.sprite) + id.yscaleMod,
					0,id.color,id.alpha);
					
	draw_sprite_ext(id.sprite, 0, id.x + id.xalign + id.xMod,  id.y + id.yalign + id.yMod, 
					id.width/sprite_get_width(id.sprite) + id.xscaleMod, id.height/sprite_get_height(id.sprite) + id.yscaleMod,
					0,id.color,1);
}
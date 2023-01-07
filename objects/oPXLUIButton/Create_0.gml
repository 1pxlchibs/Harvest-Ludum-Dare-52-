event_inherited();

create = function(pageName, id){
	id.page = pageName;
	id.hover = false;
	id.depth_original = depth;
	
	id.sprite = global.pxlui_theme[$ global.pxlui_theme_current].container;
	id.color = global.pxlui_theme[$ global.pxlui_theme_current].color.base;
	id.color2 = global.pxlui_theme[$ global.pxlui_theme_current].color.text.primary;
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
}

beginStep = function(id){
	id.hover = false;
	id.pressed = false;
	id.color = global.pxlui_theme[$ global.pxlui_theme_current].color.base;
	id.color2 = global.pxlui_theme[$ global.pxlui_theme_current].color.text.primary;
	id.font = global.pxlui_theme[$ global.pxlui_theme_current].fonts.text1;
}

cursorIn = function(){
	return point_in_rectangle(oCursor.xGui, oCursor.yGui, x + x1collision, y + y1collision, x + x2collision, y + y2collision);	
}

step = function(id){
	id.xscaleMod = lerp(id.xscaleMod, 0, PXLUI_EASE_SPEED);
	id.yscaleMod = lerp(yscaleMod, 0, PXLUI_EASE_SPEED);
	
	id.xMod = lerp(id.xMod, 0, PXLUI_EASE_SPEED);
	id.yMod = lerp(id.yMod, 0, PXLUI_EASE_SPEED);
}

onhover = function(id){
	id.xscaleMod = lerp(id.xscaleMod, 0.2, PXLUI_EASE_SPEED);
	id.yscaleMod = lerp(id.yscaleMod, 0.2, PXLUI_EASE_SPEED);
	
	id.color = global.pxlui_theme[$ global.pxlui_theme_current].color.selection;
	id.color2 = global.pxlui_theme[$ global.pxlui_theme_current].color.selection;
}

onclick = function(id){
	
}

onhold = function(id){
	id.xscaleMod = lerp(id.xscaleMod, -0.2, PXLUI_EASE_SPEED);
	id.yscaleMod = lerp(id.yscaleMod, -0.2, PXLUI_EASE_SPEED);
	
	id.yMod = 2;
}

onrelease = function(id){
	id.callback();
}

drawGUI = function(id){
	if (id.hover){
		id.onhover(id);
		
		if (PXLUI_CLICK_CHECK_PRESSED) id.onclick(id);
		if (PXLUI_CLICK_CHECK) id.onhold(id);
		if (PXLUI_CLICK_CHECK_RELEASED) id.onrelease(id);
	}
	
	draw_sprite_ext(id.sprite, 0, id.x + id.xalign + id.xMod,  id.y + id.yalign + id.yMod, 
					id.width/sprite_get_width(id.sprite) + id.xscaleMod, id.height/sprite_get_height(id.sprite) + id.yscaleMod,
					0,id.color,id.alpha);
					
	scribble("["+id.font+"]"+id.text).blend(id.color2, 1).align(fa_middle, fa_middle).draw(id.x + id.htextAlign + id.xMod, id.y + id.vtextAlign + id.yMod);
}
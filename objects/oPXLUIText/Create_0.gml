// Inherit the parent event
event_inherited();
create = function(pageName, id){
	id.page = pageName;
	id.hover = false;
	id.depth_original = depth;
	id.color = global.pxlui_theme[$ global.pxlui_theme_current].color.text.primary;
	id.alpha = 1;
}

beginStep = function(id){
	id.color = global.pxlui_theme[$ global.pxlui_theme_current].color.text.primary;
}

drawGUI = function(id){
	var _text = scribble("["+id.font+"]"+id.text).align(id.halign,id.valign).blend(id.color,id.alpha).transform(id.xscale,id.yscale,0);
	
	_text.draw(id.x, id.y);
}
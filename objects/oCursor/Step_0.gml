var _mouse_x = 0;
var _mouse_y = 0;

switch(input_profile_get()){
	case "gamepad":

	break;
	default:
		input_cursor_elastic_remove();
		input_cursor_limit_aabb(0,0,global.settings.guiResW,global.settings.guiResH);
		_mouse_x = input_cursor_x();
		_mouse_y = input_cursor_y();
	break;
}

var pos = GuiToRoom(_mouse_x,_mouse_y);

x = pos.x;
y = pos.y;

xGui = _mouse_x;
yGui = _mouse_y;

var element_pos = [];
with(pPXLUIElement){
	if (variable_instance_exists(id,"cursorIn")){
		if (cursorIn()){
			array_push(element_pos,id);
		}
	}
}
if (array_length(element_pos) > 0){
	array_sort(element_pos,function(inst1,inst2){
		return inst1.depth - inst2.depth; 
	});
	
	element_pos[0].hover = true;
	element_pos = [];
}


if (input_check_pressed("up")){
	cursorScan();	
}
var _hour = string(global.time.hour)
var _minute = string(global.time.minute);
var _day = "Day: " + string(global.time.day);

if (global.time.hour < 10){
	_hour = "0" + string(global.time.hour);
}

if (global.time.minute < 10){
	_minute = "0" + string(global.time.minute);
}
if (input_check_pressed("inventory")){
	showInventory = !showInventory;
}

if (showInventory){
	draw_set_alpha(0.5);
	draw_rectangle_color(0,0,global.settings.inGameResW,global.settings.inGameResH,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
	if (inventory = -1){
		inventory = pxl_inventory_create(global.settings.inGameResW/2,global.settings.inGameResH/2,global.playerInv);
	}
} else{
	if (inventory != -1){
		instance_destroy(inventory);
		inventory = -1;
	}
	
	for(var i = 0; i < 4; i++;){
		var _sprite = sSlot;
	
		var _width = 4*(36);

		var xx = global.settings.inGameResW/2-_width/2+(i*36)+16;
		var yy = global.settings.inGameResH-16;
	
		var _alpha = 1;
		var _col = c_gray;
	
		var _selected = oPlayer.currentHeld;
		if (_selected = i){
			_alpha = 1;
			_col = c_white;
		}
	
		draw_sprite_ext(_sprite,0,xx,yy,1,1,0,_col,_alpha);
	
		var _struct = global.playerInv[i];
		if (_struct != -1){
			_sprite = asset_get_index("spr_"+_struct.id);
			var width = sprite_get_width(_sprite);
			var height = sprite_get_height(_sprite);

			var xoffset = sprite_get_xoffset(_sprite);
			var yoffset = sprite_get_yoffset(_sprite);
		
			var xmid = width/2-xoffset;
			var ymid = height/2-yoffset;
			var _x = xx-xmid;
			var _y = yy-ymid;
		
		
			draw_sprite_ext(_sprite,0,_x,_y,1,1,0,_col,_alpha);
			
			if (_struct.stack > 1){
				scribble("[fDefaultBold]"+string(_struct.stack)).blend(#B7DDEA,1).transform(0.5,0.5,0).draw(xx+4,yy+4);
			}
		}
	}
}

scribble("[fDefaultBold]"+_hour +":" + _minute).blend(#B7DDEA,1).draw(5,5);
scribble("[fDefaultBold]"+_day).blend(#B7DDEA,1).draw(5,25);
scribble("[fDefaultBold]Money: "+string(global.stats.money)).blend(#B7DDEA,1).align(fa_right,fa_top).draw(global.settings.inGameResW-5,5);
scribble("[fDefaultBold]Energy: "+string(global.stats.power_level)).blend(#B7DDEA,1).align(fa_right,fa_top).draw(global.settings.inGameResW-5,25);

if (interact_prompt){
	scribble("[fDefaultBold]E to interact").blend(#B7DDEA,1).draw(5,global.settings.inGameResH-30);
}

interact_prompt = false;
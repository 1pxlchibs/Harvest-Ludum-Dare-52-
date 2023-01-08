event_user(15);

item_struct = -1;
image_speed = 0;

interact_x = x;
interact_y = y;

interact_x_lerp = x;
interact_y_lerp = y;

use = false;

timers = new PXLTimer();

timers.add("active_time",0.3*game_get_speed(gamespeed_fps));

fsm = new SnowState("idle");

fsm
	.event_set_default_function("draw",function() {
		sprite_index = asset_get_index("spr_"+item_struct.id);
		draw_sprite_ext(sprite_index,image_index,x,y,oPlayer.face * 1,1,350,c_white,1);
	})
	.add("idle",{
		enter: function(){
			use = false;
		},
		step: function(){
			interact_x = toTile(oCursor.x);
			interact_y = toTile(oCursor.y);

			interact_x = clamp(interact_x,toTile(oPlayer.x-16),toTile(oPlayer.x+16));
			interact_y = clamp(interact_y,toTile(oPlayer.y-16),toTile(oPlayer.y+16));
			
			if (use){
				fsm.change("active");
				return;
			}
			
			switch(item_struct.type){
				case "tool":
					image_index = 0;
				break;
				case "crop":
					image_index = 0;
				break;
				case "vegetable":
					image_index = image_number-1;
				break;
				case "fruit":
					image_index = image_number-1;
				break;
			}
		}
	})
	.add("active",{
		enter: function(){
			use = false;
		},
		step: function(){
			if (item_struct != -1){
				if (timers.step("active_time",true)){
					switch(item_struct.type){
						case "tool":
							switch(item_struct.tool){
								case "hoe":
									dig_spot(interact_x,interact_y);
								break;
							}
						break;
						case "crop":
							plant_spot(interact_x,interact_y);
						break;
					}
					
					fsm.change("idle");
					return;
				}
			}
		}
	})
event_user(15);

ownerId = oPlayer;

item_struct = -1;
image_speed = 0;

interact_x = x;
interact_y = y;

interact_x_lerp = x;
interact_y_lerp = y;

track_array = -1;

x_offset = 0;
y_offset = 0;

angle = 0;

use = false;

timers = new PXLTimer();

timers.add("active_time",0.3*game_get_speed(gamespeed_fps));

fsm = new SnowState("idle");

fsm
	.event_set_default_function("draw",function() {

		sprite_index = asset_get_index("spr_"+item_struct.id);
		draw_sprite_ext(sprite_index,image_index,x+x_offset*ownerId.face,y+y_offset,ownerId.face * 1, 1,ownerId.face * angle,c_white,1);
	})
	.add("idle",{
		enter: function(){
			use = false;
		},
		step: function(){
			interact_x = toTile(oCursor.x);
			interact_y = toTile(oCursor.y);

			interact_x = clamp(interact_x,toTile(ownerId.x-16),toTile(ownerId.x+16));
			interact_y = clamp(interact_y,toTile(ownerId.y-16),toTile(ownerId.y+16));
			
			if (use){
				fsm.change("active");
				return;
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
								case "wrench":
									remove_tech(interact_x,interact_y);
								break;
								case "axe":
									chop(interact_x,interact_y);
								break;
							}
						break;
						case "crop":
							plant_spot(interact_x,interact_y);
						break;
						case "tech":
							place_tech(interact_x,interact_y);
						break;
					}
					
					fsm.change("idle");
					return;
				}
			}
		}
	})
depth = -y;
image_speed = 0;

size = 9;
var _id = id;
instance_create_depth(toTile(x+16*size),toTile(y),0,oCloudHose,{
	sprite_index: sCloudHoseBackRight,
	parent: _id
});

instance_create_depth(toTile(x),toTile(y+16*size),0,oCloudHose,{
	sprite_index: sCloudHoseFrontLeft,
	parent: _id
});

instance_create_depth(toTile(x+16*size),toTile(y+16*size),0,oCloudHose,{
	sprite_index: sCloudHoseFrontRight,
	parent: _id
});

timers = new PXLTimer();

timers.add("cloud",5*game_get_speed(gamespeed_fps));

fsm = new SnowState("idle");

fsm
	.event_set_default_function("draw",function() {
		//draw this no matter what state we are in
		var _held = pxl_inventory_get(global.playerInv,currentHeld);
				
		interactXLerp = lerp(interactXLerp,interactX,0.3);
		interactYLerp = lerp(interactYLerp,interactY,0.3);
		draw_sprite_ext(sPlantable,0,interactXLerp,interactYLerp,1,1,0,c_white,0.6);

		
		draw_sprite_ext(sprite_index, image_index, x, y, face * image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		
		if (_held != -1){
			var _id = _held.id;
			draw_sprite_ext(asset_get_index("spr_"+_id),0,x,y,face * 1,1,340,c_white,1);
		}
	})
	.add("idle",{
		enter : function(){
			image_speed = 0;
			image_index = 0;
		},
		step : function(){
			if (distance_to_object(oPlayer) < 16){
				if (input_check_pressed("interact")){
					fsm.change("rise");
					return;
				}
			}
		}
	})
	.add("rise",{
		enter : function(){
			image_speed = 1;
			image_index = 0;
		},
		step : function(){
			if (distance_to_object(oPlayer) < 16){
				if (animation_end()){
					fsm.change("cloud");
					return;
				}
			}
		}
	})
	.add("lower",{
		enter : function(){
			image_speed = -1;
			image_index = image_number-1;
		},
		step : function(){
			if (distance_to_object(oPlayer) < 16){
				if (image_index = 0){
					fsm.change("idle");
					return;
				}
			}
		}
	})
	.add("cloud",{
		enter : function(){
			image_speed = 0;
			image_index = image_number-1;
		},
		step : function(){
			if (distance_to_object(oPlayer) < 16){
				if (timers.step("cloud", true)){
					fsm.change("lower");
					return;
				}
			}
		}
	})
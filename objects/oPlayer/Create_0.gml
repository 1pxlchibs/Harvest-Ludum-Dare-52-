// Declare methods
event_user(15);

currentHeld = 0;

face = 1;
spd = 100;

hspd			= 0;
vspd			= 0;
xx				= 0;
yy				= 0;

interactX = x;
interactY = y;

interactXLerp = x;
interactYLerp = y;

init_sprite();

sprite_index = get_sprite("idle");

timers = new PXLTimer();

timers.add("dig",0.5*game_get_speed(gamespeed_fps));

fsm = new SnowState("idle");

fsm
	.event_set_default_function("draw",function() {
		//draw this no matter what state we are in
		var _held = inventory_get(global.playerInv,currentHeld);
				
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
			sprite_index = get_sprite();
			image_index = 0;
		},
		step : function(){
			interactX = toTile(oCursor.x);
			interactY = toTile(oCursor.y);

			interactX = clamp(interactX,toTile(x-16),toTile(x+16));
			interactY = clamp(interactY,toTile(y-16),toTile(y+16));
			
			set_facing();
			get_input();
			
			var _held = inventory_get(global.playerInv,currentHeld);
			if (_held != -1){
				if (input_check_pressed("shoot")){
					var _id = _held.id;
					
					if (_id = "hoe"){
						fsm.change("dig");
						return;
					}
				
					if (_held.type = "crop"){
						fsm.change("plant");
						return;
					}
				}
			}
		}
	})
	.add("run",{
		enter : function(){
			image_index = 0;
		},
		step : function(){
			interactX = toTile(oCursor.x);
			interactY = toTile(oCursor.y);

			interactX = clamp(interactX,toTile(x-16),toTile(x+16));
			interactY = clamp(interactY,toTile(y-16),toTile(y+16));

			var _held = inventory_get(global.playerInv,currentHeld);
			if (_held != -1){
				if (input_check_pressed("shoot")){
					var _id = _held.id;
					
					if (_id = "hoe"){
						fsm.change("dig");
						return;
					}
				
					if (_held.type = "crop"){
						fsm.change("plant");
						return;
					}
				}
			}
			
			set_facing();
			
			get_input();
			get_move();
			//set_direction_sprite();
			
			var _spd = spd;
	
			hspd=xx*_spd;
			vspd=yy*_spd;
			
			direction = point_direction(0,0,xx,yy);
			hspd = lengthdir_x(_spd*delta_time_get(),direction);
			vspd = lengthdir_y(_spd*delta_time_get(),direction);
		},
	})
	.add("dig",{
		enter : function(){
			image_index = 0;
		},
		step : function(){
			if (timers.step("dig", true)){
				dig_spot(x,y);
				
				fsm.change("idle");
				return;
			}
		}
	})
	.add("plant",{
		enter : function(){
			image_index = 0;
		},
		step : function(){
			plant_spot(x,y);
				
			fsm.change("idle");
			return;
		}
	})
	.add_transition("t_run","idle","run",function(){
		if (xx != 0 or yy != 0){
			return true;
		}	
	})
	.add_transition("t_idle","run","idle",function(){
		if (xx = 0 and yy = 0){
			return true;
		}
	})
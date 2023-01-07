// Declare methods
event_user(15);

currentHeld = 0;

face = 1;
spd = 100;

hspd			= 0;
vspd			= 0;
xx				= 0;
yy				= 0;

init_sprite();

sprite_index = get_sprite("idle");

timers = new PXLTimer();

timers.add("dig",0.5*game_get_speed(gamespeed_fps));

fsm = new SnowState("idle");

fsm
	.history_enable()
	.history_set_max_size(20)
	.event_set_default_function("draw",function() {
		//draw this no matter what state we are in
		draw_sprite_ext(sPlantable,0,toTile(x),toTile(y),1,1,0,c_white,0.6);
		
		draw_sprite_ext(sprite_index, image_index, x, y, face * image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		
		var _held = global.playerInv[currentHeld];
		if (_held != -1){
			var _id = _held.id[$ global.settings.language];

			draw_sprite_ext(asset_get_index("spr_"+_id),0,x,y,1,1,340,c_white,1);
		}
	})
	.add("idle",{
		enter : function(){
			sprite_index = get_sprite();
			image_index = 0;
		},
		step : function(){
			set_facing();
			get_input();
			
			if (input_check_pressed("interact")){
				fsm.change("dig");
				return;
			}
		}
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
	.add("run",{
		enter : function(){
			image_index = 0;
		},
		step : function(){
			if (input_check_pressed("interact")){
				fsm.change("dig");
				return;
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
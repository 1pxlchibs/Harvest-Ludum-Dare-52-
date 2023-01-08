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
update_held();

sprite_index = get_sprite("idle");

timers = new PXLTimer();

timers.add("interact",0.3*game_get_speed(gamespeed_fps));

fsm = new SnowState("idle");

fsm
	.event_set_default_function("draw",function() {
		//draw this no matter what state we are in
		if (instance_exists(oHeld)){
			draw_sprite_ext(sPlantable,0,oHeld.interact_x_lerp,oHeld.interact_y_lerp,1,1,0,c_white,0.6);
		}

		draw_sprite_ext(sprite_index, image_index, x, y, face * image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	})
	.add("idle",{
		enter : function(){
			sprite_index = get_sprite();
			image_index = 0;
		},
		step : function(){
			set_facing();
			get_input();
			
			switch_held();
			
			if (instance_exists(oHeld)){
				if (input_check_pressed("shoot")){
					fsm.change("interact");
					return;
				}
			}
		}
	})
	.add("run",{
		enter : function(){
			image_index = 0;
		},
		step : function(){
			switch_held();
			
			if (instance_exists(oHeld)){
				if (input_check_pressed("shoot")){
					fsm.change("interact");
					return;
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
	.add("interact",{
		enter : function(){
			with(oHeld){
				use = true;
			}
			image_index = 0;
		},
		step : function(){
			if (timers.step("interact", true)){
				fsm.change("idle");
				return;
			}
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
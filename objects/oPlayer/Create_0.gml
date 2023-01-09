// Declare methods


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



timers = new PXLTimer();

timers.add("interact",0.3*game_get_speed(gamespeed_fps));

fsm = new SnowState("idle");

event_user(15);
init_sprite();
update_held();

sprite_index = get_sprite("idle");

fsm
	.event_set_default_function("draw",function(){
		//draw this no matter what state we are in
		if (instance_exists(oHeld)){
			draw_sprite_ext(sSelection,current_time/100,oHeld.interact_x_lerp,oHeld.interact_y_lerp,1,1,0,c_white,0.6);
		}
		
		draw_spot_shadow(-1,8,,,0.3);
		draw_sprite_ext(hand_back, image_index, x, y, face * image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		draw_sprite_ext(sprite_index, image_index, x, y, face * image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		draw_sprite_ext(hand_front, image_index, x, y, face * image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	})
	.add("idle",{
		enter : function(){
			hand_back = get_sprite(fsm.get_current_state()+"_hand_back");
			hand_front = get_sprite(fsm.get_current_state()+"_hand_front");
			sprite_index = get_sprite();
			image_index = 0;
		},
		step : function(){
			set_facing();
			get_input();
			
			switch_held();
			
			if (instance_exists(oHeld)){
				if (input_check_pressed("shoot")){
					fsm.change("use");
					return;
				}
				if (input_check_pressed("alt_shoot")){
					fsm.change("alt_use");
					return;
				}
			}
		}
	})
	.add("run",{
		enter : function(){
			hand_back = get_sprite(fsm.get_current_state()+"_hand_back");
			hand_front = get_sprite(fsm.get_current_state()+"_hand_front");
			sprite_index = get_sprite();
			image_index = 0;
		},
		step : function(){
			switch_held();
			
			if (instance_exists(oHeld)){
				if (input_check_pressed("shoot")){
					fsm.change("use");
					return;
				}
			}
			
			set_facing();
			
			get_input();
			get_move();
			//set_direction_sprite();
		},
		footstep : function(){
			var _x = x;
			var _y = y;

			var _ran = irandom_range(-4,4);
			advanced_part_particles_create(oParticleManager.part_sys,x-_ran,y-_ran+8,oParticleManager.part_dust,irandom_range(4,8));
			var _sound = choose(sndFootstepGrass1,sndFootstepGrass2,sndFootstepGrass3,sndFootstepGrass4,sndFootstepGrass5,
			sndFootstepGrass6,sndFootstepGrass7,sndFootstepGrass8,sndFootstepGrass9,sndFootstepGrass10);
			audio_play_sound(_sound,false,false);
		}
	})
	.add("use",{
		enter : function(){
			with(oHeld){
				use = true;
			}
			hand_back = get_sprite("idle_hand_back");
			hand_front = get_sprite("idle_hand_front");
			sprite_index = get_sprite("idle");
			image_index = 0;
		},
		step : function(){
			if (timers.step("interact", true)){
				fsm.change("idle");
				return;
			}
		}
	})
	.add("alt_use",{
		enter : function(){
			with(oHeld){
				alt_use = true;
			}
			hand_back = get_sprite("idle_hand_back");
			hand_front = get_sprite("idle_hand_front");
			sprite_index = get_sprite("idle");
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
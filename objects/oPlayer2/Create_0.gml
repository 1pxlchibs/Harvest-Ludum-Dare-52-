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

		}
	})
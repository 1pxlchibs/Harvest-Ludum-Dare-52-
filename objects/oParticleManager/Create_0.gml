part_sys = new advanced_part_system();

part_emitter1 = new advanced_part_emitter(part_sys, x-20, x+20, y-20, y+20, aps_shape.rectangle,aps_distr.linear);


part_dust = new advanced_part_type();
with(part_dust){
	part_life(30,60);
	part_size(0.4,0.6,-0.02,0);
	part_orientation(0,0,0,0,false);
	part_direction(0,180,0,0);
	part_speed(0.4,0.8,-0.1,0);
	part_image(sCircle,0,c_white,false,false,false);
}
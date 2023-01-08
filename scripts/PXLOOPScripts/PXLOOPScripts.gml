// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pxl_oop_create(x, y, depth) constructor{
	create_method = {};
	step_method = {};
	draw_method = {};
	_x = x;
	_y = y;
	_depth = depth;
	
	static create = function(_method){
		create_method = _method;
	}
	
	static step = function(_method){
		step_method = _method;
	}
	
	static draw = function(_method){
		draw_method = _method;
	}
	
	static create_oop = function(){
		instance_create_depth(_x, _y, _depth, oOOp,{
			create: other.create_method,
			step: other.step_method,
			draw: other.draw_method
		});
	}
}
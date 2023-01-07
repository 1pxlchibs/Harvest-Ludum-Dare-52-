// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pxlui_container(x, y, width, height, halign = fa_middle, valign = fa_middle, elements, elementid){
	return {
		object: oPXLUIContainer,
		elementid: elementid,
		elements: elements,
		xx : x,
		yy : y,
		width: width,
		height: height,
		container_depth: 0,
		halign: halign,
		valign: valign
	};
}
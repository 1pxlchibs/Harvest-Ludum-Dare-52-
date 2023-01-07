// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UIElement(x, y, width, height, halign = fa_middle, valign = fa_middle){
	return {
		object: pPXLUIElement,
		xx : x,
		xy : y,
		width: width,
		height: height,
		halign: halign,
		valign: valign
	};
}
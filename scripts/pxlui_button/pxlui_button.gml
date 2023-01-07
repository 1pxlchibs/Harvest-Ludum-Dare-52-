// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pxlui_button(text, x, y, width, height, halign = fa_middle, valign = fa_middle, callback = function(){}, elementid = 0){
	return {
		object: oPXLUIButton,
		elementid: elementid,
		callback: callback,
		xx : x,
		yy : y,
		width: width,
		height: height,
		text: text,
		halign: halign,
		valign: valign
	};
}
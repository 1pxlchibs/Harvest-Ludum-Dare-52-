// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pxlui_checkbox(check, x, y, width = 16, height = 16, halign = fa_middle, valign = fa_middle, elementid = 0){
	return {
		object: oPXLUICheckbox,
		elementid: elementid,
		check: check,
		xx : x,
		yy : y,
		width: width,
		height: height,
		halign: halign,
		valign: valign
	};
}
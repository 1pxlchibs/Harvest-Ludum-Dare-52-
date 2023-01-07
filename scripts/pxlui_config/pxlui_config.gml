// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro PXLUI_CLICK_CHECK_PRESSED input_check_pressed("shoot")
#macro PXLUI_CLICK_CHECK input_check("shoot")
#macro PXLUI_CLICK_CHECK_RELEASED input_check_released("shoot")

#macro PXLUI_EASE_SPEED 0.1

global.pxlui_theme = {
	minimal:{
		container: spr_pxlui_container,
		button: spr_pxlui_container,
		checkbox: spr_pxlui_checkbox,
		
		color:{
			base: c_white,
			selection: c_red,
			
			text:{
				primary: c_white,
				secondary: c_ltgray
			}	
		},
		fonts:{
			text1: "fntMonogram_12",	
			text2: "fntMonogram_24"
		}
	},
	
	aqua:{
		container: spr_pxlui_container,
		button: spr_pxlui_container,
		checkbox: spr_pxlui_checkbox,
		
		color:{
			base: c_aqua,
			selection: c_blue,
			
			text:{
				primary: c_lime,
				secondary: c_ltgray
			}	
		},
		
		fonts:{
			text1: "fntMonogram_12",	
			text2: "fntMonogram_24"
		}
	}
}

global.pxlui_theme_current = "minimal";
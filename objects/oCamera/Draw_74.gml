if (surface_exists(view_surf)) {
	
	draw_surface_part_ext(view_surf,
				frac(x),frac(y),global.settings.inGameResW,global.settings.inGameResH,
				0 - (global.settings.inGameResW*zoomLerp - global.settings.inGameResW)/2,
				0 - (global.settings.inGameResH*zoomLerp - global.settings.inGameResH)/2,
				zoomLerp, zoomLerp,
				c_white,1);
	
	//draw_surface_part(view_surf, frac(x), frac(y), global.settings.inGameResW, global.settings.inGameResH, 0, 0);
	// or draw_surface(view_surf, -frac(x), -frac(y));
}



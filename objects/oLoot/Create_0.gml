depth = -y;
image_speed = 0;

z					= 8;
zspeed				= 3;
zgravity			= -0.3;
bounced			= false;

_speed = irandom_range(40,50);
_direction = irandom_range(45,135);

loot_surf = 0;
loot_shine = 0;

loot_struct = -1;

loot_speed = 0;

active = false;

timers = new PXLTimer();

timers.add("move",1*game_get_speed(gamespeed_fps));
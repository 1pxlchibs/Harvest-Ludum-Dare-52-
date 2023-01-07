depth = D_GUI_OVERTOP;

input_source_mode_set(INPUT_SOURCE_MODE.HOTSWAP);
input_cursor_coord_space_set(INPUT_COORD_SPACE.GUI);

input_cursor_set(global.settings.inGameResW/2, global.settings.inGameResH/2);
input_cursor_speed_set(20);

x = input_cursor_x();
y = input_cursor_y();

xGui = 0;
yGui = 0;

active_element = -1;
event_user(15);
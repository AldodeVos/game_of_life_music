image_xscale = global.scale/2;
image_yscale = global.scale/2;

last_browser_size = [browser_width,browser_height];

begin_point_x = x;
button_range = room_width/3;
x += button_range/2;


drag = false;
prev_x = 0; // not x because otherwise it waits till it's moved before changing the actual timer
bpm = 0;
image_xscale = global.scale/2;
image_yscale = global.scale/2;
last_browser_size = [browser_width,browser_height];


begin_point_x = x;
button_range = room_width/3;
x += button_range/2;
volume = 100;
volume_goal = 100;

drag = false;
prev_x = x+1; // not x because otherwise it waits till it's moved before changing the actual timer
dist = point_distance(begin_point_x,y,x,y);
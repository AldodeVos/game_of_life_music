window_set_size(browser_width,browser_height);
room_width = browser_width;
room_height = browser_height;
surface_resize(application_surface,room_width,room_height);
block_height = room_height/14;
global.scale = block_height/64;
last_browser_height = browser_height;
last_browser_width = browser_width;
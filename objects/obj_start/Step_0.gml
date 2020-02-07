//resize_room
if (last_browser_height != browser_height or last_browser_width != browser_width)
{
	last_browser_height = browser_height;
	last_browser_width = browser_width;
	room_width = browser_width;	
	room_height = browser_height;
	window_set_size(browser_width,browser_height);
	surface_resize(application_surface,room_width,room_height);
	block_height = room_height/14;
	global.scale = block_height/64;
}

if (mouse_check_button_pressed(mb_any)) //this room/object is here just for the auto-play blockers
{
	room_goto_next();
}
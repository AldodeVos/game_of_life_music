//scaling
if (last_browser_size[0] != browser_width or last_browser_size[1] != browser_height)
{
	last_browser_size = [browser_width,browser_height];
	x = room_width - room_height/14;
	y = room_height/14;
	image_xscale = global.scale*1.5;
	image_yscale = global.scale*1.5;
	y_scale = room_width/14/64;
	block_height = obj_controls.block_height;
}
//hover over colour
if (distance_to_point(mouse_x,mouse_y) < 1)
{
	image_index = 1;
} else {
	image_index = 0;
}

// click to show/hide controls
if ((mouse_check_button_pressed(mb_left)) and (global.click_depth = 0) and (distance_to_point(mouse_x,mouse_y) < 1))
{
	show_controls *= -1;
}

//scaling
if (last_browser_size[0] != browser_width or last_browser_size[1] != browser_height)
{
	last_browser_size = [browser_width,browser_height];
	x = room_width/2;
	y = room_height/14;
	image_xscale = global.scale*5;
	image_yscale = global.scale*1.5;
}

//mouse hover = change colour
if (distance_to_point(mouse_x,mouse_y) < 1)
{
	image_index = 1;
} else {
	image_index = 0;
}

// press T to change tonality
if (keyboard_check_pressed(ord("T"))) or ((mouse_check_button_pressed(mb_left)) and (global.click_depth = 0) and (distance_to_point(mouse_x,mouse_y) < 1))
{
	obj_controls.tonality = (obj_controls.tonality+1) mod 4;
}

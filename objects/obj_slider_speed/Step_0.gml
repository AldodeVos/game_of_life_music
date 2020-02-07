//scaling
if (last_browser_size[0] != browser_width or last_browser_size[1] != browser_height)
{
	last_browser_size = [browser_width,browser_height];
	image_xscale = browser_height/14/64/2;
	image_yscale = browser_height/14/64/2;
	button_range = browser_width/3;
	begin_point_x = browser_width/20;
	y = (browser_height/14)*1.5;
}

// drag button
if (mouse_check_button_pressed(mb_left) and (global.click_depth = 0) and distance_to_point(mouse_x,mouse_y) < 1)
{
	drag = true;
}

if mouse_check_button_released(mb_left)
{
	drag = false;
}

if (drag == true)
{
	if (mouse_x <= begin_point_x)
	{
		x = begin_point_x;
	} else {
		x = min(begin_point_x+button_range,mouse_x);
	}
}

//send value to controls
if !(prev_x == x)
{
	prev_x = x
	bpm = (point_distance(begin_point_x,y,x,y)/point_distance(begin_point_x,y,begin_point_x+button_range,y))*300;
	obj_controls.spd = 3600/other.bpm-1; // step timer will set itself to frames in a minute/bpm. -1 because timer ends on 0 and not 1.
}
	
	
	


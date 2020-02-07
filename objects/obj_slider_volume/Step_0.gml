//scaling
if (last_browser_size[0] != browser_width or last_browser_size[1] != browser_height)
{
	last_browser_size = [browser_width,browser_height];
	image_xscale = browser_height/14/64/2;
	image_yscale = browser_height/14/64/2;
	button_range = browser_width/3;
	begin_point_x = browser_width/20;
	y = (browser_height/14)*3;
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


//volume values

dist = point_distance(begin_point_x,y,x,y);

// this way no clicks will be heard and volume always has a fade-in and -out.
if (volume_goal > volume)
{
	volume += 1;
}
if (volume_goal < volume)
{
	volume -= 1;
}

if !(prev_x == x)
{
	prev_x = x
	volume_goal = (dist/button_range)*100;
}

audio_master_gain(volume/100);
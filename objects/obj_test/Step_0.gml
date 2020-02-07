// neighbours for neighbour-checks (groups and rules)

if !(initialize_buren) // can't put this in create event because then it triggers when others are not yet created
{
	initialize_buren = true;
	var max_width = obj_controls.max_width, right = 1, left = -1, up = -1, down = 1;
	var xx = check_xx, yy = check_yy;

	// if block is on one of the sides, it's neighbour is on the other side of the field.
	if (xx == 0)
	{
		left = max_width;
	}

	if (xx == max_width)
	{
		right = -max_width;
	}

	if (yy == 0)
	{
		up = 14;
	}

	if (yy == 14)
	{
		down = -14;
	}


	//who is the neighbour
	buur = [obj_controls.blocks[xx+left,yy+up],		//left up
			obj_controls.blocks[xx,yy+up],			//up
			obj_controls.blocks[xx+right,yy+up],	//right_up
			obj_controls.blocks[xx+right,yy],		//right
			obj_controls.blocks[xx+left,yy],		//left
			obj_controls.blocks[xx+right,yy+down],	//right_down
			obj_controls.blocks[xx+left,yy+down],	//left_down
			obj_controls.blocks[xx,yy+down]];		//down		
}

//draw and erase blocks with mouse

if (life_death = 1) and (mouse_check_button_pressed(mb_left) and (global.click_depth == 1) and (obj_controls.first_click == true) and (distance_to_point(mouse_x,mouse_y) < 1))
{
	clicked = true;
	life_death_next = 0;
	life_death = 0;
	image_index = 15;
	block_colour = block_number;
}

if (mouse_check_button_released(mb_left))
{
	clicked = false;
}


if (mouse_check_button(mb_left))
{
	if (clicked == false) and (life_death == 0) and (obj_controls.first_click == true) and (global.click_depth == 1) and (distance_to_point(mouse_x,mouse_y) < 1)
	{
		life_death_next = 1;
		life_death = 1;
		image_index = block_number - 15;
		block_colour = block_number;		
	}
}

if (mouse_check_button(mb_right)) and (global.click_depth == 1) and (distance_to_point(mouse_x,mouse_y) < 1)
{
	life_death_next = 0;
	life_death = 0;
	image_index = 15;
	block_colour = block_number;
}

// remember last pause state, go back to that when paused again
if (global.time == 50000)
{
	if (return_to_pause_state = true)
	{
		return_to_pause_state = false;
		life_death = pause_state_life_death;
		life_death_next = pause_state_life_death_next;
		image_index = pause_state_image;
	}
	pause_state_life_death = life_death;
	pause_state_life_death_next = life_death_next;
	pause_state_image = image_index;
} else {
	return_to_pause_state = true;
}

//global wipe
if (global.wipe == true){
	life_death_next = 0;
	life_death = 0;
	image_index = 15;
}
//clock
actual_delta = delta_time*0.000001
delta_multiplier = actual_delta/target_delta;

if (step_clock < 50000)
{
	step_clock -= 1*delta_multiplier;
}

global.time = step_clock;

if (step_clock <= 0 or (step_clock > spd and step_clock != 50000)) // time reset and clock cannot be higher than spd
{
	step_clock = spd;
}


//resize_room and replace blocks
if (last_browser_size[0] != browser_width or last_browser_size[1] != browser_height)
{
	last_browser_size = [browser_width,browser_height];
	room_width = browser_width;	
	room_height = browser_height;
	window_set_size(browser_width,browser_height);
	surface_resize(application_surface,room_width,room_height);
	block_height = room_height/14;
	global.scale = block_height/64;
	image_xscale = room_width/32;
	image_yscale = room_height/32
	x = room_width/2;
	y = room_height/2;
	
	instance_destroy(obj_block);
	for (var i = 0; i*block_height <= room_width; i += 1)
	{
		max_width = i	
	}
	for (var yy = 0; yy*block_height <= room_height; yy += 1)
	{
		for (var xx = 0; xx*block_height <= room_width; xx += 1)
		{
			blocks[xx,yy] = instance_create_layer(xx*block_height,yy*block_height,"Instances",obj_block);
			with blocks[xx,yy]
			{
				check_xx = xx;
				check_yy = yy;
			}
		}
	}
}

// first click (so that you don't make a block by pressing "start")
if (mouse_check_button_pressed(mb_any) and first_click == false)
{
	first_click = true;
}


//last step
if (keyboard_check_pressed(ord("G")))
{
	last_step = true;
}

// next step
if (keyboard_check_pressed(ord("K")))
{
	next_note = true;
}

//hold step
if (keyboard_check(ord("H")))
{
	hold = true;
} else {
	hold = false;
}


//fullscreen (pc only)
if (keyboard_check_pressed(ord("F")))
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
}


// pause
if (mouse_check_button_pressed(mb_left) and double_click_check+180000 > get_timer())
{
	double_click = true;
}

if (mouse_check_button_pressed(mb_left))
{
	double_click_check = get_timer();
}

if (keyboard_check_pressed(vk_space) or double_click == true)
{
	double_click = false;
	if (pause == true)
	{
		step_clock = spd;
		pause = false;
	}
	else
	{
		step_clock = 50000;
		pause = true;
	}
}

// speed control
if (keyboard_check(ord("L")))
{
	with (obj_slider_speed)
	{
		x += 0.5;
	}
}

if (keyboard_check(ord("J")))
{
	with (obj_slider_speed)
	{
		if (x > begin_point_x)
		{
			x -= 0.5;
		}
	}
}

//volume control
if (keyboard_check(ord("P")))
{
	with (obj_slider_volume)
	{
		if (x < begin_point_x+button_range)
		{
			x += 1;
		}
	}
}

if (keyboard_check(ord("I")))
{
	with (obj_slider_volume)
	{
		if (x > begin_point_x)
		{
			x -= 1;
		}
	}
}


//global wipe
if (keyboard_check_pressed(vk_backspace))
{
	global.wipe = true;
} else {
	global.wipe = false;
}


// global click_depth
global.click_depth = 1;	

for (var i = array_length_1d(list_depth_0)-1; i > -1; i -= 1)
{
	with (list_depth_0[i])
	if (distance_to_point(mouse_x,mouse_y) < 1) or (drag = true)
	{
		global.click_depth = 0;
	}
}


//TONALITY: major / minor / hexatonic / octatonic
if (global.time <= 0)
{
	if (tonality == 0)
	{	
		notes = [snd_1,snd_2,snd_3,snd_4,snd_5,snd_6,snd_7,snd_8,snd_9,snd_10,snd_11,snd_12,snd_13,snd_14,snd_15];
	}
	if (tonality == 1)
	{
		notes = [snd_1,snd_2,snd_3_min,snd_4,snd_5,snd_6_min,snd_7_min,snd_8,snd_9,snd_10_min,snd_11,snd_12,snd_13_min,snd_14_min,snd_15];
	}
	if (tonality == 2)
	{
		notes = [snd_1,snd_2,snd_3,snd_4_hex,snd_6_min,snd_7_min,snd_8,snd_9,snd_10,snd_10_hex,snd_13_min,snd_14_min,snd_15,snd_14_hex,snd_15_hex];
	}
	if (tonality == 3)
	{
		notes = [snd_1,snd_2,snd_3_min,snd_4,snd_4_hex,snd_6_min,snd_6,snd_7,snd_8,snd_9,snd_10_min,snd_11,snd_10_hex,snd_13_min,snd_13];
	}
}


//all blocks. life/death, colours and sound. 

if ((global.time <= 0) and (last_step == false) and (hold == false)) or (next_note == true and (clamp(global.time,spd/2-1*delta_multiplier,spd/2+1*delta_multiplier) == global.time))
{
	if (global.time > 0)
	{
		next_note = false;
	}
	// all notes off and remember them
	for (var i =  array_length_1d(notes_true)-1; i > -1; i -= 1)
	{
	
		last_step_notes[i] = notes_played[i];
		notes_true[i] = false;
	}
	// scanner 1
	for (var yy = 0; yy*block_height <= room_height; yy += 1)
	{
		for (var xx = 0; xx*block_height <= room_width; xx += 1)
		{
			with blocks[xx,yy]
			{
				// remember last step
				last_step_life = life_death;
				last_step_colour = image_index;
				
				//rules from Conway's game of life + reset colour
				var neighbours = neighbour_count()
				if(neighbours == 3)
				{
					life_death_next = 1;
				}
				else
				{
					if (neighbours != 2)
					{
						life_death_next = 0;
					}
				}
				block_colour = block_number;
				group_nr = 0;
				flip = false;
			}
		}
	}
	// initialize colours
	number_of_groups = 0;
	group_colour = [15];
	for (var xx = 0; xx*block_height <= room_width; xx += 1)
	{
		with blocks[xx,0]
		{
			if (buur[0].life_death_next == 1 or buur[1].life_death_next == 1 or buur[2].life_death_next == 1)
			{
				flip = true;
			} else {
				flip = false;
			}
		}
	}
	//scanner 2
	for (var yy = 0; yy*block_height <= room_height; yy += 1)
	{
		for (var xx = 0; xx*block_height <= room_width; xx += 1)
		{
			with blocks[xx,yy]
			{
				if (life_death_next == 1 and group_nr == 0)
				{
					obj_controls.number_of_groups += 1;
					group_nr = obj_controls.number_of_groups;
					obj_controls.group_colour[group_nr] = block_colour;
					make_group();
				}
			}
		}
	}
	
	//carry out colours and life_death 
	// scanner 3
	for (var yy = 0; yy*block_height <= room_height; yy += 1)
	{
		for (var xx = 0; xx*block_height <= room_width; xx += 1)
		{
			with blocks[xx,yy]
			{
				life_death = life_death_next;
				if (life_death == 1)
				{
					image_index = obj_controls.group_colour[group_nr]mod 15;
					obj_controls.notes_true[image_index] = true;
				} else {
					image_index = 15;
				}
			}
		}
	}
	//play notes that are on
	for (var i = array_length_1d(notes)-1; i > -1; i -= 1)
	{
		if (notes_true[i] == true)
		{
			if (notes_played[i] == false)
			{
				audio_play_sound(notes[i],1,0);
				notes_played[i] = true;
			}
		} else {
			notes_played[i] = false;
		}
	}
}

// last step
if (last_step == true and (global.time <= 0 or clamp(global.time,spd/2-1*delta_multiplier,spd/2+1*delta_multiplier) == global.time))
{
	last_step = false;
	for (var yy = 0; yy*block_height <= room_height; yy += 1)
	{
		for (var xx = 0; xx*block_height <= room_width; xx += 1)
		{
			with blocks[xx,yy]
			{
				image_index = last_step_colour;
				life_death = last_step_life;
			}
		}
	}
	
	for (var i = array_length_1d(notes)-1; i > -1; i -= 1)
	{
		if (last_step_notes[i] == true)
		{
				audio_play_sound(notes[i],1,0);
				notes_played[i] = true;
		} else {
			notes_played[i] = false;
		}
	}
}

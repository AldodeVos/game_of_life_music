window_set_size(browser_width,browser_height);
room_width = browser_width;
room_height = browser_height;
surface_resize(application_surface,room_width,room_height);
image_xscale = room_width/32;
image_yscale = room_height/32
x = room_width/2;
y = room_height/2;

block_height = room_height/14;
global.scale = block_height/64;
last_browser_size = [browser_width,browser_height];

step_clock = 50000;
global.time = 50000;

target_delta = 1/60;
actual_delta = delta_time*0.000001
delta_multiplier = actual_delta/target_delta;


pause = true;
first_click = false;
hold = false;
next_note = false;
last_step = false;
last_step_notes = [];

spd = 15;
alarm[0] = -1;
global.wipe = false;
global.click_depth = 1;
tonality = 0;
double_click = false;
double_click_check = get_timer();

number_of_groups = 0;
group_colour = [15];
list_depth_0 = [obj_slider_speed,
				obj_slider_volume,
				obj_button_show_controls,
				obj_button_tonality];	

notes = [snd_1,snd_2,snd_3,snd_3_min,snd_4,snd_5,snd_6,snd_6_min,snd_7,snd_7_min,snd_8,snd_9,snd_10,snd_10_min,snd_11,snd_12,snd_13,snd_13_min,snd_14,snd_14_min,snd_15];
notes_true = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
notes_played = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];


max_width = 0;
	
for (var i = 0; i*block_height <= room_width; i += 1)
{
	max_width = i	
}

for (var yy = 0; yy*block_height <= room_height; yy += 1)
{
	for (var xx = 0; xx*block_height <= room_width; xx += 1)
	{
		blocks[xx,yy] = instance_create_layer(xx*block_height,yy*block_height,"Instances",obj_test)
		with blocks[xx,yy]
		{
			check_xx = xx;
			check_yy = yy;
		}
	}
}

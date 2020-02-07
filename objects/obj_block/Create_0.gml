image_index = 15;
image_xscale = global.scale;
image_yscale = global.scale;

life_death = 0;
life_death_next = 0;
last_step_life = life_death;
last_step_colour = image_index;
block_number = round((room_height - y)/obj_controls.block_height)+15; //15 - 30 so that it can 'flip' through the wall
block_colour = block_number;

group_nr = 0;
flip = false;
clicked = false;

initialize_buren =  false;
pause_state_life_death = life_death;
pause_state_life_death_next = life_death_next;
pause_state_image = image_index;
return_to_pause_state = false;

check_xx = 0;
check_yy = 0;

buur = [self,self,self,self,self,self,self,self];
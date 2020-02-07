//make groups with all blocks that are neighbours of eachother. (recursive)
//flip is there to decide the colour of the groupi when a group goes 'over the edge' and comes out at the other side

for (var i = 7; i > -1;i -= 1)
{
	if (buur[i].life_death_next == 1) and (buur[i].group_nr == 0 or (buur[i].flip != flip and buur[i].y < room_height-10))
	{
		buur[i].group_nr = group_nr;
		if (y == 0 and buur[i].y > room_height-10) //do not make flip go over the top edge
		{
			with buur[i]
			{
				make_group();
			}
		} else {
			if (flip == true) //make the other blocks flipped 
			{
				with buur[i]
				{
					flip = true;
					make_group();
				}
				
			} else {
				with buur[i] // not flipped, no problem.
				{
					make_group();
				}
			}
		}
	}
}

//blocks have numbers 30 to 15 depending on height, if flipped 15 to 0.
if (flip == true)
{
	if (obj_controls.group_colour[group_nr] > block_number-15)
	{
		obj_controls.group_colour[group_nr] = block_number-15;
	}
} else {
	if (obj_controls.group_colour[group_nr] > block_number)
	{
		obj_controls.group_colour[group_nr] = block_number;
	}
}


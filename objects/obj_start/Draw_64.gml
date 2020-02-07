draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font1);
padding = room_height/28;
string_size_x = string_width("START")*global.scale;
string_size_y = string_height("START")*global.scale;

draw_set_color(c_white);
draw_rectangle(0,0,room_width,room_height,0);
draw_set_color(c_black);
draw_set_alpha(0.2);
draw_rectangle(0,0,room_width,room_height,0);
draw_set_alpha(1);
if (point_in_rectangle(mouse_x,mouse_y,
					  (room_width/2)-(string_size_x/2 + padding),
					  (room_height/2)-(string_size_y/2 + padding),
					  (room_width/2)+(string_size_x/2 + padding),
					  (room_height/2)+(string_size_y/2 + padding)))
{
	draw_rectangle_color((room_width/2)-(string_size_x/2 + padding),
						  (room_height/2)-(string_size_y/2 + padding),
						  (room_width/2)+(string_size_x/2 + padding),
						  (room_height/2)+(string_size_y/2 + padding),
						  c_dkgray,c_dkgray,c_dkgray,c_dkgray,0);
} else {
	draw_rectangle_color((room_width/2)-(string_size_x/2 + padding),
						  (room_height/2)-(string_size_y/2 + padding),
						  (room_width/2)+(string_size_x/2 + padding),
						  (room_height/2)+(string_size_y/2 + padding),
						  $999999,$999999,$999999,$999999,0);
						  
}

draw_text_transformed_color(room_width/2,room_height/2,"START",global.scale,global.scale,0,c_white,c_white,c_white,c_white,1);
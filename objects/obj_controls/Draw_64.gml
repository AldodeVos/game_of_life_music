image_alpha = 0;
draw_self();

draw_set_alpha(1);
draw_set_halign(fa_center);

if (pause == true)
{
	draw_set_alpha(0.2);
	draw_set_font(font1);
	draw_set_color(c_black);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_text_transformed_color(room_width/2,room_height/2,"PAUSED",global.scale,global.scale,0,c_white,c_white,c_white,c_white,1);
}


if (hold == true)
{
	draw_set_font(font2);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed_color(room_width/14*11,room_height/14,"HOLD",global.scale,global.scale,0,c_red,c_red,c_red,c_red,1);
}
image_alpha = 0.5;
draw_self();

var tonality = obj_controls.tonality;

if (tonality == 0)
{
	draw_set_font(font2);
	draw_set_alpha(0.8);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(room_width/2,room_height/14,"MAJOR",global.scale,global.scale,0);
}
if (tonality == 1)
{
	draw_set_font(font2);
	draw_set_alpha(0.8);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(room_width/2,room_height/14,"MINOR",global.scale,global.scale,0);
}
if (tonality == 2)
{
	draw_set_font(font2);
	draw_set_alpha(0.8);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(room_width/2,room_height/14,"HEXA",global.scale,global.scale,0);
}
if (tonality == 3)
{
	draw_set_font(font2);
	draw_set_alpha(0.8);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(room_width/2,room_height/14,"OCTA",global.scale,global.scale,0);
}
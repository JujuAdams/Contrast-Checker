var _string = "";
_string += "Simple contrast checker    @jujuadams    2021-06-17\n";
_string += "Based on WCAG v2.1, sample image by @vponamariov\n";
_string += "space = original image, C = contrast, L = luminence";

var _width  = string_width(_string);
var _height = string_height(_string);
var _x = (display_get_gui_width()  - _width ) div 2;
var _y = display_get_gui_height() - _height - 10;

draw_set_colour(c_black);
draw_text(_x-1, _y,   _string);
draw_text(_x,   _y-1, _string);
draw_text(_x+1, _y,   _string);
draw_text(_x,   _y+1, _string);
draw_set_alpha(0.5);
draw_text(_x, _y+3, _string);
draw_set_alpha(1.0);
draw_set_colour(c_white);
draw_text(_x, _y, _string);
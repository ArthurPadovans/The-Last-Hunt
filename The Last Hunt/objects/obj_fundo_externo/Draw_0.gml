// Onde a câmera está olhando agora
var cam = view_camera[0];
var vx = camera_get_view_x(cam);
var vy = camera_get_view_y(cam);
var vw = camera_get_view_width(cam);
var vh = camera_get_view_height(cam);
var m = 700;   // margem extra, para cobrir os cantos quando a câmera gira

// As cores vão e voltam devagar
var t = (sin(current_time / 3000) + 1) / 2;
var ca = merge_color(merge_color(cor1, cor2, t), c_black, escurecer);
var cb = merge_color(merge_color(cor2, cor3, t), c_black, escurecer);
var cc = merge_color(merge_color(cor3, cor4, t), c_black, escurecer);
var cd = merge_color(merge_color(cor4, cor1, t), c_black, escurecer);

draw_rectangle_color(vx - m, vy - m, vx + vw + m, vy + vh + m, ca, cb, cc, cd, false);
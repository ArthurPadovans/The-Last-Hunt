// Onde a câmera está olhando agora
var cam = view_camera[0];
var vx = camera_get_view_x(cam);
var vy = camera_get_view_y(cam);
var vw = camera_get_view_width(cam);
var vh = camera_get_view_height(cam);
var m = 700;   // margem extra, para cobrir os cantos quando a câmera gira

// As cores vão e voltam devagar...
var t = (sin(fase / 3000) + 1) / 2;

// ...mas, durante a piscada, alternam rapidamente entre dois tons
if (piscada > 0.15) {
    if ((current_time div 50) mod 2 == 0) {
        t = 1 - t;
    }
}

// Na piscada, o fundo também fica mais claro
var esc = escurecer * (1 - piscada * 0.7);

var ca = merge_color(merge_color(cor1, cor2, t), c_black, esc);
var cb = merge_color(merge_color(cor2, cor3, t), c_black, esc);
var cc = merge_color(merge_color(cor3, cor4, t), c_black, esc);
var cd = merge_color(merge_color(cor4, cor1, t), c_black, esc);

// O clarão quente da piscada
ca = merge_color(ca, cor_flash, piscada * 0.45);
cb = merge_color(cb, cor_flash, piscada * 0.45);
cc = merge_color(cc, cor_flash, piscada * 0.45);
cd = merge_color(cd, cor_flash, piscada * 0.45);

draw_rectangle_color(vx - m, vy - m, vx + vw + m, vy + vh + m, ca, cb, cc, cd, false);
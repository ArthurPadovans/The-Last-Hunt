var p = 1 - vida / vida_max;           // vai de 0 até 1
var a0 = ang - 70;                     // onde o arco começa
var a1 = a0 + 140 * min(1, p * 2);     // o arco "varre" na primeira metade e depois só some

draw_set_alpha(1 - p);
draw_set_color(c_white);

var passos = 12;
for (var i = 0; i < passos; i++) {
    var t1 = a0 + (a1 - a0) * (i / passos);
    var t2 = a0 + (a1 - a0) * ((i + 1) / passos);
    draw_line_width(
        x + lengthdir_x(raio_arco, t1), y + lengthdir_y(raio_arco, t1),
        x + lengthdir_x(raio_arco, t2), y + lengthdir_y(raio_arco, t2),
        6 * (1 - p) + 2
    );
}

draw_set_alpha(1);
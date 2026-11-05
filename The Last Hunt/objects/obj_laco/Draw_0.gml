// A corda, do boss até a ponta do laço
if (instance_exists(dono)) {
    draw_set_color(make_color_rgb(150, 100, 50));
    draw_line_width(dono.x, dono.y, x, y, 4);
}

// O nó do laço
draw_set_color(make_color_rgb(200, 150, 80));
draw_circle(x, y, 12, true);
draw_circle(x, y, 11, true);
draw_set_color(c_white);
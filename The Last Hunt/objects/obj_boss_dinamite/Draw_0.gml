draw_self();   // desenha o próprio sprite

// Barra de vida
draw_set_color(c_black);
draw_rectangle(x - 30, y - 42, x + 30, y - 36, false);
draw_set_color(c_red);
draw_rectangle(x - 30, y - 42, x - 30 + 60 * (vida / vida_max), y - 36, false);
draw_set_color(c_white);
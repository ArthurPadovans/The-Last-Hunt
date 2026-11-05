// Linha de mira do laço: amarela enquanto acompanha, vermelha quando trava
if (mirando > 0) {
    if (mirando <= 15) {
        draw_set_alpha(0.9);
        draw_set_color(c_red);
        draw_line_width(x, y, x + lengthdir_x(420, ang_laco), y + lengthdir_y(420, ang_laco), 4);
    } else {
        draw_set_alpha(0.35);
        draw_set_color(c_yellow);
        draw_line_width(x, y, x + lengthdir_x(420, ang_laco), y + lengthdir_y(420, ang_laco), 2);
    }
    draw_set_alpha(1);
}

draw_self();   // desenha o próprio sprite

// Barra de vida
draw_set_color(c_black);
draw_rectangle(x - 30, y - 42, x + 30, y - 36, false);
draw_set_color(c_red);
draw_rectangle(x - 30, y - 42, x - 30 + 60 * (vida / vida_max), y - 36, false);
draw_set_color(c_white);
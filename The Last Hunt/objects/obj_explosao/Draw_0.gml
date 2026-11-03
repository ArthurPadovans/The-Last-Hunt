var t = tempo / duracao;   // vai de 0 até 1

draw_set_alpha(1 - t);
draw_set_color(c_orange);
draw_circle(x, y, raio * (0.5 + t * 0.5), false);
draw_set_color(c_yellow);
draw_circle(x, y, raio * 0.5 * (1 - t), false);
draw_set_alpha(1);
draw_set_color(c_white);
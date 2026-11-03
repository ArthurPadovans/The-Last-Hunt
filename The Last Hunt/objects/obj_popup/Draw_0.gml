draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(min(1, vida / 20));   // some no final

draw_set_color(c_black);
draw_text_transformed(x + 2, y + 2, texto, 2, 2, 0);   // sombra
draw_set_color(c_yellow);
draw_text_transformed(x, y, texto, 2, 2, 0);

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
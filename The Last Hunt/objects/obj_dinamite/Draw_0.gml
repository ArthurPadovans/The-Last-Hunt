draw_self();

// Depois de pousar, mostra a área de perigo
if (pousou) {
    draw_set_alpha(0.3);
    draw_set_color(c_red);
    draw_circle(x, y, 64, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}
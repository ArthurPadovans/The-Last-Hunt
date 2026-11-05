if (acordou) {
    var w = display_get_gui_width();
    var largura = 600;
    var x1 = w / 2 - largura / 2;

    // Moldura, fundo e vida
    draw_set_color(c_black);
    draw_rectangle(x1 - 4, 24, x1 + largura + 4, 52, false);
    draw_set_color(c_dkgray);
    draw_rectangle(x1, 28, x1 + largura, 48, false);
    draw_set_color(c_red);
    draw_rectangle(x1, 28, x1 + largura * (vida / vida_max), 48, false);

    // Nome do chefe
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(w / 2, 66, "O LIDER DA GANGUE");
    draw_set_halign(fa_left);
}
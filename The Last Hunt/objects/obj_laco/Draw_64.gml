if (estado == 1) {
    var w = display_get_gui_width();
    draw_set_halign(fa_center);
    draw_set_color(c_red);
    draw_text_transformed(w / 2, 120, "LAÇADO!", 3, 3, 0);
    draw_set_color(c_white);
    draw_text(w / 2, 165, "Acerte o chefe ou corte o laço com a faca");
    draw_set_halign(fa_left);
}
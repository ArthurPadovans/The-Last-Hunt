var w = display_get_gui_width();
var h = display_get_gui_height();

// Fundo preto
draw_set_alpha(alfa_fundo);
draw_set_color(c_black);
draw_rectangle(0, 0, w, h, false);

// Texto grande no centro
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alfa_texto);
draw_set_color(cor_texto);
draw_text_transformed(w / 2, h / 2, texto, 5, 5, 0);

// Linha menor embaixo (se tiver)
if (subtitulo != "") {
    draw_text_transformed(w / 2, h / 2 + 90, subtitulo, 2.5, 2.5, 0);
}

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
var w = display_get_gui_width();
var h = display_get_gui_height();

draw_set_color(c_black);
draw_rectangle(0, 0, w, h, false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alfa);

draw_set_color(make_color_rgb(235, 215, 180));
draw_text_transformed(w / 2, h * 0.38, "THE LAST HUNT", 6, 6, 0);

draw_set_color(make_color_rgb(150, 125, 95));
draw_text_transformed(w / 2, h * 0.52, "Charles Logan  (1828 - 1870)", 2, 2, 0);

draw_set_color(c_white);
draw_text_transformed(w / 2, h * 0.68, "Obrigado por jogar", 2.5, 2.5, 0);

draw_set_color(make_color_rgb(160, 160, 160));
draw_text(w / 2, h * 0.76, creditos);

if (tempo > 180 && (current_time div 500) mod 2 == 0) {
    draw_set_color(make_color_rgb(120, 120, 120));
    draw_text(w / 2, h * 0.92, "Aperte ENTER para voltar ao menu");
}

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
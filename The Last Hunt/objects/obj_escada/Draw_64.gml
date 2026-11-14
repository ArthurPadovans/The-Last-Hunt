var w = display_get_gui_width();
var h = display_get_gui_height();

// Aviso quando o andar foi limpo
if (!saindo && instance_number(obj_inimigo) == 0 && instance_number(obj_boss) == 0) {
    draw_set_halign(fa_center);
    draw_set_color(c_yellow);
    draw_text_transformed(w / 2, 90, "ANDAR LIMPO! VA ATE A ESCADA", 2, 2, 0);
    draw_set_halign(fa_left);
}

// A tela escurece ao sair
if (saindo) {
    draw_set_alpha(fade);
    draw_set_color(c_black);
    draw_rectangle(0, 0, w, h, false);
    draw_set_alpha(1);
}

draw_set_color(c_white);
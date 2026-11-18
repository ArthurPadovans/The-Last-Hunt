// ---------- MENU DE PAUSA ----------
if (pausado) {
    pausa_desenhar();
    exit;
}

var w = display_get_gui_width();
var h = display_get_gui_height();

// ---------- PLACAR (canto superior direito) ----------
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(w - 20, 20, string(pontos) + " pts", 3, 3, 0);

if (combo > 1) {
    // Quanto maior o combo, mais vermelho e maior fica
    var cor = merge_color(c_yellow, c_red, clamp(combo / 10, 0, 1));
    var escala = 3 + min(combo, 10) * 0.15;
    var y_combo = 20 + string_height("A") * 3 + 8;    // logo abaixo dos pontos

    draw_set_color(cor);
    draw_text_transformed(w - 20, y_combo, "COMBO x" + string(combo), escala, escala, 0);

    // Barra do tempo que resta para manter o combo
    var by = y_combo + string_height("A") * escala + 6;
    draw_rectangle(w - 20 - 260 * (combo_tempo / 180), by, w - 20, by + 8, false);
}

draw_set_halign(fa_left);
draw_set_color(c_white);

// ---------- TELAS DE MORTE E VITÓRIA ----------
if (estado_jogo != 0) {
    // Escurece a tela
    draw_set_alpha(0.6);
    draw_set_color(c_black);
    draw_rectangle(0, 0, w, h, false);
    draw_set_alpha(1);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    if (estado_jogo == 1) {
        draw_set_color(c_red);
        draw_text_transformed(w / 2, h / 2 - 40, "VOCÊ MORREU", 4, 4, 0);
        draw_set_color(c_white);
        draw_text(w / 2, h / 2 + 40, "Aperte Q para tentar de novo");
    } else {
        draw_set_color(c_yellow);
        draw_text_transformed(w / 2, h / 2 - 60, "FASE COMPLETA", 4, 4, 0);
        draw_set_color(c_white);
        draw_text_transformed(w / 2, h / 2 + 10, "PONTOS: " + string(pontos), 2, 2, 0);
        draw_text(w / 2, h / 2 + 50, "Maior combo: x" + string(maior_combo));
        draw_text(w / 2, h / 2 + 90, "Aperte ENTER para o duelo");
    }

    // Volta o alinhamento ao normal
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
var w = display_get_gui_width();
var h = display_get_gui_height();

// ---------- CENÁRIO (provisório, depois vira pixel art) ----------
draw_set_color(make_color_rgb(235, 170, 100));   // céu
draw_rectangle(0, 0, w, h * 0.6, false);
draw_set_color(make_color_rgb(170, 120, 70));    // chão
draw_rectangle(0, h * 0.6, w, h, false);

// Inimigo, de frente
draw_set_color(make_color_rgb(120, 30, 30));
draw_rectangle(w * 0.40, h * 0.30, w * 0.50, h * 0.75, false);

// Você, de costas, na frente
draw_set_color(make_color_rgb(30, 40, 90));
draw_rectangle(w * 0.12, h * 0.50, w * 0.26, h, false);

// ---------- RELÓGIO, NO CANTO DIREITO ----------
var cx = w - 190;
var cy = h / 2;
var r = 110;

draw_set_color(c_black);
draw_circle(cx, cy, r + 8, false);                       // borda
draw_set_color(make_color_rgb(235, 225, 200));
draw_circle(cx, cy, r, false);                           // mostrador

// As 12 marcas das horas (a do meio-dia é vermelha e maior)
for (var i = 0; i < 12; i++) {
    var a = 90 - i * 30;
    var r1 = r - 14;
    var largura = 3;
    draw_set_color(c_black);
    if (i == 0) {
        r1 = r - 24;
        largura = 6;
        draw_set_color(c_red);
    }
    draw_line_width(cx + lengthdir_x(r1, a), cy + lengthdir_y(r1, a), cx + lengthdir_x(r - 4, a), cy + lengthdir_y(r - 4, a), largura);
}

// O ponteiro
var ag = 90 - angulo;
draw_set_color(c_black);
draw_line_width(cx, cy, cx + lengthdir_x(r - 18, ag), cy + lengthdir_y(r - 18, ag), 6);
draw_circle(cx, cy, 8, false);

// ---------- CLARÃO DO TIRO ----------
if (flash > 0) {
    draw_set_alpha(flash);
    draw_set_color(c_white);
    draw_rectangle(0, 0, w, h, false);
    draw_set_alpha(1);
}

// ---------- TEXTOS ----------
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (estado == 0) {
    draw_set_color(c_white);
    draw_text_transformed(w / 2, h * 0.12, "O DUELO VAI COMECAR", 3, 3, 0);
    draw_text(w / 2, h * 0.20, "Quando o ponteiro bater MEIO-DIA, aperte o botao ESQUERDO do mouse!");
}
else if (estado == 1) {
    draw_set_color(c_white);
    draw_text_transformed(w / 2, h * 0.12, "ESPERE...", 3, 3, 0);
    draw_text(w / 2, h * 0.20, "Atirar antes da hora e fatal.");
}
else if (estado == 2) {
    draw_set_color(c_red);
    draw_text_transformed(w / 2, h * 0.12, "ATIRE!", 6, 6, 0);
}
else if (estado == 3) {
    draw_set_color(c_lime);
    draw_text_transformed(w / 2, h * 0.12, "VOCE ATIROU PRIMEIRO", 3, 3, 0);
    draw_set_color(c_white);
    draw_text(w / 2, h * 0.22, "Reflexo: " + string_format(tempo_reacao, 1, 2) + " s");
    draw_text(w / 2, h * 0.28, "Aperte ENTER para continuar");
}
else {
    draw_set_color(c_red);
    if (estado == 4) {
        draw_text_transformed(w / 2, h * 0.12, "ATIROU CEDO DEMAIS", 3, 3, 0);
    } else {
        draw_text_transformed(w / 2, h * 0.12, "MUITO LENTO", 3, 3, 0);
    }
    draw_set_color(c_white);
    draw_text(w / 2, h * 0.22, "Aperte Q para tentar o duelo de novo");
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
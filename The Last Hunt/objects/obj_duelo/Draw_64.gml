var w = display_get_gui_width();
var h = display_get_gui_height();

// Tremida do cenário
var ox = random_range(-sac, sac);
var oy = random_range(-sac, sac);

// ---------- CENÁRIO ----------
draw_sprite_stretched(spr_duelo_fundo, 0, -40 + ox, -40 + oy, w + 80, h + 80);

// O inimigo, de frente, e você, de costas, na frente (cada um no seu quadro da animação)
draw_sprite_ext(spr_duelo_inimigo, floor(fi), w * pos_inimigo_x + ox, h * pos_inimigo_y + oy, esc_inimigo, esc_inimigo, 0, c_white, 1);
draw_sprite_ext(spr_duelo_jogador, floor(fj), w * pos_jogador_x + ox, h * pos_jogador_y + oy, esc_jogador, esc_jogador, 0, c_white, 1);

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

// A moldura ornamentada, em volta do relógio
draw_sprite_ext(spr_relogio_moldura, 0, cx, cy, esc_arte, esc_arte, 0, c_white, 1);

// ---------- CLARÃO DO TIRO ----------
if (flash > 0) {
    draw_set_alpha(flash);
    draw_set_color(flash_cor);
    draw_rectangle(0, 0, w, h, false);
    draw_set_alpha(1);
}

// ---------- TELA AVERMELHADA (depois que Charles é atingido) ----------
if (vermelho > 0) {
    draw_set_alpha(vermelho);
    draw_set_color(c_red);
    draw_rectangle(0, 0, w, h, false);
    draw_set_alpha(1);
}

// ---------- TEXTOS ----------
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (estado == 0) {
    draw_set_color(c_white);
    if (eh_final) {
        draw_text_transformed(w / 2, h * 0.12, "O DUELO FINAL", 3, 3, 0);
    } else {
        draw_text_transformed(w / 2, h * 0.12, "O DUELO VAI COMEÇAR", 3, 3, 0);
    }
    draw_text(w / 2, h * 0.20, "Quando o ponteiro bater MEIO-DIA, clique com o botão ESQUERDO do mouse!");
}
else if (estado == 1) {
    draw_set_color(c_white);
    draw_text_transformed(w / 2, h * 0.12, "ESPERE...", 3, 3, 0);
    draw_text(w / 2, h * 0.20, "Atirar antes da hora é fatal.");
}
else if (estado == 2) {
    draw_set_color(c_red);
    draw_text_transformed(w / 2, h * 0.12, "ATIRE!", 6, 6, 0);
}
else if (estado == 3) {
    if (eh_final) {
        if (t_final < 62) {
            draw_set_color(c_lime);
            draw_text_transformed(w / 2, h * 0.12, "VOCÊ ATIROU PRIMEIRO", 3, 3, 0);
        } else {
            draw_set_color(c_white);
            draw_text_transformed(w / 2, h * 0.12, "MAS ELE TAMBÉM ATIROU...", 3, 3, 0);
        }
    } else {
        draw_set_color(c_lime);
        draw_text_transformed(w / 2, h * 0.12, "VOCÊ ATIROU PRIMEIRO", 3, 3, 0);
        if (t_pos > 40) {
            draw_set_color(c_white);
            draw_text(w / 2, h * 0.22, "Reflexo: " + string_format(tempo_reacao, 1, 2) + " s");
            draw_text(w / 2, h * 0.28, "Aperte ENTER para continuar");
        }
    }
}
else {
    draw_set_color(c_red);
    if (estado == 4) {
        draw_text_transformed(w / 2, h * 0.12, "ATIROU CEDO DEMAIS", 3, 3, 0);
    } else {
        draw_text_transformed(w / 2, h * 0.12, "MUITO LENTO", 3, 3, 0);
    }
    if (t_pos > 70) {
        draw_set_color(c_white);
        draw_text(w / 2, h * 0.22, "Aperte Q para tentar o duelo de novo");
    }
}

// ---------- FADE PARA PRETO (final do duelo final) ----------
if (escuro > 0) {
    draw_set_alpha(escuro);
    draw_set_color(c_black);
    draw_rectangle(0, 0, w, h, false);
    draw_set_alpha(1);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
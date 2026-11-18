var w = display_get_gui_width();
var h = display_get_gui_height();

// Tremida do cenário
var ox = random_range(-sac, sac);
var oy = random_range(-sac, sac);

// ---------- CENÁRIO ----------
draw_sprite_stretched(spr_duelo_fundo, 0, -40 + ox, -40 + oy, w + 80, h + 80);

// Cada um usa o sprite "parado" ou, depois de atirar, o sprite "atirando".
// Quem foi atingido tomba e escurece um pouco.
var spr_i = sprite_inimigo;
if (atirou_i) {
    spr_i = sprite_inimigo_tiro;
}
var spr_j = spr_duelo_jogador;
if (atirou_j) {
    spr_j = spr_duelo_jogador_atirando;
}

draw_sprite_ext(spr_i, 0, w * pos_inimigo_x + ox, h * pos_inimigo_y + oy, esc_inimigo, esc_inimigo, -queda_giro * qi, merge_color(c_white, c_gray, qi * 0.5), 1);
draw_sprite_ext(spr_j, 0, w * pos_jogador_x + ox, h * pos_jogador_y + oy, esc_jogador, esc_jogador, queda_giro * qj, merge_color(c_white, c_gray, qj * 0.5), 1);

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
    if (!comecou) {
        // As instruções completas só aparecem no primeiro duelo
        var mostra_tudo = (nivel == 1 && !eh_final);
        var y_convite = h * 0.18;

        if (mostra_tudo) {
            y_convite = h * 0.32;

            // Fundo escuro, só na parte de cima (para não cobrir o relógio)
            draw_set_alpha(0.6);
            draw_set_color(c_black);
            draw_rectangle(w * 0.03, h * 0.03, w * 0.97, h * 0.265, false);
            draw_set_alpha(1);

            draw_set_color(c_white);
            draw_text_transformed(w / 2, h * 0.07, "O DUELO", 3.5, 3.5, 0);
            draw_text_transformed(w / 2, h * 0.135, "1. O ponteiro do relógio vai começar a andar.", 1.8, 1.8, 0);
            draw_text_transformed(w / 2, h * 0.185, "2. Quando ele bater MEIO-DIA, clique com o botão ESQUERDO.", 1.8, 1.8, 0);
            draw_text_transformed(w / 2, h * 0.235, "3. Clicar antes da hora, ou demorar demais, é fatal.", 1.8, 1.8, 0);
        } else {
            // Nos outros duelos, só o título
            draw_set_alpha(0.6);
            draw_set_color(c_black);
            draw_rectangle(w * 0.30, h * 0.03, w * 0.70, h * 0.12, false);
            draw_set_alpha(1);

            draw_set_color(c_white);
            if (eh_final) {
                draw_text_transformed(w / 2, h * 0.075, "O DUELO FINAL", 3.5, 3.5, 0);
            } else {
                draw_text_transformed(w / 2, h * 0.075, "O DUELO", 3.5, 3.5, 0);
            }
        }

        // Convite para começar (pisca), com um fundo escuro para ler bem
        if (espera <= 0 && (current_time div 500) mod 2 == 0) {
            draw_set_alpha(0.6);
            draw_set_color(c_black);
            draw_rectangle(w * 0.25, y_convite - h * 0.04, w * 0.75, y_convite + h * 0.04, false);
            draw_set_alpha(1);

            draw_set_color(c_yellow);
            draw_text_transformed(w / 2, y_convite, "Clique com o botão ESQUERDO para começar", 2, 2, 0);
        }
    } else {
        draw_set_color(c_white);
        draw_text_transformed(w / 2, h * 0.12, "PREPARE-SE...", 3.5, 3.5, 0);
    }
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
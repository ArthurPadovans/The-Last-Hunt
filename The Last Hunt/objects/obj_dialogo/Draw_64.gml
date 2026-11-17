var w = display_get_gui_width();
var h = display_get_gui_height();

var topo = h * 0.165;   // onde termina a faixa preta de cima
var base = h * 0.75;    // onde começa a faixa preta de baixo

var quem = falas[indice][0];
var texto = falas[indice][1];

// Pega o rosto e a cor de quem está falando
var cor_personagem = make_color_rgb(120, 120, 120);
var rosto = -1;
if (struct_exists(personagens, quem)) {
    var p = personagens[$ quem];
    cor_personagem = p.cor;
    rosto = p.rosto;
}

// ---------- O ROSTO, BALANÇANDO (sem painel atrás) ----------
if (rosto != -1 && sprite_exists(rosto)) {
    var cx = w * 0.82;
    var cy = (topo + base) / 2;
    var escala = ((base - topo) * 0.9) / sprite_get_height(rosto);
    var ang = sin(current_time / 350) * 5;             // balança de leve
    var pulso = 1 + sin(current_time / 200) * 0.02;    // "respira"

    // Enquanto o texto aparece, a cabeça troca de quadro (como se estivesse falando)
    var quadro = 0;
    if (caractere < string_length(texto)) {
        quadro = floor(current_time / 120) mod sprite_get_number(rosto);
    }

    draw_sprite_ext(rosto, quadro, cx, cy, escala * pulso, escala * pulso, ang, c_white, 1);
}

// ---------- FAIXAS PRETAS (desenhadas por cima, para esconder o que passar) ----------
draw_set_color(c_black);
draw_rectangle(0, 0, w, topo, false);
draw_rectangle(0, base, w, h, false);

// Contornos brancos
draw_set_color(c_white);
draw_line_width(0, topo, w, topo, 3);
draw_line_width(0, base, w, base, 3);

// ---------- DICA DE PULAR ----------
draw_text_transformed(w * 0.05, h * 0.08, "SEGURE O BOTÃO DIREITO PARA PULAR", 1, 1, 0);
draw_rectangle(w * 0.05, h * 0.115, w * 0.05 + 200 * (pular / 40), h * 0.115 + 4, false);

// ---------- O TEXTO, COM SOMBRA NA COR DE QUEM FALA ----------
var parte = string_copy(texto, 1, floor(caractere));
var tx = w * 0.05;
var ty = base + h * 0.05;
var largura = (w * 0.9) / 2.5;

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(merge_color(cor_personagem, c_black, 0.5));
draw_text_ext_transformed(tx + 3, ty + 3, parte, -1, largura, 2.5, 2.5, 0);
draw_set_color(c_white);
draw_text_ext_transformed(tx, ty, parte, -1, largura, 2.5, 2.5, 0);

// Setinha piscando quando a fala terminou
if (caractere >= string_length(texto) && (current_time div 400) mod 2 == 0) {
    draw_text_transformed(w * 0.93, h * 0.92, ">>", 2, 2, 0);
}

draw_set_color(c_white);
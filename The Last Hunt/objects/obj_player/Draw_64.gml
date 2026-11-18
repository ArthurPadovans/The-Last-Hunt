draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

var tam = 2.5;                              // tamanho do texto
var lin = string_height("A") * tam + 8;     // altura de cada linha

draw_text_transformed(20, 20, "Arma: " + nome_arma[arma], tam, tam, 0);

// A faca não tem munição para mostrar
if (arma != 2) {
    if (recarregando) {
        draw_text_transformed(20, 20 + lin, "Recarregando...", tam, tam, 0);
    } else {
        draw_text_transformed(20, 20 + lin, "Munição: " + string(municao) + "/" + string(max_municao[arma]), tam, tam, 0);
    }
}

// Aviso quando está em cima de uma arma
if (place_meeting(x, y, obj_arma)) {
    draw_text_transformed(20, 20 + lin * 2, "Aperte E para pegar", tam, tam, 0);
}
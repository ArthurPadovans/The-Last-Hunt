draw_set_color(c_white);
draw_text(20, 20, "Arma: " + nome_arma[arma]);

// A faca não tem munição para mostrar
if (arma != 2) {
    if (recarregando) {
        draw_text(20, 45, "Recarregando...");
    } else {
        draw_text(20, 45, "Munição: " + string(municao) + "/" + string(max_municao[arma]));
    }
}

// Aviso quando está em cima de uma arma
if (place_meeting(x, y, obj_arma)) {
    draw_text(20, 70, "Aperte E para pegar");
}
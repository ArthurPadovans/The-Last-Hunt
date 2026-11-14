var liberada = (instance_number(obj_inimigo) == 0 && instance_number(obj_boss) == 0);

if (liberada) {
    // Pulsa em amarelo para chamar atenção
    var p = (sin(current_time / 200) + 1) / 2;
    image_blend = merge_color(c_white, c_yellow, p);
} else {
    image_blend = c_dkgray;   // trancada: escura
}
draw_self();

// Texto em cima da escada
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
if (liberada) {
    draw_text(x, y - sprite_height / 2 - 6, tipo);
} else {
    draw_text(x, y - sprite_height / 2 - 6, "TRANCADA");
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
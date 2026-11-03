raio = 64;
duracao = 20;
tempo = 0;

// Mata quem está dentro do raio
with (obj_inimigo) {
    if (point_distance(x, y, other.x, other.y) < other.raio) {
        efeito_morte(x, y, point_direction(other.x, other.y, x, y), sprite_index);
        pontuar(x, y, 100);
        instance_destroy();
    }
}
with (obj_player) {
    if (point_distance(x, y, other.x, other.y) < other.raio) {
        efeito_morte(x, y, point_direction(other.x, other.y, x, y), sprite_index);
        instance_destroy();
    }
}

tremer(14);
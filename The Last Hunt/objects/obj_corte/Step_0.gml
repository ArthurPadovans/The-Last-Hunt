vida -= 1;

// O arco acompanha o jogador
if (instance_exists(dono)) {
    x = dono.x;
    y = dono.y;
}

if (vida <= 0) {
    instance_destroy();
}
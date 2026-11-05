var ang = other.direction;
instance_destroy(other);
vida -= 1;
piscar = 6;

if (vida <= 0) {
    efeito_morte(x, y, ang, sprite_index);
    pontuar(x, y, 3000);
    tremer(20);
    instance_destroy();
} else {
    respingo_sangue(x, y, ang, 5);   // um respingo a cada tiro
    tremer(3);
}
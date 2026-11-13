var ang = other.direction;
instance_destroy(other);

// Se ele já caiu, ignora os tiros
if (derrotado) {
    exit;
}

vida -= 1;
piscar = 6;

if (vida <= 0) {
    // Não morre ainda: cai de joelhos, e o duelo final decide
    derrotado = true;
    contador_fim = 100;   // cerca de 1,7 segundo até o duelo
    respingo_sangue(x, y, ang, 10);
    tremer(18);

    // Para tudo o que estava acontecendo
    with (obj_bala_inimiga) {
        instance_destroy();
    }
    with (obj_dinamite) {
        instance_destroy();
    }
    with (obj_explosao) {
        instance_destroy();
    }
    with (obj_inimigo) {
        alcance = 0;      // os capangas não enxergam mais ninguém
        velocidade = 0;   // e ficam parados
    }
} else {
    respingo_sangue(x, y, ang, 5);   // um respingo a cada tiro
    tremer(3);
}
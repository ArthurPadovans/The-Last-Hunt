// Só pode existir uma mira no jogo todo
if (instance_number(obj_mira) > 1) {
    instance_destroy();
    exit;
}

window_set_cursor(cr_none);   // esconde a setinha do Windows
persistent = true;            // a mira continua existindo quando troca de sala
depth = -10000;               // desenhada por cima de tudo

frame = 0;           // quadro atual da animação (0 = aberta)
escala = 1;          // tamanho da mira (2 = o dobro)
cooldown_ant = 0;
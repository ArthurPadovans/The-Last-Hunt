// Movimento com WASD
var dir_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var dir_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Só anda se não tiver parede na frente
if (!place_meeting(x + dir_x * velocidade, y, obj_parede)) {
    x += dir_x * velocidade;
}
if (!place_meeting(x, y + dir_y * velocidade, obj_parede)) {
    y += dir_y * velocidade;
}

// Olhar para o mouse
image_angle = point_direction(x, y, mouse_x, mouse_y);

// Espera entre ataques
if (cooldown > 0) {
    cooldown -= 1;
}

// Pegar arma do chão com E
if (keyboard_check_pressed(ord("E")) && !recarregando) {
    var item = instance_place(x, y, obj_arma);
    if (item != noone) {
        var tipos_no_chao = [obj_arma_revolver, obj_arma_espingarda, obj_arma_faca];

        // Guarda os dados da arma nova antes de apagá-la
        var novo_tipo = item.tipo;
        var nova_municao = item.municao_arma;
        instance_destroy(item);

        // Solta a arma que estava na mão, com a munição que sobrou
        var largada = instance_create_layer(x, y, "Instances", tipos_no_chao[arma]);
        largada.municao_arma = municao;

        // Pega a nova
        arma = novo_tipo;
        municao = nova_municao;
    }
}

// Começar a recarregar com R (a faca não recarrega)
if (keyboard_check_pressed(ord("R")) && !recarregando && arma != 2 && municao < max_municao[arma]) {
    recarregando = true;
    if (arma == 0) {
        tempo_recarga = 90;    // revolver: 1,5 segundo
    } else {
        tempo_recarga = 120;   // espingarda: 2 segundos
    }
}

// Contar o tempo da recarga
if (recarregando) {
    tempo_recarga -= 1;
    if (tempo_recarga <= 0) {
        municao = max_municao[arma];
        recarregando = false;
    }
}

// Atacar com o botão esquerdo do mouse
if (mouse_check_button_pressed(mb_left) && !recarregando && cooldown <= 0) {

    // REVOLVER
    if (arma == 0 && municao > 0) {
        var bala = instance_create_layer(x, y, "Instances", obj_bala);
        bala.direction = image_angle;
        bala.image_angle = image_angle;
        bala.speed = 12;
        municao -= 1;
        tremer(2);
        cooldown = 10;
    }
    // ESPINGARDA: 5 projéteis em leque, alcance curto
    else if (arma == 1 && municao > 0) {
        for (var i = -2; i <= 2; i++) {
            var projetil = instance_create_layer(x, y, "Instances", obj_bala);
            var angulo = image_angle + i * 7;
            projetil.direction = angulo;
            projetil.image_angle = angulo;
            projetil.speed = 10;
            projetil.vida = 25;
        }
        municao -= 1;
        tremer(6);
        cooldown = 35;
    }
    // FACA: golpe largo na frente, acerta todos na área
    else if (arma == 2) {
        var alcance_faca = 50;   // a que distância, na frente do jogador, fica o centro do golpe
        var raio_faca = 50;      // tamanho da área do golpe

        // Pequeno avanço para a frente ao golpear (se não tiver parede)
        var lx = lengthdir_x(12, image_angle);
        var ly = lengthdir_y(12, image_angle);
        if (!place_meeting(x + lx, y + ly, obj_parede)) {
            x += lx;
            y += ly;
        }

        // Acerta todos os inimigos dentro da área (menos os que estão atrás de parede)
        var fx = x + lengthdir_x(alcance_faca, image_angle);
        var fy = y + lengthdir_y(alcance_faca, image_angle);
        with (obj_inimigo) {
            if (point_distance(x, y, fx, fy) < raio_faca) {
                if (!collision_line(other.x, other.y, x, y, obj_parede, false, true)) {
                    efeito_morte(x, y, other.image_angle, sprite_index);
                    pontuar(x, y, 150);
                    instance_destroy();
                }
            }
        }

        // O corte em arco na tela
        var corte = instance_create_layer(x, y, "Instances", obj_corte);
        corte.dono = id;
        corte.ang = image_angle;
        corte.raio_arco = alcance_faca + 15;

        tremer(3);
        cooldown = 20;
    }
}

// Reiniciar a fase com Q
if (keyboard_check_pressed(ord("Q"))) {
    room_restart();
}

// ---------- ANDANDO? ----------
var dx = x - xprevious;   // quanto ele andou desde o passo anterior
var dy = y - yprevious;
andando = (dx != 0 || dy != 0);

var ciclo = max(1, sprite_get_number(spr_player_pernas) - 1);   // quadros do ciclo de andar

if (andando) {
    // Quanto do movimento foi "para frente" (na direção do mouse)?
    var frente = dx * lengthdir_x(1, image_angle) + dy * lengthdir_y(1, image_angle);

    if (frente < -0.5) {
        pernas_frame -= 0.3;   // andando de costas: toca ao contrário
    } else {
        pernas_frame += 0.3;   // para frente ou de lado: toca normal
    }

    // Mantém o contador dentro do ciclo
    if (pernas_frame >= ciclo) {
        pernas_frame -= ciclo;
    }
    if (pernas_frame < 0) {
        pernas_frame += ciclo;
    }
} else {
    pernas_frame = 0;
}

// As pernas olham para o mouse, junto com o corpo
alvo_pernas = image_angle;
direcao_pernas -= angle_difference(direcao_pernas, alvo_pernas) * 0.3;

// ---------- ATAQUE ----------
// O código do ataque já coloca um tempo de espera (cooldown) quando você atira.
// Se ele subiu, é porque acabou de atacar: começa a animação.
if (cooldown > cooldown_ant) {
    ataque_frame = 1;
}
cooldown_ant = cooldown;

if (ataque_frame > 0) {
    ataque_frame += 0.4;   // velocidade da animação de ataque
    if (ataque_frame >= sprite_get_number(sprites_arma[arma])) {
        ataque_frame = 0;  // acabou: volta ao quadro parado
    }
}
// O meio da porta e o tamanho da área em que ela "sente" o toque
var mx = x + lengthdir_x(comprimento / 2, angulo_fechada);
var my = y + lengthdir_y(comprimento / 2, angulo_fechada);
var raio = comprimento / 2 + 8;
var ator = noone;   // quem está empurrando (só o jogador abre)

// O jogador abre a porta quando anda na direção dela
var j = collision_circle(mx, my, raio, obj_player, false, true);
if (j != noone) {
    var kx = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    var ky = keyboard_check(ord("S")) - keyboard_check(ord("W"));
    var para_porta = kx * (mx - j.x) + ky * (my - j.y);
    if (para_porta > 0) {
        ator = j;
    }
}

if (ator != noone) {
    // De que lado está quem empurra? A porta gira para o lado oposto
    var nx = lengthdir_y(1, angulo_fechada);
    var ny = -lengthdir_x(1, angulo_fechada);
    var lado = (ator.x - x) * nx + (ator.y - y) * ny;
    var direcao = 1;
    if (lado > 0) {
        direcao = -1;
    }

    // Troca a porta sólida pela porta animada
    var giro = instance_create_depth(x, y, 5, obj_porta_giro);
    giro.sprite_index = sprite_index;
    giro.image_xscale = image_xscale;
    giro.image_yscale = image_yscale;
    giro.angulo_fechada = angulo_fechada;
    giro.image_angle = angulo_fechada;
    giro.alvo = 95 * direcao;

    // A porta bate em quem estiver do lado para onde ela gira e derruba
    var hx = x;
    var hy = y;
    var comp = comprimento;
    var ddx = lengthdir_x(1, angulo_fechada);
    var ddy = lengthdir_y(1, angulo_fechada);
    var derrubou = false;

    with (obj_inimigo) {
        var ex = x - hx;
        var ey = y - hy;
        var lado_e = ex * nx + ey * ny;      // de que lado da porta ele está
        var ao_longo = ex * ddx + ey * ddy;  // quanto ele está "ao longo" da porta

        if (lado_e * direcao > 0 && ao_longo > -10 && point_distance(hx, hy, x, y) < comp + 14) {
            atordoado = 150;                 // 150 passos = 2,5 segundos
            emp_x = nx * direcao * 5;        // o empurrão segue o giro da porta
            emp_y = ny * direcao * 5;
            image_angle = point_direction(0, 0, emp_x, emp_y);
            derrubou = true;
        }
    }

    if (derrubou) {
        tremer(6);
		tocar_som(snd_porta_batida, 6);    // <- NOVA
    } else {
        tremer(2);
		tocar_som(snd_porta, 4);    // <- NOVA
    }

    instance_destroy();
}
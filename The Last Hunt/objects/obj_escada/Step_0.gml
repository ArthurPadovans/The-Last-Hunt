// A escada só abre quando não sobrou inimigo nem chefe no andar
var liberada = (instance_number(obj_inimigo) == 0 && instance_number(obj_boss) == 0);

if (!saindo) {
    // O jogador pisou na escada liberada: começa a sair
    if (liberada && instance_exists(obj_player) && place_meeting(x, y, obj_player)) {
        saindo = true;
    }
} else {
    // A tela escurece e depois vai para a próxima sala
    fade += 0.05;
    if (fade >= 1) {
        // Anota a arma e a munição para levar ao próximo andar
        if (instance_exists(obj_player)) {
            global.arma_levada = obj_player.arma;
            global.municao_levada = obj_player.municao;
        }
        room_goto_next();
    }
}
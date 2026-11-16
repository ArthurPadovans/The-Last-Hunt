// Quem estiver dentro do móvel é empurrado para fora.
// Assim ele bloqueia o caminho, mas não os tiros nem a visão.
var alvos = [obj_player, obj_inimigo, obj_boss];

for (var i = 0; i < array_length(alvos); i++) {
    with (alvos[i]) {
        if (place_meeting(x, y, other)) {
            // Quanto ele invadiu o móvel, por cada lado
            var da_esquerda = bbox_right - other.bbox_left + 1;
            var da_direita = other.bbox_right - bbox_left + 1;
            var de_cima = bbox_bottom - other.bbox_top + 1;
            var de_baixo = other.bbox_bottom - bbox_top + 1;
            var menor = min(da_esquerda, da_direita, de_cima, de_baixo);

            // Empurra pelo lado mais curto
            if (menor == da_esquerda) {
                x -= da_esquerda;
            } else if (menor == da_direita) {
                x += da_direita;
            } else if (menor == de_cima) {
                y -= de_cima;
            } else {
                y += de_baixo;
            }
        }
    }
}
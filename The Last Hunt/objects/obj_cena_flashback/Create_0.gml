event_inherited();   // pega as configurações padrão do obj_dialogo

view_enabled = false;   // esta sala não usa a câmera que segue o jogador

var gangue = "Abutres";

falas = [
    // ---------- O CONSULTORIO ----------
    ["medico", "Sente-se, senhor Logan. Preciso falar sobre os exames que fiz na semana passada."],
    ["charles", "Fale logo, doutor. Nunca fui homem de rodeios."],
    ["medico", "A pneumonia chegou aos dois pulmoes. Ja esta muito avancada."],
    ["charles", "Entao e isso que explica a tosse. Eu achava que era a poeira da estrada."],
    ["medico", "Poeira nao faz isso com um homem, senhor Logan."],
    ["charles", "Quanto tempo me resta?"],
    ["medico", "Meses. Talvez menos. Eu sinto muito."],
    ["medico", "Se o senhor ficar em uma cama, em um lugar quente, pode ganhar mais algum tempo."],
    ["charles", "Eu nao tenho uma cama, doutor. Nem um lugar para voltar."],
    ["medico", "Nao ha ninguem a quem eu possa avisar?"],
    ["charles", "Ninguem. Vinte anos nessa estrada e nao sobrou ninguem."],

    // ---------- DEPOIS, SOZINHO ----------
    ["charles", "(Vou morrer num quarto qualquer, e daqui a um ano ninguem vai saber que eu existi.)"],
    ["charles", "(Cacei tanta gente, e eu mesmo vou sumir sem deixar rastro.)"],
    ["charles", "(Se eu vou morrer de qualquer jeito...)"],
    ["charles", "(...que seja atras dos " + gangue + ".)"],
    ["charles", "(Que alguem, em algum lugar, se lembre de que Charles Logan esteve aqui.)"]
];

proxima_sala = sala_epilogo_saloon;   // provisório: depois vai para o epílogo
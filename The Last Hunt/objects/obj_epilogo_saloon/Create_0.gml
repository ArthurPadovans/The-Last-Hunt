event_inherited();   // pega as configurações padrão do obj_dialogo

view_enabled = false;   // esta sala não usa a câmera que segue o jogador

titulo = "ALGUNS MESES DEPOIS";
subtitulo = "Um saloon, em algum lugar do Oeste";

var gangue = "Red Jays";

falas = [
    ["povo", "Você já ouviu a história do homem que derrubou os " + gangue + " sozinho?"],
    ["povo2", "Charles Logan? Dizem que ele foi atrás deles sabendo que talvez não voltasse."],
    ["povo", "Ouvi dizer que ele nem queria o dinheiro da recompensa."],
    ["povo2", "E queria o quê, então?"],
    ["povo", "Ninguém sabe. Mas olha só: ele se foi, e aqui estamos nós, falando dele."]
];

proxima_sala = sala_epilogo_acampamento;

tocar_musica(mus_cena, 0.4);    // <- NOVA
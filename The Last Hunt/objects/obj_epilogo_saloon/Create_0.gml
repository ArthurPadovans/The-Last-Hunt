event_inherited();   // pega as configurações padrão do obj_dialogo

view_enabled = false;   // esta sala não usa a câmera que segue o jogador

titulo = "ALGUNS MESES DEPOIS";
subtitulo = "Um saloon, em algum lugar do Oeste";

var gangue = "Red Jays";

falas = [
    ["povo", "Voce ja ouviu a historia do homem que derrubou os " + gangue + " sozinho?"],
    ["povo", "Charles Logan? Dizem que ele foi atras deles sabendo que talvez nao voltasse."],
    ["povo", "Ouvi dizer que ele nem queria o dinheiro da recompensa."],
    ["povo", "E queria o que, entao?"],
    ["povo", "Ninguem sabe. Mas olha so: ele se foi, e aqui estamos nos, falando dele."]
];

proxima_sala = sala_epilogo_acampamento;
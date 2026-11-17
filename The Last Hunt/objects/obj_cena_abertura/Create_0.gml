event_inherited();   // pega as configurações padrão do obj_dialogo

// ---------- NOMES (troque aqui, se quiser) ----------
var gangue = "Red Jays";
var lider = "Silas Mercer";

falas = [
    ["xerife", "Então é verdade. Charles Logan, em carne e osso, na minha porta."],
    ["charles", "Disseram que o senhor tinha um trabalho para mim."],
    ["xerife", "Tenho. O maior que já ofereci a alguém."],
    ["xerife", "Você já ouviu falar nos " + gangue + "?"],
    ["charles", "Todo mundo já ouviu. Dizem que nunca perderam uma briga."],
    ["xerife", "Sete bancos, três trens e dois xerifes. Ninguém que foi atrás deles voltou para contar."],
    ["xerife", "O homem que manda neles se chama " + lider + ". Eu quero ele. Vivo ou morto."],
    ["charles", "E a recompensa?"],
    ["xerife", "Dez mil dólares. Mais do que você juntou em toda a sua vida."],
    ["charles", "Não é pelo dinheiro."],
    ["xerife", "Então é pelo quê, Logan?"],
    ["charles", "Digamos que é a minha última caçada."],
    ["xerife", "Pois não tenha pressa. Leve o tempo que precisar."],
    ["charles", "Tempo é a única coisa que eu não tenho de sobra."],
    ["charles", "Eu aceito."],
    ["charles", "*tosse* Poeira da estrada. Não se preocupe."],
    ["xerife", "Boa sorte, Logan. Você vai precisar."],
    ["charles", "Eles é que vão precisar."]
];

proxima_sala = noone;   // depois da cena, vai para a próxima sala da Ordem das salas

tocar_musica(mus_abertura, 0.4);    // <- NOVA
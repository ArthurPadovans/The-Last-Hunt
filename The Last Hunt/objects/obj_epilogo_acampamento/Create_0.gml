event_inherited();

view_enabled = false;

titulo = "ANOS DEPOIS";
subtitulo = "Um acampamento, a beira da estrada";

falas = [
    ["velho", "Sentem-se, crianças. Hoje eu conto a história de Charles Logan."],
    ["povo", "Ele era um herói?"],
    ["velho", "Não sei se herói. Era um caçador. Um homem sozinho contra a gangue mais temida do Oeste."],
    ["povo", "E ele venceu?"],
    ["velho", "Venceu. Derrubou o chefe deles e tombou ali mesmo, ao lado dele."],
    ["povo", "Que triste."],
    ["velho", "Triste, talvez. Mas repare: eu nunca o vi na vida, e aqui estou eu, contando a história dele para vocês."],
    ["velho", "E um dia vocês vão contar para os filhos de vocês."]
];

proxima_sala = sala_epilogo_cidade;

tocar_musica(mus_cena, 0.4);    // <- NOVA
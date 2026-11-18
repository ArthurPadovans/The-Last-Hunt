// A lista de falas. Cada fala é [quem fala, texto]. As cenas trocam isto.
falas = [
    ["charles", "Texto de teste."]
];
proxima_sala = noone;    // para onde ir quando acabar (cada cena define)

// Cartão de título opcional, que aparece antes da cena. Deixe "" para não ter.
titulo = "";
subtitulo = "";
titulo_criado = false;

indice = 0;              // número da fala atual
caractere = 0;           // quantas letras já apareceram
velocidade_texto = 0.7;  // letras por passo (maior = texto mais rápido)
pular = 0;               // quanto tempo o botão direito está apertado
depth = -1000;

// ---------- PERSONAGENS: o rosto e a cor de cada um ----------
// Para um personagem novo: crie o sprite do rosto e acrescente uma linha aqui.
personagens = {
    charles: { rosto: spr_rosto_charles, cor: make_color_rgb(190, 90, 40) },
    medico:  { rosto: spr_rosto_medico,  cor: make_color_rgb(80, 130, 120) },
    xerife:  { rosto: spr_rosto_xerife,  cor: make_color_rgb(200, 150, 50) },
    povo:    { rosto: spr_rosto_povo,    cor: make_color_rgb(150, 100, 70) },
	povo2:   { rosto: spr_rosto_povo2,   cor: make_color_rgb(140, 120, 80) },
    velho:   { rosto: spr_rosto_velho,   cor: make_color_rgb(120, 110, 150) },
	crianca: { rosto: spr_rosto_crianca, cor: make_color_rgb(170, 120, 90) }
};

// Cor da sombra que fica atrás do texto
cor_sombra_texto = make_color_rgb(110, 40, 20);
depth = 20000;   // fica atrás de tudo

// Cores quentes do degradê (troque se quiser)
cor1 = make_color_rgb(190, 50, 30);    // vermelho-alaranjado
cor2 = make_color_rgb(235, 130, 20);   // laranja
cor3 = make_color_rgb(235, 185, 60);   // mostarda
cor4 = make_color_rgb(140, 30, 40);    // vinho

escurecer = 0.3;   // 0 = cores vivas, 1 = preto

// ---------- PISCADA (quando alguém morre) ----------
piscar_ligado = true;   // coloque false para desligar o efeito
piscada = 0;            // 1 quando alguém acaba de morrer, e vai diminuindo até 0
fase = 0;               // em que ponto do ciclo de cores o fundo está
cor_flash = make_color_rgb(255, 200, 80);   // o clarão quente da piscada
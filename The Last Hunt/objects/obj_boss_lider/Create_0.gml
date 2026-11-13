vida_max = 25;
vida = vida_max;
velocidade = 2;          // aumenta a cada fase da luta
alcance = 700;           // até onde ele enxerga
distancia_ideal = 320;   // distância que ele tenta manter de você

fase_boss = 1;           // 1, 2 ou 3 (muda conforme a vida cai)
acordou = false;         // vira true quando ele te vê pela primeira vez

recarga = 90;            // tempo até a próxima rajada
rajada = 0;              // tiros da rajada que ainda faltam
tempo_rajada = 0;        // espera entre um tiro e outro da rajada
recarga_dinamite = 200;  // tempo até a próxima dinamite

lado = choose(-1, 1);    // para que lado ele desvia
tempo_lado = 90;         // de quanto em quanto tempo ele troca de lado
piscar = 0;              // para piscar vermelho ao levar tiro

// ---------- FIM DA LUTA ----------
derrotado = false;       // vira true quando a vida zera (ele cai de joelhos, mas não morre)
contador_fim = 0;        // tempo até começar o duelo final
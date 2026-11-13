view_enabled = false;   // esta sala não usa a câmera que segue o jogador
depth = -100;

// ---------- NOMES (troque aqui, se quiser) ----------
var gangue = "Red Jays";
var lider = "Silas Mercer";

titulo_site = "Charles Logan";
subtitulo_site = "O cacador de recompensas que virou lenda";

paragrafos = [
    "Charles Logan (? - 1870) foi um cacador de recompensas do Velho Oeste. Em 1870, aceitou o que seria o seu ultimo trabalho: perseguir os " + gangue + ", a gangue mais temida da fronteira.",
    "Sozinho, derrubou os capangas, enfrentou o lider " + lider + " em um duelo ao meio-dia e venceu. Logan morreu pouco depois, no mesmo lugar.",
    "Registros de um medico da epoca indicam que ele sofria de uma pneumonia em estado avancado e sabia que nao viveria muito. Mesmo assim, partiu para a cacada.",
    "Hoje, a sua historia e contada em saloons, acampamentos e cidades de todo o Oeste. O nome dele sobreviveu a ele."
];

// O cartão "HOJE" aparece primeiro
var cartao = instance_create_layer(0, 0, "Instances", obj_titulo_cena);
cartao.texto = "HOJE";
cartao.subtitulo = "";
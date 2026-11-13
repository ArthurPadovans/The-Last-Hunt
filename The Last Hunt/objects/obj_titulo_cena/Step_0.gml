tempo += 1;

// O texto aparece, fica parado e some (60 passos = 1 segundo)
if (tempo < 40) {
    alfa_texto = tempo / 40;
} else if (tempo < 160) {
    alfa_texto = 1;
} else if (tempo < 200) {
    alfa_texto = 1 - (tempo - 160) / 40;
} else {
    alfa_texto = 0;
}

// O fundo preto só começa a clarear depois que o texto sumiu
if (tempo > 200) {
    alfa_fundo = 1 - (tempo - 200) / 60;
}

if (alfa_fundo <= 0) {
    instance_destroy();
}
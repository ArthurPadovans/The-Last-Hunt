// Efeito de mola: a porta é puxada até o alvo, passa um pouquinho e assenta
vel = (vel + (alvo - abertura) * 0.12) * 0.7;
abertura += vel;
image_angle = angulo_fechada + abertura;
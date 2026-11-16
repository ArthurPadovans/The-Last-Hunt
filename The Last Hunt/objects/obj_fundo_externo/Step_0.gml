// A piscada vai sumindo (0.05 = dura uns 0,3 segundo)
if (piscada > 0) {
    piscada = max(0, piscada - 0.05);
}

// O ciclo de cores anda sozinho e acelera durante a piscada
fase += 16 * (1 + piscada * 6);
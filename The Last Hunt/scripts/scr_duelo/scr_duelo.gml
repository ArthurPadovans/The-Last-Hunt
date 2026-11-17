// Avança um passo da animação de um personagem do duelo e devolve o quadro novo.
// _modo: 0 = parado (repete), 1 = sacar e atirar (toca uma vez), 2 = cair (toca uma vez)
function duelo_anim(_modo, _f, _parado, _saca, _cai, _v_parado, _v_saca, _v_cai) {
    if (_modo == 0) {
        _f += _v_parado;
        if (_f < _parado[0] || _f >= _parado[1] + 1) {
            _f = _parado[0];
        }
    } else if (_modo == 1) {
        if (_f < _saca[0]) {
            _f = _saca[0];
        }
        _f = min(_f + _v_saca, _saca[1]);   // no último quadro, fica parado
    } else {
        if (_f < _cai[0]) {
            _f = _cai[0];
        }
        _f = min(_f + _v_cai, _cai[1]);
    }
    return _f;
}
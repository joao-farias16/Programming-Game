/// scr_pontos_errar(_area_resposta, _desconto)
function scr_pontos_errar(_area_resposta, _desconto) {
    _area_resposta.pontuacao_fase_atual = max(0, _area_resposta.pontuacao_fase_atual - _desconto);
}
/// scr_calcular_pontuacao_total()
function scr_calcular_pontuacao_total() {
    var _total = 0;
    var _chave = ds_map_find_first(global.pontos_fases);
    
    while (!is_undefined(_chave)) {
        _total += ds_map_find_value(global.pontos_fases, _chave);
        _chave = ds_map_find_next(global.pontos_fases, _chave);
    }
    
    return _total;
}
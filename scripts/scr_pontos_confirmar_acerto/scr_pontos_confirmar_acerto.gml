/// scr_pontos_confirmar_acerto(_area_resposta, _sufixo)
function scr_pontos_confirmar_acerto(_area_resposta, _sufixo) {
    
    if (!variable_global_exists("pontos_fases") || !ds_exists(global.pontos_fases, ds_type_map)) {
        global.pontos_fases = ds_map_create();
    }
    
    var _nome_chave = "fase" + string(room) + _sufixo;
    
    ds_map_set(global.pontos_fases, _nome_chave, _area_resposta.pontuacao_fase_atual);
    
    show_debug_message("Pontuação da " + _nome_chave + ": " + string(_area_resposta.pontuacao_fase_atual));
    show_debug_message("Pontuação total: " + string(scr_calcular_pontuacao_total()));
}
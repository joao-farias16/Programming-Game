/// scr_normalizar_codigo(_texto)
/// Normaliza um código digitado para comparação:
/// - remove comentários (tudo após #)
/// - remove espaços, tabs e quebras de linha
/// - deixa tudo minúsculo
function scr_normalizar_codigo(_texto) {
    var _linhas = string_split(_texto, "\n");
    var _resultado = "";
    
    for (var i = 0; i < array_length(_linhas); i++) {
        var _linha = _linhas[i];
        
        // Remove comentário (tudo depois do #), se existir
        var _pos_comentario = string_pos("#", _linha);
        if (_pos_comentario > 0) {
            _linha = string_copy(_linha, 1, _pos_comentario - 1);
        }
        
        _resultado += _linha;
    }
    
    // Remove espaços, tabs, quebras de linha e deixa minúsculo
    _resultado = string_lower(_resultado);
    _resultado = string_replace_all(_resultado, " ", "");
    _resultado = string_replace_all(_resultado, "\t", "");
    _resultado = string_replace_all(_resultado, "\r", "");
    
    return _resultado;
}
if (instance_exists(SAreaResposta_NV16)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV16.estado_atual == ESTADO_FASE.ACERTO) {
        global.fase16_concluida = true;
        global.fase17_desbloqueada = true;
        
        with (OTransicao) {
            indo = true;
            proxima_sala = Bloco4Concluido;
        }
        
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = scr_normalizar_codigo(SAreaResposta_NV16.texto_digitado);
        
        // Respostas aceitas (variações válidas do código corrigido)
        var resposta_1 = scr_normalizar_codigo("x = 10\nif x == 10:\nprint(\"e dez!\")");
        var resposta_2 = scr_normalizar_codigo("x = 10\nif x == 10:\nprint(\"e dez!\")");
        
        // Resposta correta
        if (comando == resposta_1 || comando == resposta_2) {
            
            SAreaResposta_NV16.estado_atual = ESTADO_FASE.ACERTO;
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV16.estado_atual = ESTADO_FASE.ERRO;
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV16.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
}
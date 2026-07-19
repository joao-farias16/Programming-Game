if (instance_exists(SAreaResposta_NV19)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV19.estado_atual == ESTADO_FASE.ACERTO) {
        global.fase19_concluida = true;
        global.fase20_desbloqueada = true;
        
        with (OTransicao) {
            indo = true;
            proxima_sala = Nivel20;
        }
        
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = scr_normalizar_codigo(SAreaResposta_NV19.texto_digitado);
        
        // Respostas aceitas (variações válidas do código corrigido)
        var resposta_1 = scr_normalizar_codigo("temp = 25\nif temp > 30:\nprint(\"quente\")\nelif temp > 15:\nprint(\"agradavel\")\nelse:\nprint(\"frio\")");
        
        // Resposta correta
        if (comando == resposta_1) {
            
            SAreaResposta_NV19.estado_atual = ESTADO_FASE.ACERTO;
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV19.estado_atual = ESTADO_FASE.ERRO;
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV19.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
}
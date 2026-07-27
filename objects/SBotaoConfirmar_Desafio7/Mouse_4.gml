if (instance_exists(SAreaResposta_Desafio7)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_Desafio7.estado_atual == ESTADO_FASE.ACERTO) {
        global.desafio7_concluido = true;
		global.niveis_completos++
        
        with (OTransicao) {
            indo = true;
            proxima_sala = Desafio8;
        }
        
    } 
    // Se ainda está testando o código:
    else {
        
        // Resposta correta
        if (scr_validar_desafio(7, SAreaResposta_Desafio7.texto_digitado)) {
            
            SAreaResposta_Desafio7.estado_atual = ESTADO_FASE.ACERTO;
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_Desafio7.estado_atual = ESTADO_FASE.ERRO;
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_Desafio7.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
}
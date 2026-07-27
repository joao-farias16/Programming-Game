if (instance_exists(SAreaResposta_Desafio3)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_Desafio3.estado_atual == ESTADO_FASE.ACERTO) {
        global.desafio3_concluido = true;
		global.niveis_completos++
        
        with (OTransicao) {
            indo = true;
            proxima_sala = Desafio4;
        }
        
    } 
    // Se ainda está testando o código:
    else {
        
        // Resposta correta
        if (scr_validar_desafio(3, SAreaResposta_Desafio3.texto_digitado)) {
            
            SAreaResposta_Desafio3.estado_atual = ESTADO_FASE.ACERTO;
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_Desafio3.estado_atual = ESTADO_FASE.ERRO;
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_Desafio3.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
}
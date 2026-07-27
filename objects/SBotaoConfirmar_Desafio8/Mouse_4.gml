if (instance_exists(SAreaResposta_Desafio8)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_Desafio8.estado_atual == ESTADO_FASE.ACERTO) {
        global.desafio8_concluido = true;
		global.niveis_completos++
        
        with (OTransicao) {
            indo = true;
            proxima_sala = DesafiosConcluidos;
        }
        
    } 
    // Se ainda está testando o código:
    else {
        
        // Resposta correta
        if (scr_validar_desafio(8, SAreaResposta_Desafio8.texto_digitado)) {
            
            SAreaResposta_Desafio8.estado_atual = ESTADO_FASE.ACERTO;
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_Desafio8.estado_atual = ESTADO_FASE.ERRO;
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_Desafio8.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
}
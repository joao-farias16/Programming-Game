if (instance_exists(SAreaResposta_NV3)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV3.estado_atual == ESTADO_FASE.ACERTO) {
		global.fase3_concluida = true
		global.fase4_desbloqueada = true
		
		with OTransicao {
			indo = true
			proxima_sala = Bloco1Concluido
		}
		
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = string_trim(SAreaResposta_NV3.texto_digitado)
        
        // Resposta correta
        if (string_lower(comando) == "#") {
            
            SAreaResposta_NV3.estado_atual = ESTADO_FASE.ACERTO
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV3.estado_atual = ESTADO_FASE.ERRO
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps)
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV3.alarm[0] = 1 * game_get_speed(gamespeed_fps)
        } 
    } 
}
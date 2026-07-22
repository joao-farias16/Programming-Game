if (instance_exists(SAreaResposta_NV31)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV31.estado_atual == ESTADO_FASE.ACERTO) {
		global.fase31_concluida = true
		global.fase32_desbloqueada = true
		
		with OTransicao {
			indo = true
			proxima_sala = Nivel32
		}
		
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = string_trim(SAreaResposta_NV31.texto_digitado)
        
        // Resposta correta
        if (string_lower(comando) == "in") {
            
            SAreaResposta_NV31.estado_atual = ESTADO_FASE.ACERTO
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV31.estado_atual = ESTADO_FASE.ERRO
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps)
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV31.alarm[0] = 1 * game_get_speed(gamespeed_fps)
        } 
    } 
}
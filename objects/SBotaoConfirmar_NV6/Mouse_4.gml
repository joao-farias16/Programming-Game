if (instance_exists(SAreaResposta_NV6)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV6.estado_atual == ESTADO_FASE.ACERTO) {
		global.fase6_concluida = true
		global.fase7_desbloqueada = true
		
		with OTransicao {
			indo = true
			proxima_sala = TelaNiveis
		}
		
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = string_trim(SAreaResposta_NV6.texto_digitado)
        
        // Resposta correta
        if (string_lower(comando) == ">") {
            
            SAreaResposta_NV6.estado_atual = ESTADO_FASE.ACERTO
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV6.estado_atual = ESTADO_FASE.ERRO
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps)
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV6.alarm[0] = 1 * game_get_speed(gamespeed_fps)
        } 
    } 
}
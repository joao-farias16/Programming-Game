if (instance_exists(SAreaResposta_NV9)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV9.estado_atual == ESTADO_FASE.ACERTO) {
		global.fase9_concluida = true
		global.fase10_desbloqueada = true
		
		with OTransicao {
			indo = true
			proxima_sala = Nivel10
		}
		
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = string_trim(SAreaResposta_NV9.texto_digitado)
        
        // Resposta correta
        if (string_lower(comando) == "int") {
            
            SAreaResposta_NV9.estado_atual = ESTADO_FASE.ACERTO
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV9.estado_atual = ESTADO_FASE.ERRO
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps)
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV9.alarm[0] = 1 * game_get_speed(gamespeed_fps)
        } 
    } 
}
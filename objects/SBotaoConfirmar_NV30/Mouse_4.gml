if (instance_exists(SAreaResposta_NV30) && instance_exists(SAreaResposta2NV30)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV30.estado_atual == ESTADO_FASE.ACERTO && SAreaResposta2NV30.estado_atual == ESTADO_FASE.ACERTO) {
		global.fase30_concluida = true
		global.fase31_desbloqueada = true
		global.niveis_completos++
		
		with OTransicao {
			indo = true
			proxima_sala = Nivel31
		}
		
    } 
    // Se ainda está testando o código:
    else {
        
        var comando1 = string_trim(SAreaResposta_NV30.texto_digitado)
        var comando2 = string_trim(SAreaResposta2NV30.texto_digitado)
        
        // Resposta correta
        if (string_lower(comando1) == "and" && string_lower(comando2) == "%") {
            
            SAreaResposta_NV30.estado_atual = ESTADO_FASE.ACERTO
            SAreaResposta2NV30.estado_atual = ESTADO_FASE.ACERTO
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV30.estado_atual = ESTADO_FASE.ERRO
            SAreaResposta2NV30.estado_atual = ESTADO_FASE.ERRO
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps)
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV30.alarm[0] = 1 * game_get_speed(gamespeed_fps)
            SAreaResposta2NV30.alarm[0] = 1 * game_get_speed(gamespeed_fps)
        } 
    } 
}
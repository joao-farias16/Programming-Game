if (instance_exists(SAreaResposta_NV15)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV15.estado_atual == ESTADO_FASE.ACERTO) {
		global.fase15_concluida = true
		global.fase16_desbloqueada = true
		global.niveis_completos++
		
		with OTransicao {
			indo = true
			proxima_sala = Nivel16
		}
		
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = string_trim(SAreaResposta_NV15.texto_digitado)
        
        // Resposta correta
        if (string_lower(comando) == "and") {
            
            SAreaResposta_NV15.estado_atual = ESTADO_FASE.ACERTO
			
			scr_pontos_confirmar_acerto(SAreaResposta_NV15, "");

            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV15.estado_atual = ESTADO_FASE.ERRO
			
			scr_pontos_errar(SAreaResposta_NV15, 125);
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps)
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV15.alarm[0] = 1 * game_get_speed(gamespeed_fps)
        } 
    } 
}
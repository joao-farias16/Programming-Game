if (instance_exists(SAreaResposta_NV23)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV23.estado_atual == ESTADO_FASE.ACERTO) {
		global.fase23_concluida = true
		global.fase24_desbloqueada = true
		global.niveis_completos++
		
		with OTransicao {
			indo = true
			proxima_sala = Nivel24
		}
		
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = string_trim(SAreaResposta_NV23.texto_digitado)
        
        // Resposta correta
        if (string_lower(comando) == "2") {
            
            SAreaResposta_NV23.estado_atual = ESTADO_FASE.ACERTO
			
			scr_pontos_confirmar_acerto(SAreaResposta_NV23, "");

            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV23.estado_atual = ESTADO_FASE.ERRO
			
			scr_pontos_errar(SAreaResposta_NV23, 125);
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps)
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV23.alarm[0] = 1 * game_get_speed(gamespeed_fps)
        } 
    } 
}
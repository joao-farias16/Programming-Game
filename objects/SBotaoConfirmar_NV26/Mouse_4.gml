if (instance_exists(SAreaResposta_NV26)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV26.estado_atual == ESTADO_FASE.ACERTO) {
        global.fase26_concluida = true;
        global.fase27_desbloqueada = true;
        global.niveis_completos++
		
        with (OTransicao) {
            indo = true;
            proxima_sala = Nivel27;
        }
        
    } 
    // Se ainda está testando o código:
    else {
        
		var codigo_original = SAreaResposta_NV26.texto_digitado;
		var comando = scr_normalizar_codigo(codigo_original);
        
        // Respostas aceitas (variações válidas do código corrigido)
        var resposta_1 = scr_normalizar_codigo("if true:\nprint(\"ola\")");
		
		var tem_indentacao = string_pos("\n    print", string_lower(codigo_original)) > 0;
        
        // Resposta correta
        if (comando == resposta_1 && tem_indentacao) {
            
            SAreaResposta_NV26.estado_atual = ESTADO_FASE.ACERTO;
			
			scr_pontos_confirmar_acerto(SAreaResposta_NV26, "");

            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV26.estado_atual = ESTADO_FASE.ERRO;
			
			scr_pontos_errar(SAreaResposta_NV26, 125);
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV26.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
}
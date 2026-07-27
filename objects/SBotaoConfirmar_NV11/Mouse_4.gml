if (instance_exists(SAreaResposta_NV11)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV11.estado_atual == ESTADO_FASE.ACERTO) {
        global.fase11_concluida = true;
        global.fase12_desbloqueada = true;
		global.niveis_completos++
        
        with (OTransicao) {
            indo = true;
            proxima_sala = Bloco3Concluido;
        }
        
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = scr_normalizar_codigo(SAreaResposta_NV11.texto_digitado);
        
        // Respostas aceitas (variações válidas do código corrigido)
        var resposta_1 = scr_normalizar_codigo("a = 10\nb = 20\na, b = b, a\nprint(a, b)");
        var resposta_2 = scr_normalizar_codigo("a = 10\nb = 20\nb, a = a, b\nprint(a, b)");
        
        // Resposta correta
        if (comando == resposta_1 || comando == resposta_2) {
            
            SAreaResposta_NV11.estado_atual = ESTADO_FASE.ACERTO;
			
			scr_pontos_confirmar_acerto(SAreaResposta_NV11, "");

            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV11.estado_atual = ESTADO_FASE.ERRO;
			
			scr_pontos_errar(SAreaResposta_NV11, 125);
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV11.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
}
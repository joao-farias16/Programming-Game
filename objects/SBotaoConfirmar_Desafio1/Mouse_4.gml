if (instance_exists(SAreaResposta_Desafio1)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_Desafio1.estado_atual == ESTADO_FASE.ACERTO) {
        global.desafio1_concluido = true;
		global.niveis_completos++
        
        with (OTransicao) {
            indo = true;
            proxima_sala = Desafio2;
        }
        
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = scr_normalizar_codigo(SAreaResposta_Desafio1.texto_digitado);
        
        // Respostas aceitas (variações válidas do código corrigido)
        var resposta_1 = scr_normalizar_codigo("palavra = \"arara\"\nif palavra == palavra[::-1]:\nprint(\"e um palindromo\")\nelse:\nprint(\"nao e um palindromo\")");
        
        // Resposta correta
        if (comando == resposta_1) {
            
            SAreaResposta_Desafio1.estado_atual = ESTADO_FASE.ACERTO;
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_Desafio1.estado_atual = ESTADO_FASE.ERRO;
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_Desafio1.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
}
if (instance_exists(SAreaResposta)) {
    
    // Se o jogador já acertou e o botão virou "Continuar", ele avança de fase
    if (SAreaResposta.estado_atual == ESTADO_FASE.ACERTO) {
       with OTransicao {
		indo = true
		proxima_sala = TelaNiveis
}
    } 
    // Se ainda está testando o código:
    else {
        var comando = string_trim(SAreaResposta.texto_digitado);
        
        if (string_lower(comando) == "print") {
            SAreaResposta.estado_atual = ESTADO_FASE.ACERTO;
            SAreaResposta.texto_resultado = "A mensagem apareceu na tela!";
            SAreaResposta.texto_conceito = "Conceito: print() exibe informações no terminal.";
        } 
        else {
            // Se errou:
            SAreaResposta.estado_atual = ESTADO_FASE.ERRO;
            SAreaResposta.texto_resultado = "Código incorreto.";
            
            // ⏰ ATIVAR OS ALARMES DE 7 SEGUNDOS:
            
            // Ativa o alarme 0 do objeto de imagem para mudar o sprite de volta
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Ativa o alarme 0 da AreaResposta para limpar as mensagens da tela
            SAreaResposta.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
} 
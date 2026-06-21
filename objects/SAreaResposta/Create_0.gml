// Definindo os estados do nível
enum ESTADO_FASE {
    AGUARDANDO,
    ACERTO,
    ERRO
}

estado_atual = ESTADO_FASE.AGUARDANDO;
texto_digitado = "";
clicado = false;
posicao_cursor = 0; // posição do cursor no texto

// Textos de feedback
texto_resultado = "Aguardando código...";
texto_conceito = "";
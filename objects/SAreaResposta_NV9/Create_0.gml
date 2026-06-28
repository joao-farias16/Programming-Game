estado_atual = ESTADO_FASE.AGUARDANDO;
texto_digitado = "";
clicado = false;
posicao_cursor = 0; // posição do cursor no texto


// Textos de feedback
texto_resultado = "Aguardando código...";
texto_conceito = "";


if (instance_exists(SBotaoConfirmar_NV9)) {
    SBotaoConfirmar_NV9.area_resposta_id = id;
}
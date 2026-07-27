estado_atual = ESTADO_FASE.AGUARDANDO;
texto_digitado = "";
clicado = false;
posicao_cursor = 0; // posição do cursor no texto


// Textos de feedback
texto_resultado = "Aguardando código...";
texto_conceito = "";


if (instance_exists(SBotaoConfirmar_NV28)) {
    SBotaoConfirmar_NV28.area_resposta_id = id;
}

max_caracteres_linha = 46; // quantidade máxima por linha
max_linhas = 2;            // quantidade máxima de linhas

scr_pontos_iniciar(3000);

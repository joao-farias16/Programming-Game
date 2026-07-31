estado_atual = ESTADO_FASE.AGUARDANDO;
texto_digitado = "";
clicado = false;
posicao_cursor = 0; // posição do cursor no texto


// Textos de feedback
texto_resultado = "Aguardando código...";
texto_conceito = "";


if (instance_exists(SBotaoConfirmar_Desafio7)) {
    SBotaoConfirmar_Desafio7.area_resposta_id = id;
}

max_caracteres_linha = 64; // quantidade máxima por linha
max_linhas = 10;            // quantidade máxima de linhas

scr_pontos_iniciar(3000);
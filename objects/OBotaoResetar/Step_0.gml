// Obtém a posição atual do mouse na GUI
var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

// Verifica se o botão esquerdo do mouse foi pressionado
if (mouse_check_button_pressed(mb_left)) {

	// Verifica se o clique ocorreu dentro da área do botão Cancelar
	if (point_in_rectangle(mx, my, 885, 560, 1030, 600)) {

        // Fecha a janela de confirmação
        mostrar_confirmacao = false
    }

	// Verifica se o clique ocorreu dentro da área do botão Confirmar
	if (point_in_rectangle(mx, my, 1040, 560, 1185, 600)) {

        // Fecha a janela de confirmação
        mostrar_confirmacao = false;

        // Ativa a exibição da notificação
        mostrar_notificacao = true;

        // Coloca a notificação fora da tela para iniciar a animação de entrada
        notif_x = 2000;

        // Reinicia o contador da animação
        tempo_notificacao = 0;

		// Controle de desbloqueio
		// Mantém apenas a fase 1 desbloqueada
		global.fase1_desbloqueada = true
		global.fase2_desbloqueada = false
		global.fase3_desbloqueada = false
		global.fase4_desbloqueada = false
		global.fase5_desbloqueada = false
		global.fase6_desbloqueada = false
		global.fase7_desbloqueada = false
		global.fase8_desbloqueada = false
		global.fase9_desbloqueada = false
		global.fase10_desbloqueada = false
		global.fase11_desbloqueada = false
		global.fase12_desbloqueada = false
		global.fase13_desbloqueada = false
		global.fase14_desbloqueada = false
		global.fase15_desbloqueada = false
		global.fase16_desbloqueada = false
		global.fase17_desbloqueada = false
		global.fase18_desbloqueada = false
		global.fase19_desbloqueada = false
		global.fase20_desbloqueada = false
		global.fase21_desbloqueada = false
		global.fase22_desbloqueada = false
		global.fase23_desbloqueada = false
		global.fase24_desbloqueada = false
		global.fase25_desbloqueada = false
		global.fase26_desbloqueada = false
		global.fase27_desbloqueada = false
		global.fase28_desbloqueada = false
		global.fase29_desbloqueada = false
		global.fase30_desbloqueada = false
		global.fase31_desbloqueada = false
		global.fase32_desbloqueada = false

		// Controle de conclusão
		// Marca todas as fases como não concluídas
		global.fase1_concluida = false
		global.fase2_concluida = false
		global.fase3_concluida = false
		global.fase4_concluida = false
		global.fase5_concluida = false
		global.fase6_concluida = false
		global.fase7_concluida = false
		global.fase8_concluida = false
		global.fase9_concluida = false
		global.fase10_concluida = false
		global.fase11_concluida = false
		global.fase12_concluida = false
		global.fase13_concluida = false
		global.fase14_concluida = false
		global.fase15_concluida = false
		global.fase16_concluida = false
		global.fase17_concluida = false
		global.fase18_concluida = false
		global.fase19_concluida = false
		global.fase20_concluida = false
		global.fase21_concluida = false
		global.fase22_concluida = false
		global.fase23_concluida = false
		global.fase24_concluida = false
		global.fase25_concluida = false
		global.fase26_concluida = false
		global.fase27_concluida = false
		global.fase28_concluida = false
		global.fase29_concluida = false
		global.fase30_concluida = false
		global.fase31_concluida = false
		global.fase32_concluida = false
    }
}

// Verifica se a notificação está ativa
if (mostrar_notificacao)
{
    // Incrementa o contador de tempo
    tempo_notificacao++;

    // Primeira parte da animação: entrada
    if (tempo_notificacao < 30)
    {
        // Move suavemente a notificação para dentro da tela
        notif_x = lerp(notif_x, 1450, 0.15);
    }

    // Após alguns segundos começa a saída
    if (tempo_notificacao > 180)
    {
        // Move suavemente a notificação para fora da tela
        notif_x = lerp(notif_x, 2000, 0.15);

        // Quando estiver praticamente fora da tela
        if (abs(notif_x - 2000) < 5)
        {
            // Esconde a notificação
            mostrar_notificacao = false;
        }
    }
}

// Verifica se a janela de confirmação está aberta
if (mostrar_confirmacao)
{
    // Faz a animação de abertura crescer suavemente até o tamanho normal
    anim_confirmacao = lerp(anim_confirmacao, 1, 0.15);
}
else
{
    // Reseta a animação quando a janela é fechada
    anim_confirmacao = 0;
}
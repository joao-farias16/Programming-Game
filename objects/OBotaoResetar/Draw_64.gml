// Define a escala atual da animação
var escala = anim_confirmacao;

// Verifica se a janela de confirmação deve ser exibida
if (mostrar_confirmacao)
{
    // Desenha o fundo escurecido sobre a tela
    draw_sprite(SFundo, 0, 0, 0);

    // Desenha a janela de confirmação com animação de escala
    draw_sprite_ext(
        SConfirmarResetFundo,
        0,
        960,
        540,
        escala,
        escala,
        0,
        c_white,
        1
    );

    // Desenha o botão de cancelar com animação de escala
    draw_sprite_ext(
        SBotaoCancelarReset,
        0,
        885,
        560,
        escala,
        escala,
        0,
        c_white,
        1
    );

    // Desenha o botão de confirmar com animação de escala
    draw_sprite_ext(
        SBotaoConfirmarReset,
        0,
        1040,
        560,
        escala,
        escala,
        0,
        c_white,
        1
    );
}

// Verifica se a notificação de sucesso deve ser exibida
if (mostrar_notificacao)
{
    // Desenha a notificação na posição atual
    draw_sprite(SResetSucesso, 0, notif_x, notif_y);
}
var escala = anim_confirmacao;

if (mostrar_confirmacao)
{
    draw_sprite(SFundo, 0, 0, 0);

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

if (mostrar_notificacao)
{
    draw_sprite(SResetSucesso, 0, notif_x, notif_y);
}
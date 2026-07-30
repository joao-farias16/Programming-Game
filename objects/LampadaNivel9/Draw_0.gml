draw_self()

// Dica 1
if (nivel_dica >= 1)
{
    draw_set_alpha(alpha_dica1);

    draw_sprite(
        Nivel9Leve,
        0,
        71,
        687 - offset_dica1
    );
}

// Dica 2
if (nivel_dica >= 2)
{
    draw_set_alpha(alpha_dica2);

    draw_sprite(
        Nivel9Intermediaria,
        0,
        678,
        687 - offset_dica2
    );
}

// Dica 3
if (nivel_dica >= 3)
{
    draw_set_alpha(alpha_dica3);

    draw_sprite(
        Nivel9Direta,
        0,
        1285,
        687 - offset_dica3
    );
}

// Restaura o alpha
draw_set_alpha(1);
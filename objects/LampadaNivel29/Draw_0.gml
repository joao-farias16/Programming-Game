draw_self()

// Dica 1
if (nivel_dica >= 1)
{
    draw_set_alpha(alpha_dica1);

    draw_sprite(
        Nivel29Leve,
        0,
        71,
        882 - offset_dica1
    );
}

// Dica 2
if (nivel_dica >= 2)
{
    draw_set_alpha(alpha_dica2);

    draw_sprite(
        Nivel29Intermediaria,
        0,
        678,
        882 - offset_dica2
    );
}

// Dica 3
if (nivel_dica >= 3)
{
    draw_set_alpha(alpha_dica3);

    draw_sprite(
        Nivel29Direta,
        0,
        1285,
        882 - offset_dica3
    );
}

// Restaura o alpha
draw_set_alpha(1);
if (nivel_dica == 0)
{
    nivel_dica = 1;

    alpha_dica1 = 0;
    offset_dica1 = 10;

    scr_pontos_errar(SAreaResposta_NV30, 100);
    scr_pontos_errar(SAreaResposta2NV30, 100);
}

else if (nivel_dica == 1)
{
    nivel_dica = 2;

    alpha_dica2 = 0;
    offset_dica2 = 10;

    scr_pontos_errar(SAreaResposta_NV30, 150);
    scr_pontos_errar(SAreaResposta2NV30, 150);
}

else if (nivel_dica == 2)
{
    nivel_dica = 3;

    alpha_dica3 = 0;
    offset_dica3 = 10;

    scr_pontos_errar(SAreaResposta_NV30, 200);
    scr_pontos_errar(SAreaResposta2NV30, 200);
}
/// scr_calcular_nota()

function scr_calcular_nota()
{
    if (!variable_global_exists("pontos_fases") || !ds_exists(global.pontos_fases, ds_type_map))
        return 0;

    var pontuacao_total = scr_calcular_pontuacao_total();

    var fases_concluidas = ds_map_size(global.pontos_fases);

    if (fases_concluidas <= 0)
        return 0;

    var pontuacao_maxima = fases_concluidas * 3000;

    var nota = (pontuacao_total / pontuacao_maxima) * 10;

    // Arredondamento para 0,5
    nota = round(nota * 2) / 2;

    return clamp(nota, 0, 10);
}
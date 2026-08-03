function scr_salvar_jogo()
{
    var dados = {};

    // ==========================
    // Configurações
    // ==========================
    dados.som_ativo = global.som_ativo;
    dados.volume = global.volume;
    dados.fullscreen = global.fullscreen;

    // ==========================
    // Progresso geral
    // ==========================
    dados.niveis_completos = global.niveis_completos;

    // ==========================
    // Fases desbloqueadas
    // ==========================
    dados.fases_desbloqueadas = [];

    for (var i = 1; i <= 32; i++)
    {
        array_push(
            dados.fases_desbloqueadas,
            variable_global_get("fase" + string(i) + "_desbloqueada")
        );
    }

    // ==========================
    // Fases concluídas
    // ==========================
    dados.fases_concluidas = [];

    for (var i = 1; i <= 32; i++)
    {
        array_push(
            dados.fases_concluidas,
            variable_global_get("fase" + string(i) + "_concluida")
        );
    }

    // ==========================
    // Desafios concluídos
    // ==========================
    dados.desafios_concluidos = [];

    for (var i = 1; i <= 8; i++)
    {
        array_push(
            dados.desafios_concluidos,
            variable_global_get("desafio" + string(i) + "_concluido")
        );
    }
	
	// ==========================
	// Pontuações
	// ==========================
	dados.pontos_fases = {};

	if (variable_global_exists("pontos_fases"))
	{
	    if (ds_exists(global.pontos_fases, ds_type_map))
	    {
	        var chave = ds_map_find_first(global.pontos_fases);

	        while (!is_undefined(chave))
	        {
	            variable_struct_set(
	                dados.pontos_fases,
	                chave,
	                ds_map_find_value(global.pontos_fases, chave)
	            );

	            chave = ds_map_find_next(global.pontos_fases, chave);
	        }
	    }
	}

    // ==========================
    // Converte para JSON
    // ==========================
    var json = json_stringify(dados);

    // ==========================
    // Salva o arquivo
    // ==========================
    var arquivo = file_text_open_write("save.json");

    file_text_write_string(arquivo, json);

    file_text_close(arquivo);

    show_debug_message("Jogo salvo com sucesso!");
}
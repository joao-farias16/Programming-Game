function scr_carregar_jogo()
{
    // ==========================
    // Verifica se existe save
    // ==========================
    if (!file_exists("save.json"))
    {
        scr_salvar_jogo();
        return;
    }

    // ==========================
    // Lê o arquivo
    // ==========================
    var arquivo = file_text_open_read("save.json");
    var json = "";

    while (!file_text_eof(arquivo))
    {
        json += file_text_read_string(arquivo);

        if (!file_text_eof(arquivo))
        {
            file_text_readln(arquivo);
        }
    }

    file_text_close(arquivo);

    // ==========================
    // Converte o JSON
    // ==========================
    var dados = json_parse(json);

    // ==========================
    // Configurações
    // ==========================
    global.som_ativo = dados.som_ativo;
    global.volume = dados.volume;
    global.fullscreen = dados.fullscreen;
	
	// Aplica as configurações carregadas
	audio_master_gain(global.som_ativo ? global.volume : 0);

	window_set_fullscreen(global.fullscreen);

	if (!global.fullscreen)
	{
	    var base_w = 1920;
	    var base_h = 1080;

	    var display_w = display_get_width();
	    var display_h = display_get_height();

	    var scale = min(display_w / base_w, display_h / base_h);

	    var final_w = base_w * scale;
	    var final_h = base_h * scale;

	    window_set_size(final_w, final_h);
	    window_center();
	}

    // ==========================
    // Progresso geral
    // ==========================
    global.niveis_completos = dados.niveis_completos;

    // ==========================
    // Fases desbloqueadas
    // ==========================
    for (var i = 1; i <= 32; i++)
    {
        variable_global_set(
            "fase" + string(i) + "_desbloqueada",
            dados.fases_desbloqueadas[i - 1]
        );
    }

    // ==========================
    // Fases concluídas
    // ==========================
    for (var i = 1; i <= 32; i++)
    {
        variable_global_set(
            "fase" + string(i) + "_concluida",
            dados.fases_concluidas[i - 1]
        );
    }

    // ==========================
    // Desafios concluídos
    // ==========================
    for (var i = 1; i <= 8; i++)
    {
        variable_global_set(
            "desafio" + string(i) + "_concluido",
            dados.desafios_concluidos[i - 1]
        );
    }
	
	// ==========================
	// Pontuações
	// ==========================
	if (variable_global_exists("pontos_fases"))
	{
	    if (ds_exists(global.pontos_fases, ds_type_map))
	    {
	        ds_map_destroy(global.pontos_fases);
	    }
	}

	global.pontos_fases = ds_map_create();

	if (variable_struct_exists(dados, "pontos_fases"))
	{
	    var chaves = variable_struct_get_names(dados.pontos_fases);

	    for (var i = 0; i < array_length(chaves); i++)
	    {
	        var chave = chaves[i];

	        ds_map_set(
	            global.pontos_fases,
	            chave,
	            variable_struct_get(dados.pontos_fases, chave)
	        );
	    }
	}

    show_debug_message("Jogo carregado com sucesso!");
}
/// scr_validar_desafio(_desafio, _codigo)

function scr_validar_desafio(_desafio, _codigo)
{
    var codigo = scr_normalizar_codigo(_codigo);

    switch (_desafio)
    {
        //--------------------------------------------------
        // DESAFIO 2 - Fibonacci
        //--------------------------------------------------
        case 2:

            // Deve existir um laço de repetição
			var tem_for = string_pos("for", codigo) > 0;

			// Deve repetir 10 vezes
			var tem_range = string_pos("range(10)", codigo) > 0;

			// Deve imprimir algum valor
			var tem_print = string_pos("print(", codigo) > 0;

			// Deve possuir pelo menos uma soma
			var tem_soma = string_pos("+", codigo) > 0;

			// Deve possuir várias atribuições
			var qtd_igual = 0;
			for (var pos = 1; pos <= string_length(codigo); pos++)
			{
				if (string_char_at(codigo, pos) == "=")
				{
					var ant = "";
					var prox = "";

					if (pos > 1)
						ant = string_char_at(codigo, pos - 1);

					if (pos < string_length(codigo))
						prox = string_char_at(codigo, pos + 1);

					if (ant != ">" &&
						ant != "<" &&
						ant != "!" &&
						prox != "=")
					{
						qtd_igual++;
					}
				}
			}

			// O algoritmo precisa de pelo menos 4 atribuições:
			// duas inicializações + duas atualizações
			var tem_atribuicoes = qtd_igual >= 4;

			return (
				tem_for &&
				tem_range &&
				tem_print &&
				tem_soma &&
				tem_atribuicoes
			);

        //--------------------------------------------------
        // DESAFIO 3
        //--------------------------------------------------
        case 3:
			var tem_lista =
				string_pos("[3,7,2,9,4]", codigo) > 0 ||
				string_pos("[3,7,2,9,4,]", codigo) > 0;

			var tem_for = string_pos("for", codigo) > 0;
			var tem_in = string_pos("in", codigo) > 0;
			var tem_if = string_pos("if", codigo) > 0;
			var tem_print = string_pos("print(", codigo) > 0;

			// Deve existir alguma comparação usando >
			var tem_comparacao = string_pos(">", codigo) > 0;

			// Deve existir mais de uma atribuição
			var qtd_igual = 0;

			for (var pos = 1; pos <= string_length(codigo); pos++)
			{
				if (string_char_at(codigo, pos) == "=")
				{
					var ant = "";
					var prox = "";

					if (pos > 1)
						ant = string_char_at(codigo, pos - 1);

					if (pos < string_length(codigo))
						prox = string_char_at(codigo, pos + 1);

					if (ant != ">" &&
						ant != "<" &&
						ant != "!" &&
						prox != "=")
					{
						qtd_igual++;
					}
				}
			}

			var tem_atribuicoes = qtd_igual >= 2;

			return (
				tem_lista &&
				tem_for &&
				tem_in &&
				tem_if &&
				tem_print &&
				tem_comparacao &&
				tem_atribuicoes
			);

        //--------------------------------------------------
		// DESAFIO 4 - Soma dos Pares
		//--------------------------------------------------
		case 4:

			// Deve existir um laço de repetição
			var tem_for = string_pos("for", codigo) > 0;

			// Deve utilizar range
			var tem_range = string_pos("range(", codigo) > 0;

			// Deve possuir um if
			var tem_if = string_pos("if", codigo) > 0;

			// Deve verificar se o número é par (%)
			var tem_modulo = string_pos("%", codigo) > 0;

			// Deve realizar uma soma
			var tem_soma = string_pos("+", codigo) > 0;

			// Deve imprimir o resultado
			var tem_print = string_pos("print(", codigo) > 0;

			// Deve possuir pelo menos duas atribuições
			var qtd_igual = 0;

			for (var pos = 1; pos <= string_length(codigo); pos++)
			{
				if (string_char_at(codigo, pos) == "=")
				{
					var ant = "";
					var prox = "";

					if (pos > 1)
						ant = string_char_at(codigo, pos - 1);

					if (pos < string_length(codigo))
						prox = string_char_at(codigo, pos + 1);

					if (ant != ">" &&
						ant != "<" &&
						ant != "!" &&
						prox != "=")
					{
						qtd_igual++;
					}
				}
			}

			var tem_atribuicoes = qtd_igual >= 2;

			return (
				tem_for &&
				tem_range &&
				tem_if &&
				tem_modulo &&
				tem_soma &&
				tem_print &&
				tem_atribuicoes
			);

        //--------------------------------------------------
		// DESAFIO 7 - Vogais e Consoantes
		//--------------------------------------------------
		case 7:

			// Deve utilizar a palavra "python"
			var tem_palavra = string_pos("\"python\"", codigo) > 0 ||
							string_pos("'python'", codigo) > 0;

			// Deve possuir um laço for
			var tem_for = string_pos("for", codigo) > 0;

			// Deve possuir um if
			var tem_if = string_pos("if", codigo) > 0;

			// Deve verificar vogais
			var tem_vogais =
				string_pos("\"aeiou\"", codigo) > 0 ||
				string_pos("'aeiou'", codigo) > 0;

			// Deve incrementar contadores
			var tem_incremento =
				string_pos("+=", codigo) > 0 ||
				string_pos("=+1", codigo) > 0 ||
				string_pos("+1", codigo) > 0;

			// Deve imprimir os resultados
			var tem_print = string_pos("print(", codigo) > 0;

			// Deve possuir pelo menos três atribuições:
			// palavra + contador de vogais + contador de consoantes
			var qtd_igual = 0;

			for (var pos = 1; pos <= string_length(codigo); pos++)
			{
				if (string_char_at(codigo, pos) == "=")
				{
					var ant = "";
					var prox = "";

					if (pos > 1)
						ant = string_char_at(codigo, pos - 1);

					if (pos < string_length(codigo))
						prox = string_char_at(codigo, pos + 1);

					if (ant != ">" &&
						ant != "<" &&
						ant != "!" &&
						prox != "=")
					{
						qtd_igual++;
					}
				}
			}

			var tem_atribuicoes = qtd_igual >= 3;

			return (
				tem_palavra &&
				tem_for &&
				tem_if &&
				tem_vogais &&
				tem_incremento &&
				tem_print &&
				tem_atribuicoes
			);

        //--------------------------------------------------
		// DESAFIO 8 - Tabuada
		//--------------------------------------------------
		case 8:

			// Deve possuir um laço for
			var tem_for = string_pos("for", codigo) > 0;

			// Deve utilizar range
			var tem_range = string_pos("range(", codigo) > 0;

			// Deve utilizar o número 7
			var tem_sete = string_pos("7", codigo) > 0;

			// Deve realizar uma multiplicação
			var tem_multiplicacao = string_pos("*", codigo) > 0;

			// Deve imprimir o resultado
			var tem_print = string_pos("print(", codigo) > 0;

			return (
				tem_for &&
				tem_range &&
				tem_sete &&
				tem_multiplicacao &&
				tem_print
			);
    }

    return false;
}
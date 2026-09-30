// Verificar o estado atual de cada tecla
image_speed = 0;
var _a     = keyboard_check(ord("A"));
var _d     = keyboard_check(ord("D"));
var _space = keyboard_check(vk_space);

// Atualizar o frame exato do sprite com base nas combinações
if (!_a && !_d && !_space)
{
    image_index = 0; // Nenhum pressionado
}
else if (_a && !_d && !_space)
{
    image_index = 1; // A
}
else if (!_a && _d && !_space)
{
    image_index = 2; // D
}
else if (!_a && !_d && _space)
{
    image_index = 3; // SPACE
}
else if (_a && _d && !_space)
{
    image_index = 4; // A + D
}
else if (_a && !_d && _space)
{
    image_index = 5; // A + SPACE
}
else if (!_a && _d && _space)
{
    image_index = 6; // D + SPACE
}
else if (_a && _d && _space)
{
    image_index = 7; // A + D + SPACE
}
// Etapa 0: Jogador pressiona A, D ou as setas para andar
if (etapa_tutorial == 0) 
{
    if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)) 
    {
        etapa_tutorial = 1; // Avança para a etapa do pulo
    }
}

// Etapa 1: Jogador pressiona ESPAÇO para pular
if (etapa_tutorial == 1) 
{
    if (keyboard_check_pressed(vk_space)) 
    {
        etapa_tutorial = 2; // Conclui o tutorial (as mensagens somem)
    }
}
// Se ainda não revelou todas as letras da frase
// --- EFEITO MÁQUINA DE ESCREVER ---
if (posicao_letra < string_length(texto_completo)) 
{
    alarme_texto--;
    
    if (alarme_texto <= 0) 
    {
        posicao_letra++;
        texto_atual = string_copy(texto_completo, 1, posicao_letra); 
        alarme_texto = velocidade_texto;
    }
}

// --- LÓGICA DAS ETAPAS DO TUTORIAL ---

// Etapa 0: Pressionou A/D para andar (após terminar de digitar)
if (etapa_tutorial == 0) 
{
    // Confere se o texto atual já terminou de ser escrito
    if (posicao_letra >= string_length(texto_completo)) 
    {
        if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)) 
        {
            etapa_tutorial = 1;
            texto_completo = "Muito bem, agora aperte space";
            texto_atual = "";
            posicao_letra = 0;
        }
    }
}

// Etapa 1: Pressionou ESPAÇO para pular (após terminar de digitar)
if (etapa_tutorial == 1) 
{
    // Confere se o texto atual já terminou de ser escrito
    if (posicao_letra >= string_length(texto_completo)) 
    {
        if (keyboard_check_pressed(vk_space)) 
        {
            etapa_tutorial = 2; // Tutorial concluído
            texto_completo = "";
            texto_atual = "";
            posicao_letra = 0;
        }
    }
}
var _ja_pode_avancar = (posicao_letra >= string_length(texto_completo)) && (tempo_espera >= 30);

// Etapa 0
if (etapa_tutorial == 0 && _ja_pode_avancar) 
{
    if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)) 
    {
        etapa_tutorial = 1;
        texto_completo = "Muito bem, agora aperte space";
        texto_atual = "";
        posicao_letra = 0;
        tempo_espera = 0; // Reseta a espera para a próxima frase
    }
}

// Etapa 1
if (etapa_tutorial == 1 && _ja_pode_avancar) 
{
    if (keyboard_check_pressed(vk_space)) 
    {
        etapa_tutorial = 2;
        texto_completo = "";
        texto_atual = "";
        posicao_letra = 0;
        tempo_espera = 0;
    }
}
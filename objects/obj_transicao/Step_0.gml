// --- FADE OUT (Ficando Preto) ---
if (estado_fade == 1) 
{
    alpha += velocidade_fade;
    
    if (alpha >= 1) 
    {
        alpha = 1;
        estado_fade = -1; // Muda para iniciar o Fade In na nova sala
        
        // Executa a troca de sala apenas se for uma sala válida
        if (sala_destino != -1 && room_exists(sala_destino)) 
        {
            var _alvo = sala_destino;
            sala_destino = -1; // Limpa para não repetir a chamada
            room_goto(_alvo);
        }
    }
}

// --- FADE IN (Ficando Transparente) ---
if (estado_fade == -1) 
{
    alpha -= velocidade_fade;
    
    if (alpha <= 0) 
    {
        alpha = 0;
        estado_fade = 0; // Finaliza a transição
    }
}
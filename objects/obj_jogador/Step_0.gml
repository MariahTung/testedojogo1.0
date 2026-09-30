var velocidade = 5;
depth = 1;

// --- 1. VERIFICAÇÃO DO CHÃO E PULO ---
var key_jump = keyboard_check_pressed(vk_space);
var grounded = place_meeting(x, y + 1, obj_chao);

// --- 2. MOVIMENTAÇÃO HORIZONTAL ---
if (keyboard_check(ord("A"))) {
    direcao = -1; // -1 representa Esquerda
    
    if (!place_meeting(x - velocidade, y, colisao)) {
        x -= velocidade;
    }
}
else if (keyboard_check(ord("D"))) {
    direcao = 1; // 1 representa Direita

    if (!place_meeting(x + velocidade, y, colisao)) {
        x += velocidade;
    }
}

// --- 3. FÍSICA E GRAVIDADE ---
if (key_jump) {
    show_debug_message("Teclou ESPAÇO!");
    if (grounded) {
        show_debug_message("Esta no chao! Pulou!");
        vspd = jumpspeed;
    } else {
        show_debug_message("NAO esta no chao!");
    }
}

if (!grounded) {
    vspd += grv;
}

// Colisão Vertical
if (place_meeting(x, y + vspd, obj_chao)) {
    while (!place_meeting(x, y + sign(vspd), obj_chao)) {
        y += sign(vspd);
    }
    vspd = 0;
}

y += vspd;

// Portal
if (place_meeting(x, y, portal)) {
    room_goto_next();
}

// --- 4. CONTROLE DE SPRITES ---
if (!grounded) {
    // No Ar (Pulando/Caindo)
    if (direcao == -1) {
        sprite_index = jumpingD; // Esquerda
    } else {
        sprite_index = jumpingA; // Direita
    }
    
    image_speed = 0.2;
    
    if (image_index >= image_number - 1) {
        image_speed = 0;
    }
} 
else {
    // No Chão
    image_speed = 1; 
    
    if (keyboard_check(ord("A"))) {
        sprite_index = spr_andando_jogadorE;
    } 
    else if (keyboard_check(ord("D"))) {
        sprite_index = spr_andando_jogadorD;
    } 
    else {
        // Parado
        if (direcao == -1) {
            sprite_index = spr_parado_jogadorE; // Esquerda
        } else {
            sprite_index = spr_parado_jogadorD; // Direita
        }
    }
}
// --- COLISÃO COM O PORTAL ---
if (place_meeting(x, y, portal)) {
    // Garante que o obj_transicao existe
    if (!instance_exists(obj_transicao)) {
        instance_create_depth(0, 0, 0, obj_transicao);
    }

    // Só ativa se NENHUMA transição estiver rodando no momento
    with (obj_transicao) {
        if (estado_fade == 0) {
            estado_fade = 1; // Inicia o Fade Out
            
            // Verifica se existe uma próxima sala antes de ir
            var _proxima_sala = room_next(room);
            if (room_exists(cidade)) {
                sala_destino = cidade;
            } else {
                // Se não houver próxima sala, recarrega a atual ou vai para o menu
                sala_destino = room; 
            }
        }
    }
}
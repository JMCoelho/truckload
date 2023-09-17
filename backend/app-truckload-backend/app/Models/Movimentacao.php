<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Movimentacao extends Model
{
    use HasFactory;

    protected $table = 'movimentacao';

    protected $fillable = [
        "entrada",
        "entrada_fabrica",
        "entrada_carregamento",
        "saida_carregamento",
        "saida_fabrica",
        "saida",
        "agendamento_id",
        "caminhao_id",
        "user_id"
    ];
}

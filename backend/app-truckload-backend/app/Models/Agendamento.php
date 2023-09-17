<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Agendamento extends Model
{
    use HasFactory;

    protected $table = 'agendamento';

    protected $fillable = [
        "carreta",
        "nota_fiscal",
        "data_agendada",
        "caminhao_id",
        "user_id",
        "status"
    ];
}

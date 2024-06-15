<?php

// app/Models/Resultado.php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Resultado extends Model
{
    use HasFactory;

    protected $table = 'resultados';
    public $timestamps = false;

//     // Relación con partidos
//      public function partido(): BelongsTo
//    {
//         return $this->belongsTo(Partido::class);
//     }
}

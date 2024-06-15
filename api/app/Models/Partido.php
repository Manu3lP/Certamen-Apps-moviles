<?php

// app/Models/Partido.php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Partido extends Model
{
    use HasFactory;

    protected $table = 'partidos';
    public $timestamps = false;

    // Relación con equipos ganador
    // public function equipoGanador(): BelongsTo
    // {
        
    //     return $this->belongsTo(Equipo::class, 'equipo_ganador');
    // }

    // // Relación con equipos perdedor
    // public function equipoPerdedor(): BelongsTo
    // {
    //     return $this->belongsTo(Equipo::class, 'equipo_perdedor');
    // }

    // Relación con resultados
    public function resultado(): BelongsTo
    {
        return $this->belongsTo(Resultado::class);
    }
}


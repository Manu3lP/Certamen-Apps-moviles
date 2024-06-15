<?php

// app/Models/Campeonato.php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Campeonato extends Model
{
    use HasFactory;

    protected $table = 'campeonatos';
    public $timestamps = false;

    // Relación con equipos
    public function equipos(): HasMany
    {
        return $this->hasMany(Equipo::class);
    }

    // Relación con partidos
    public function partidos(): HasMany
    {
        return $this->hasMany(Partido::class);
    }
}

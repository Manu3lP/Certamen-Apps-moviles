<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Equipo extends Model
{
    use HasFactory;

    protected $table = 'equipos';
    public $timestamps = false;

    protected $appends = ['cantidad'];

    //relacion con equipos
    public function jugadores():HasMany
    {
        //return $this->hasMany(Jugador::class);
    }

    //asignar valor a cantidad
    public function getCantidadAttribute(){
       // return count($this->jugadores());
    }
}

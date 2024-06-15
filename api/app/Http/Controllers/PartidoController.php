<?php

// app/Http/Controllers/PartidoController.php
namespace App\Http\Controllers;

use App\Models\Partido;
use Illuminate\Http\Request;
use App\Http\Requests\PartidoRequest;

class PartidoController extends Controller
{
    public function index()
    {
        return Partido::all();
    }

    public function store(PartidoRequest $request)
    {
        $partido = new Partido();
        $partido->campeonato = $request->campeonato;
        $partido->equipo_a = $request->equipo_a;
        $partido->equipo_b = $request->equipo_b;
        $partido->fecha_hora = $request->fecha_hora;
        $partido->lugar = $request->lugar;
        $partido->save();
        return $partido;
    }

    public function show(Partido $partido)
    {
    }

    public function update(PartidoRequest $request, Partido $partido)
    {
        $partido->campeonato = $request->campeonato;
        $partido->equipo_a = $request->equipo_a;
        $partido->equipo_b = $request->equipo_b;
        $partido->fecha_hora = $request->fecha_hora;
        $partido->lugar = $request->lugar;
        $partido->save();
        // Mensaje de éxito
        return 'El partido se ha actualizado correctamente.';
    }

    public function destroy(Partido $partido)
    {
        return $partido->delete();
    }
}

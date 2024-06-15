<?php

// app/Http/Controllers/CampeonatoController.php
namespace App\Http\Controllers;

use App\Models\Campeonato;
use Illuminate\Http\Request;
use App\Http\Requests\CampeonatoRequest;


class CampeonatoController extends Controller
{
    public function index()
    {
        return Campeonato::all();
    }

    public function store(CampeonatoRequest $request)
    {
        $campeonato = new Campeonato();
        $campeonato->nombre = $request->nombre;
        $campeonato->detalles = $request->detalles ?? 'detalles por defecto';
        $campeonato->fecha_inicio = $request->fecha_inicio;
        $campeonato->fecha_fin = $request->fecha_fin;
        $campeonato->reglas = $request->reglas;
        $campeonato->premios = $request->premios;
        $campeonato->save();
        
        return $campeonato;
    }

    public function show(Campeonato $campeonato)
    {
        return $campeonato;
    }

    public function update(CampeonatoRequest $request, Campeonato $campeonato)
    {
        $campeonato->update([
            'nombre' => $request->nombre,
            'detalles' => $request->detalles ?? 'detalles por defecto',
            'fecha_inicio' => $request->fecha_inicio,
            'fecha_fin' => $request->fecha_fin,
            'reglas' => $request->reglas,
            'premios' => $request->premios,
        ]);
        
        return $campeonato;
    }

    public function destroy(Campeonato $campeonato)
    {
        $campeonato->delete();
        
        return response()->noContent();
    }
}


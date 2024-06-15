<?php

// app/Http/Controllers/ResultadoController.php
namespace App\Http\Controllers;

use App\Models\Resultado;
use Illuminate\Http\Request;
use App\Http\Requests\ResultadoRequest;


class ResultadoController extends Controller
{
    public function index()
    {
        return Resultado::all();
    }

    public function store(ResultadoRequest $request)
    {
        $resultado = new Resultado();
        $resultado->partido_id = $request->partido_id;
        $resultado->equipo_ganador = $request->equipo_ganador;
        $resultado->equipo_perdedor = $request->equipo_perdedor;
        $resultado->puntos_ganador = $request->puntos_ganador;
        $resultado->puntos_perdedor = $request->puntos_perdedor;
        $resultado->save();
        return $resultado;
    }

    public function show(Resultado $resultado)
    {
        return $resultado;
    }

    public function update(ResultadoRequest $request, Resultado $resultado)
    {
        $resultado->partido_id = $request->partido_id;
        $resultado->equipo_ganador = $request->equipo_ganador;
        $resultado->equipo_perdedor = $request->equipo_perdedor;
        $resultado->puntos_ganador = $request->puntos_ganador;
        $resultado->puntos_perdedor = $request->puntos_perdedor;
        $resultado->save();

        // Mensaje de éxito sin formato JSON
        return 'El resultado se ha actualizado correctamente.';
    }


    public function destroy(Resultado $resultado)
    {
        return $resultado->delete();
    }
}

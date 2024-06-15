<?php

namespace App\Http\Controllers;

use App\Models\Equipo;
use Illuminate\Http\Request;
use App\Http\Requests\EquipoRequest;

class EquiposController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    
    public function index()
    {
        $equipos = Equipo::all();
        return $equipos;
        //return Equipo::all();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(EquipoRequest $request)
    {
        $equipo = new Equipo();
        $equipo->nombre = $request->nombre;
        $equipo->perfil= $request->perfil;
        $equipo->save();
        return $equipo;
    }

    /**
     * Display the specified resource.
     */
    public function show(Equipo $equipo)
    {
        return $equipo->makeHidden('jugadores');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(EquipoRequest $request, Equipo $equipo)
    {
        $equipo->nombre = $request->nombre;
        $equipo->perfil = $request->perfil;
        $equipo->save();

        // Mensaje de éxito
        return 'El equipo se ha actualizado correctamente.';
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Equipo $equipo)
    {
        $equipo->delete();
        
        return response()->noContent();
    }
}

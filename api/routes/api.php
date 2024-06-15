<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{CampeonatoController,EquiposController,JugadorController
,PartidoController,ResultadoController};

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
Route::apiResource('/campeonatos', CampeonatoController::class);
Route::apiResource('/equipos', EquiposController::class);
Route::apiResource('/jugadores', JugadorController::class);
Route::apiResource('/partidos', PartidoController::class);
Route::apiResource('/resultados', ResultadoController::class);

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/



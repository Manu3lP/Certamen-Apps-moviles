<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CampeonatosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('campeonatos')->insert([
            ['nombre' => 'Campeonato N°1 de LOL',
            'detalles' => 'Juego:LOL Equipos participantes:2',
            'fecha_inicio' => '2024-01-01',
            'fecha_fin' => '2024-01-31',
            'reglas' => 'Reglas del Campeonato: min: 5 jugadores',
            'premios' => 'Premios del Campeonato: $1000 dolares'],
            ['nombre' => 'Campeonato N°1 de Valorant',
            'detalles' => 'Juego:Valorant Equipos participantes:2',
            'fecha_inicio' => '2024-02-01',
            'fecha_fin' => '2024-02-28',
            'reglas' => 'Reglas del Campeonato: min: 5 jugadores',
            'premios' => 'Premios del Campeonato: $1000 dolares'],
        ]);
    }
}

<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PartidosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('partidos')->insert([
            [   'campeonato' => 'Campeonato N°1 de LOL', 
                'equipo_a' => 'Pixel DT',    // Asume que hay un equipo con id 1
                'equipo_b' => 'Power Rangers',    // Asume que hay un equipo con id 2
                'fecha_hora' => '2024-01-15 10:00:00', 
                'lugar' => 'Estadio 1'
            ],
            [
                'campeonato' => 'Campeonato N°1 de Valorant', 
                'equipo_a' => 'Apps',    // Asume que hay un equipo con id 3
                'equipo_b' => 'Salsa',    // Asume que hay un equipo con id 4
                'fecha_hora' => '2024-02-15 15:00:00', 
                'lugar' => 'Estadio 2'
            ]
        ]);
    }
}

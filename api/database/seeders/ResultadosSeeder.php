<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ResultadosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('resultados')->insert([
            ['partido_id' => '1','equipo_ganador' => 1,'equipo_perdedor' => 2,'puntos_ganador' => 3,'puntos_perdedor' => 1],
            ['partido_id' => '2', 'equipo_ganador' => 3, 'equipo_perdedor' => 1, 'puntos_ganador' => 2, 'puntos_perdedor' => 1],
        ]);
    }
}

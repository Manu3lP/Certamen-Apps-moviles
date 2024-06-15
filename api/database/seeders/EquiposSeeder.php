<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class EquiposSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('equipos')->insert([
            ['nombre'=>'Power Rangers', 'perfil' => 'Juego:LOL'],
            ['nombre'=>'Pixel DT', 'perfil' => 'Juego:LOL'],
            ['nombre'=>'Salsa', 'perfil' => 'Juego:VALORANT'],
            ['nombre'=>'Apps', 'perfil' => 'Juego:VALORANT'],

        ]);
    }
}

<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class JugadoresSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('jugadores')->insert([
            ['nombre'=>'Charles','apellido'=>'Leclerc','pais'=>'Monaco','juego'=>'LOL','equipo_id'=>1],
            ['nombre'=>'Carlos','apellido'=>'Sainz','pais'=>'España','juego'=>'LOL','equipo_id'=>1],
            ['nombre'=>'Lando','apellido'=>'Norris','pais'=>'Inglaterra','juego'=>'LOL','equipo_id'=>1],
            ['nombre'=>'Oscar','apellido'=>'Piastri','pais'=>'Australia','juego'=>'LOL','equipo_id'=>1],
            ['nombre'=>'Max','apellido'=>'Verstappen','pais'=>'Paises Bajos','juego'=>'LOL','equipo_id'=>1],
            ['nombre'=>'Sergio','apellido'=>'Perez','pais'=>'México','juego'=>'LOL','equipo_id'=>2],
            ['nombre'=>'George','apellido'=>'Russell','pais'=>'Inglaterra','juego'=>'LOL','equipo_id'=>2],
            ['nombre'=>'Lewis','apellido'=>'Hamilton','pais'=>'Inglaterra','juego'=>'LOL','equipo_id'=>2],
            ['nombre'=>'Fernando','apellido'=>'Alonso','pais'=>'España','juego'=>'LOL','equipo_id'=>2],
            ['nombre'=>'Lance','apellido'=>'Stroll','pais'=>'Canada','juego'=>'LOL','equipo_id'=>2],  
            ['nombre'=>'Nico','apellido'=>'Hulkenberg','pais'=>'Alemania','juego'=>'VALORANT','equipo_id'=>3],
            ['nombre'=>'Kevin','apellido'=>'Magnussen','pais'=>'Dinamarca','juego'=>'VALORANT','equipo_id'=>3],
            ['nombre'=>'Alexander','apellido'=>'Albon','pais'=>'Tailandia','juego'=>'VALORANT','equipo_id'=>3],
            ['nombre'=>'Logan','apellido'=>'Sargeant','pais'=>'USA','juego'=>'VALORANT','equipo_id'=>3],
            ['nombre'=>'Zhou','apellido'=>'Guanyu','pais'=>'China','juego'=>'VALORANT','equipo_id'=>3],
            ['nombre'=>'Valtteri','apellido'=>'Bottas','pais'=>'Finlandia','juego'=>'VALORANT','equipo_id'=>4],
            ['nombre'=>'Daniel','apellido'=>'Ricciardo','pais'=>'Australia','juego'=>'VALORANT','equipo_id'=>4],
            ['nombre'=>'Yuki','apellido'=>'Tsunoda','pais'=>'Japón','juego'=>'VALORANT','equipo_id'=>4],
            ['nombre'=>'Esteban','apellido'=>'Ocon','pais'=>'Francia','juego'=>'VALORANT','equipo_id'=>4],
            ['nombre'=>'Pierre','apellido'=>'Gasly','pais'=>'Francia','juego'=>'VALORANT','equipo_id'=>4],
        ]);
    }
}

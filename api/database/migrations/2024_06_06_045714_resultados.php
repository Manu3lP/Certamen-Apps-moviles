<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('resultados', function (Blueprint $table) {
            $table->id();
            $table->string('partido_id');
            //$table->foreign('partido_id')->references('id')->on('partidos')->onDelete('cascade');
            $table->integer('equipo_ganador');
            //$table->foreign('equipo_ganador')->references('id')->on('equipos');
            $table->integer('equipo_perdedor');
            //$table->foreign('equipo_perdedor')->references('id')->on('equipos');
            $table->integer('puntos_ganador');
            $table->integer('puntos_perdedor');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('resultados');
    }
};

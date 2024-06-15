<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ResultadoRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules()
    {
        return [
            'partido_id' => 'required','exists:partidos,id',
            'equipo_ganador' => 'required','different:equipo_perdedor',
            'equipo_perdedor' => 'required','different:equipo_ganador',
            'puntos_ganador' => 'required','integer,min:0',
            'puntos_perdedor' => 'required','integer,min:0',
        ];
    }

    public function messages()
    {
        return [
            'partido_id.required' => 'El ID del partido es requerido.',
            'partido_id.exists' => 'El partido seleccionado no existe en la base de datos.',
            
            'equipo_ganador.required' => 'El equipo ganador es requerido.',
            'equipo_ganador.different' => 'El equipo ganador y perdedor deben ser diferentes.',
           
            
            'equipo_perdedor.required' => 'El equipo perdedor es requerido.',
            'equipo_perdedor.different' => 'El equipo perdedor y ganador deben ser diferentes.',
        
            
            'puntos_ganador.required' => 'Los puntos del equipo ganador son requeridos.',
            'puntos_ganador.integer' => 'Los puntos del equipo ganador deben ser un número entero.',
            'puntos_ganador.min' => 'Los puntos del equipo ganador deben ser como mínimo 0.',
            
            'puntos_perdedor.required' => 'Los puntos del equipo perdedor son requeridos.',
            'puntos_perdedor.integer' => 'Los puntos del equipo perdedor deben ser un número entero.',
            'puntos_perdedor.min' => 'Los puntos del equipo perdedor deben ser como mínimo 0.',
        ];

    }
}

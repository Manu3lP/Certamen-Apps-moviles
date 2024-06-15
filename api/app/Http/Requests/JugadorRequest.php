<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class JugadorRequest extends FormRequest
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
    public function rules(): array
    {
        
        return [
            'nombre' => ['required','min:5','max:15'],
            'apellido' => ['required','min:2','max:15'],
            'pais' => ['required'],
            'equipo' => ['required','integer'],
        ];
    }

    public function messages() :array
    {
        return [
            'nombre.required' => 'Indique el nombre del piloto',
            'nombre.min' => 'El nombre debe tener como mínimo 5 letras',
            'nombre.max' => 'El nombre debe tener como máximo 15 letras',
            'apellido.required' => 'Indique el apellido del piloto',
            'apellido.min' => 'El apellido debe tener como mínimo 2 letras',
            'apellido.max' => 'El apellido debe tener como máximo 15 letras',
            'numero.required' => 'Indique el número del auto',
            'numero.gte' => 'El número debe ser mayor o igual a 1',
            'numero.lte' => 'El número debe ser menor o igual a 99',
            'pais.required' => 'Indique el país del piloto',
            'equipo.required' => 'Indique el equipo',
            'equipo.integer' => 'Equipo no válido',
            
        ];
    }
}

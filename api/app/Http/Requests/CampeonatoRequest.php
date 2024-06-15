<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CampeonatoRequest extends FormRequest
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
            'nombre' => 'required','string','min:5','max:30',
            'detalles' => 'required','string','min:20','max:255',
            'fecha_inicio' => 'required','date_format:Y-m-d',
            'fecha_fin' => 'required','date_format:Y-m-d','after_or_equal:fecha_inicio',
            'reglas' => 'required','string','min:15','max:255',
            'premios' => 'required','string','min:15','max:255',
        ];
    }

    public function messages(): array
    {
        return [
            'nombre.required' => 'Indique el nombre del Campeonato',
            'nombre.min' => 'El nombre debe tener como mínimo 5 letras',
            'nombre.max' => 'El nombre debe tener como máximo 15 letras',
    
            'detalles.required' => 'Los detalles son requeridos',
            'detalles.min' => 'Los detalles deben tener como mínimo 20 letras',
            'detalles.max' => 'Los detalles deben tener como máximo 255 letras',
    
            'fecha_inicio.required' => 'La fecha de inicio es requerida',
            'fecha_inicio.date_format' => 'La fecha debe tener formato Y-m-d',
    
            'fecha_fin.required' => 'La fecha de fin es requerida',
            'fecha_fin.date_format' => 'La fecha debe tener formato Y-m-d',
            'fecha_fin.after_or_equal' => 'La fecha de fin debe ser posterior o igual a la fecha de inicio',
    
            'reglas.required' => 'Las reglas son requeridas',
            'reglas.min' => 'Las reglas deben tener como mínimo 15 letras',
            'reglas.max' => 'Las reglas deben tener como máximo 255 letras',
    
            'premios.required' => 'Los premios son requeridos',
            'premios.min' => 'Los premios deben tener como mínimo 15 letras',
            'premios.max' => 'Los premios deben tener como máximo 255 letras',
        ];
    }
    
}

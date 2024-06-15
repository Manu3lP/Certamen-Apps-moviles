<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PartidoRequest extends FormRequest
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
            'fecha_hora' => ['required','min:1','max:20'],
            'lugar' => ['required','min:5','max:20'],
            //'equipo_a' => ['integer','exists:equipos,id'],
            //'equipo_b' => ['integer','exists:equipos,id'],
         ];
    }
   

    public function messages() :array
    {
         return [
            'fecha_hora.required' => 'Indique la fecha y hora del partido',
            'fecha_hora.min' => 'la fecha debe tener como mínimo 15 letras',
            'fecha_hora.max' => 'El nombre debe tener como máximo 15 letras',
            'lugar.required' => 'Indique el lugar donde se llevara a cabo',
            'lugar.min' => 'El lugar debe tener como mínimo 5 letras',
            'lugar.max' => 'El lugar debe tener como máximo 20 letras',
            'equipo_a.required' => 'Indique el equipo',
            'equipo_a.integer' => 'Equipo no válido',
            'equipo_b.required' => 'Indique el equipo',
            'equipo_b.integer' => 'Equipo no válido',
         ];
    }
}

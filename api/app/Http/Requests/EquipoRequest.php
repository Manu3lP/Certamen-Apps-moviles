<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EquipoRequest extends FormRequest
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
            'nombre' => 'required','string','min:5','max:20',
            'perfil' => 'required','string','min:20','max:50',
        ];
    }

    public function messages()
    {
        return [
                'nombre.required' => 'El nombre del equipo es requerido.',
                'nombre.min' => 'El nombre del equipo debe tener como mínimo 5 caracteres.',
                'nombre.max' => 'El nombre del equipo no debe exceder los 20 caracteres.',
                
                'perfil.required' => 'El perfil del equipo es requerido.',
                'perfil.min' => 'El perfil del equipo debe tener como mínimo 20 caracteres.',
                'perfil.max' => 'El perfil del equipo no debe exceder los 50 caracteres.',
        ];
    }
}

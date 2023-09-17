<?php

namespace App\Http\Controllers\Api;

use App\Models\Movimentacao;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class MovimentacaoController extends Controller
{
    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->all();
        $data["status"] = 0;
        $movimentacao = Movimentacao::create($data);
        return json_encode($movimentacao);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $data = $request->all();
        unset($data["id"]);
        $id = $request->only(['id']);

        $movimentacao = Movimentacao::where($id)->update($data);
        return json_encode($movimentacao);
    }
}

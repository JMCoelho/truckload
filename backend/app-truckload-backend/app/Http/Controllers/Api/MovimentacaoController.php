<?php

namespace App\Http\Controllers\Api;

use App\Models\Movimentacao;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Throwable;



class MovimentacaoController extends Controller
{
    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->all();
        $data["status"] = 0;

        try{
            $movimentacao = Movimentacao::create($data);
            $mensagem = [
				"sucesso"=> true,
                "movimentacao" => $movimentacao,
			];
		}
		catch(Throwable $e)
		{
			Log::error($e);
			$mensagem = [
				"sucesso"=> false,
				"mensagem"=> "Falha ao registrar entrada"
			];
		}
        return response()->json($mensagem);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $data = $request->all();
        unset($data["id"]);
        $id = $request->only(['id']);

        try{
            Movimentacao::where($id)->update($data);
            $mensagem = [
				"sucesso"=> true,
			];

		}
		catch(Throwable $e)
		{
			Log::error($e);
			$mensagem = [
				"sucesso"=> false,
				"mensagem"=> "Falha ao registrar tempo"
			];
		}
        return response()->json($mensagem);
    }
}

<?php

namespace App\Http\Controllers\Api;

use App\Models\Movimentacao;
use App\Models\Agendamento;
use App\Models\Caminhao;
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
            Agendamento::where("id", $data["id"])->update(["status"=> 1]);
            $caminhao = Caminhao::where("placa", $data["placa"])->first();
            $date = date('Y-m-d H:i:s');

            $movimentacao = array(
                "entrada"=> $date,
                "agendamento_id" => $data["id"],
                "caminhao_id" => $caminhao["id"],
                "user_id"=> $data["user_id"]
            );

            $movimentacao = Movimentacao::create($movimentacao);
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

    public function show(Request $request)
    {
        $data = $request->all();

        try{
            $movimentacao = Movimentacao::where("user_id", $data["user_id"])
                ->orderBy('id', 'desc')->first();
            
            return response()->json($movimentacao);
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
        $id = $request->only(['id']);  
        $movimentacao = Movimentacao::where("id", $id["id"])
            ->orderBy('id', 'desc')->first();
        unset($movimentacao["id"]);
        unset($movimentacao["updated_at"]);
        unset($movimentacao["created_at"]);

        $movimentacao = json_decode($movimentacao, true);

        $date = date('Y-m-d H:i:s');

        if(!isset($movimentacao["entrada_fabrica"]))
        {
            $movimentacao["entrada_fabrica"] = $date;
        }
        elseif(!isset($movimentacao["entrada_carregamento"]))
        {
            $movimentacao["entrada_carregamento"] = $date;
        }
        elseif(!isset($movimentacao["saida_carregamento"]))
        {
            $movimentacao["saida_carregamento"] = $date;
        }
        elseif(!isset($movimentacao["saida_fabrica"]))
        {
            $movimentacao["saida_fabrica"] = $date;
        }
        elseif(!isset($movimentacao["saida"]))
        {
            $movimentacao["saida"] = $date;
        }

        try{
            Movimentacao::where("id", $id["id"])->update($movimentacao);
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

<?php

namespace App\Http\Controllers\Api;

use App\Models\Agendamento;
use App\Models\Caminhao;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Throwable;


class AgendamentoController extends Controller
{
	/**
	 * Store a newly created resource in storage.
	 */
	public function store(Request $request)
	{
		$data = $request->all();
		$caminhao = Caminhao::where("user_id", $data["user_id"])
			->where("placa", $data["placa"])
			->orderBy('id', 'desc')->first();
		if(!isset($caminhao) || empty($caminhao))
		{
			$mensagem = [
				"sucesso"=> false,
				"mensagem"=> "caminhão nao pertence ao usuário"
			];
			return response()->json($mensagem);
		}

		$data["status"] = 0;
		$data["caminhao_id"] = $caminhao["id"];
		try{
			$agendamento = Agendamento::create($data);
			$mensagem = [
				"sucesso"=> true,
				"agendamento" => $agendamento,
			];
		}
		catch(Throwable $e)
		{
			Log::error($e);
			$mensagem = [
				"sucesso"=> false,
				"mensagem"=> "falha no agendamento"
			];
		}
		return response()->json($mensagem);
	}

	/**
	 * Display the specified resource.
	 */
	public function show(Request $request)
	{
		$data = $request->all();
		$agendamento =
		   Agendamento::where("user_id", $data["user_id"])->where("status", 0)
			->orderBy('id', 'desc')->first();
		return response()->json($agendamento);
	}

	public function hasAgendamentoAtivo(Request $request)
	{
		$data = $request->all();
		$agendamento =
		   Agendamento::where("user_id", $data["user_id"])->where("status", 0)
			->orderBy('id', 'desc')->first();
		return response()->json($agendamento);
	}

	/**
	 * Update the specified resource in storage.
	 */
	public function update(Request $request)
	{
		$all = $request->all();
		$data = $request->all(['carreta', "nota_fiscal"]);
		$id = $request->only(['id']);

		
		try{
			Agendamento::where($id)->update($data);
			$mensagem = [
				"sucesso"=> true,
				"mensagem"=> "Atualizado com sucesso"
			];
		}
		catch(Throwable $e)
		{
			Log::error($e);
			$mensagem = [
				"sucesso"=> false,
				"mensagem"=> "Falha ao atualizar agendamento"
			];
		}
        return response()->json($mensagem);
	}

	/**
	 * Remove the specified resource from storage.
	 */
	public function cancel(Request $request)
	{
		$id = $request->only(['id']);
		$data = ["status" => 2];

		try{
			Agendamento::where($id)->update($data);
			$mensagem = [
				"sucesso"=> true,
				"mensagem"=> "Cancelado com sucesso"
			];
		}
		catch(Throwable $e)
		{
			Log::error($e);
			$mensagem = [
				"sucesso"=> false,
				"mensagem"=> "Falha ao cancelar agendamento"
			];
		}
        return response()->json($mensagem);
	}
}

<?php

namespace App\Http\Controllers\Api;

use App\Models\Caminhao;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Throwable;

class CaminhaoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function list(Request $request)
    {
        $data = $request->all();
        $caminhoes =
           Caminhao::where("user_id", $data["user_id"])->get();
        return response()->json($caminhoes);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->all();
		Log::debug(json_encode($data));
        try{
			unset($data["id"]);
			Caminhao::create($data);
			$mensagem = [
				"sucesso"=> true,
			];
		}
		catch(Throwable $e)
		{
			Log::error($e);
			$mensagem = [
				"sucesso"=> false,
				"mensagem"=> "falha na adição de caminhão"
			];
		}
		return response()->json($mensagem);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $data = $request->all(['transportadora', "tipo"]);
        $id = $request->only(['id']);
        try{
            Caminhao::where($id)->update($data);
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
				"mensagem"=> "Falha ao atualizar caminhao"
			];
		}
        return response()->json($mensagem);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        $data = $request->all();

        try{
            Caminhao::destroy($data);
			$mensagem = [
				"sucesso"=> true,
				"mensagem"=> "Removido com sucesso"
			];
		}
		catch(Throwable $e)
		{
			Log::error($e);
			$mensagem = [
				"sucesso"=> false,
				"mensagem"=> "Falha ao remover caminhao"
			];
		}
        return response()->json($mensagem);
    }
}

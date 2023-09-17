<?php

namespace App\Http\Controllers\Api;

use App\Models\Caminhao;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

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
        return json_encode($caminhoes);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->all();
        $caminhao = Caminhao::create($data);
        return json_encode($caminhao);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $data = $request->all(['transportadora', "tipo"]);
        $id = $request->only(['id']);

        $caminhao = Caminhao::where($id)->update($data);
        return json_encode($caminhao);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        $data = $request->all();
        
        $caminhao = Caminhao::destroy($data);
        return json_encode($caminhao);
    }
}

<?php

namespace App\Http\Controllers\Api;

use App\Models\Agendamento;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AgendamentoController extends Controller
{
    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->all();
        $data["status"] = 0;
        $agendamento = Agendamento::create($data);
        return json_encode($agendamento);
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
        return json_encode($agendamento);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $data = $request->all(['carreta', "nota_fiscal"]);
        $id = $request->only(['id']);

        $agendamento = Agendamento::where($id)->update($data);
        return json_encode($agendamento);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function cancel(Request $request)
    {
        $id = $request->only(['id']);
        $data = ["status" => 2];

        $agendamento = Agendamento::where($id)->update($data);
        return json_encode($agendamento);
    }
}

<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\CaminhaoController;
use App\Http\Controllers\Api\AgendamentoController;
use App\Http\Controllers\Api\MovimentacaoController;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });


Route::post('auth/login', [AuthController::class, "login"]);
Route::post('auth/refresh', [AuthController::class, "refresh"]);

Route::group(["middleware" => ["jwt"]], function(){
	Route::post("caminhao/store", [CaminhaoController::class, "store"]);
	Route::post("caminhao/list", [CaminhaoController::class, "list"]);
	Route::post("caminhao/update", [CaminhaoController::class, "update"]);
	Route::post("caminhao/destroy", [CaminhaoController::class, "destroy"]);
	
	Route::post("agendamento/hasOperacaoAtiva", [AgendamentoController::class, "hasOperacaoAtiva"]);
	Route::post("agendamento/store", [AgendamentoController::class, "store"]);
	Route::post("agendamento/show", [AgendamentoController::class, "show"]);
	Route::post("agendamento/update", [AgendamentoController::class, "update"]);
	Route::post("agendamento/cancel", [AgendamentoController::class, "cancel"]);

	Route::post("movimentacao/show", [MovimentacaoController::class, "show"]);
	Route::post("movimentacao/store", [MovimentacaoController::class, "store"]);
	Route::post("movimentacao/update", [MovimentacaoController::class, "update"]);
	
	Route::post('auth/logout', [AuthController::class, "logout"]);

});
Route::post("user/store", [UserController::class, "store"]);
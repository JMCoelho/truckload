<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Log;




class AuthController extends Controller
{
	 /**
	 * Get a JWT via given credentials.
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function login(Request $request)
	{
		$credentials = $request->only(['login', 'password']);

		if (!$token = auth(guard: "api")->attempt($credentials))
		{
			return response()->json(['error' => 'Unauthorized'], 401);
		}

		$user = User::select("id")->where("login", $credentials["login"])->first();

		return response()->json(["token"=>$token, "user_id" => $user["id"]]);
	}

	/**
	 * Get the token array structure.	
	 *
	 * @param  string $token
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	protected function respondWithToken($token)
	{
		return $token;
	}

	 /**
	 * Log the user out (Invalidate the token).
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function logout()
	{
		auth()->logout();

		return response()->json(['message' => 'Successfully logged out']);
	}

	/**
	 * Refresh a token.
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function refresh()
	{
		return $this->respondWithToken(auth()->refresh());
	}
}

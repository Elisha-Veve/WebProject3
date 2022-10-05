<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(RegisterRequest $request)
    {
        $data = $request->validated();
        $data['password'] = Hash::make($data['password']);

        $user = User::create($data);
        $token = $user->createToken(User::AUTH_TOKEN)->plainTextToken;

        return $this->success([
            'user' => $user,
            'token' => $token,
        ]);
    }
    public function login(LoginRequest $request)
    {
        $data = $request->validated();
        $user = User::where('email', $data['email'])->first();
        if (!$user || !Hash::check($data['password'], $user->password)) {
            return $this->error(null, 'Invalid credentials', 401);
        }
        $token = $user->createToken(User::AUTH_TOKEN)->plainTextToken;

        return $this->success([
            'user' => $user,
            'token' => $token,
        ]);
    }
    public function loginWithToken()
    {
        $user = auth()->user();

        return $this->success([
            'user' => $user,
        ]);
    }
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return $this->success(null, 'Logged out');
    }
}

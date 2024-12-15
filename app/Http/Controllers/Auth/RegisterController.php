<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Auth\Events\Registered;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class RegisterController extends Controller
{
    public function create()
    {
        return Inertia::render('Auth/Register');
    }

    public function store(Request $request)
    {
        $credentials = $request->validate([
            'name' => 'required|min:3|max:191',
            'email' => 'required|email|lowercase|unique:users',
            'password' => 'required|min:3|max:191|confirmed',
        ]);

        $user = User::create($credentials);

        // send verification email
        event(new Registered($user));

        Auth::login($user);

        return redirect()->route('home');
    }
}

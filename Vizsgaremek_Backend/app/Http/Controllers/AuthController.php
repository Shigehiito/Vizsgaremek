<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Repsonse;

class AuthController extends Controller
{
    public function registerForm(){
        return view('register');
    }

    public function register(Request $request){
        $validated  = $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
        ]);

        DB::table('users')->insert([
            'name'=> $request->name,
            'email'=> $request->email,
            'password'=> Hash::make($request->password),
            'role_id'=> 2,
            'created_at' => now(),
        ]);

        return redirect('login');
    }


    public function loginForm(){
        return view('login');
    }

    public function login(Request $request){
        $validated  = $request->validate([
            'email' => ['required','email'],
            'password' => ['required'],
        ]);
        if(Auth::attempt($validated)){
            $request->session()->regenerate();
            return redirect('post');
        };

        $remember_me = $request-> has('remember_me') ? true : false;

        if(Auth::attempt($credentials, $remember_me)){
            $request->session()->regenerate();

            return redirect('post');
        }

        return back()->withErrors([
            'email' => 'The provided credentials do not match our records.',
        ])->onlyInput('email');
    }

    public function logout(Request $request){
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('post');
    }
}

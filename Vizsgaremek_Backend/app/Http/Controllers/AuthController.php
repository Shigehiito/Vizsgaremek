<?php

// namespace App\Http\Controllers;

// use Illuminate\Http\Request;
// use Illuminate\Support\Facades\DB;
// use Illuminate\Support\Facades\Hash;
// use Illuminate\Support\Facades\Auth;
// use Illuminate\Support\Facades\Response;
// use App\Models\User;

// class AuthController extends Controller
// {
//     public function registerForm(){
//         return view('register');
//     }

//     public function register(Request $request){
//         $validated  = $request->validate([
//             'name' => 'required',
//             'email' => 'required|email',
//             'password' => 'required',
//         ]);

//         DB::table('users')->insert([
//             'name'=> $request->name,
//             'email'=> $request->email,
//             'password'=> Hash::make($request->password),
//             'role_id'=> 2,
//             'created_at' => now(),
//         ]);

//         return redirect('login');
//     }


//     public function loginForm(){
//         return view('login');
//     }

//     public function login(Request $request)
//     {
//         $validated = $request->validate([
//             'email' => ['required', 'email'],
//             'password' => ['required'],
//         ]);

//         if (Auth::attempt($validated)) {
//             $request->session()->regenerate();

//             $user = Auth::user();

//             return response()->json([
//                 'message' => 'Login successful',
//                 'user' => [
//                     'id' => $user->id,
//                     'name' => $user->name,
//                     'email' => $user->email,
//                     'role_id' => $user->role_id,
//                 ]
//             ]);
//         }

//         return response()->json([
//             'message' => 'The provided credentials do not match our records.'
//         ], 401);
//     }

//     public function logout(Request $request){
//         Auth::logout();
//         $request->session()->invalidate();
//         $request->session()->regenerateToken();
//         return redirect('post');
//     }
// }
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
<<<<<<< HEAD
use App\Models\User;
=======
use Illuminate\Support\Facades\Response;
>>>>>>> 0c7d2de122e46229bf7a6fb7b6d29a56a0d17d49

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255|unique:users',
            'password' => 'required|string|min:6',
        ]);

        try {
            DB::table('users')->insert([
                'name' => $validated['name'],
                'email' => $validated['email'],
                'password' => Hash::make($validated['password']),
                'role_id' => 2, // default user role
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            return response()->json([
                'message' => 'User registered successfully',
            ], 201);

        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Registration failed.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function login(Request $request)
    {
        $validated = $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        if (!Auth::attempt($validated)) {
            return response()->json([
                'message' => 'Invalid credentials',
            ], 401);
        }

        $user = Auth::user();

        return response()->json([
            'message' => 'Login successful',
            'user' => $user,
        ]);
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return response()->json([
            'message' => 'Logged out successfully',
        ]);
    }
}


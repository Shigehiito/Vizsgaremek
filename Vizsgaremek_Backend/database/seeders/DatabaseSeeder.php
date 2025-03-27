<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {


        for($i = 2; $i < 20; $i++){
            DB::table('users')->insert([
                'name' => fake()->text(6),
                'email' => fake()->email(20),
                'password' => Hash::make('name'),
                'created_at' => now(),
            ]);




        }


    }
}

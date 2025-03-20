<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        for($i = 0; $i < 10; $i++){
            User::factory('users')->create([
                'name' => fake()->sentence(6),
                'email' => fake()->text(200),
                'password' => fake()->text(200),
            ]);
        }

        
    }
}

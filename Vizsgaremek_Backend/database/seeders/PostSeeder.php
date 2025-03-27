<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;


class PostSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user_id = DB::table('users')->pluck('id')->toArray();
        for($i = 0; $i < 10; $i++){
            DB::table('posts')->insert([
                'user_id' => $user_id[array_rand($user_id)],
                'title' => fake()->sentence(6),
                'body' => fake()->text(50),
                'created_at' => now(),
            ]);
        }

    }
}

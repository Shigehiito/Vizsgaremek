<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $role_id = DB::table('role')->pluck('id')->toArray();
        for($i = 0; $i < 20; $i++) {
            DB::table('users')->insert([
                'name' => fake()->text(6),
                'role_id' => $role_id[0],
                'email' => fake()->email(20),
                'password' => Hash::make('name'),
                'created_at' => now(),
            ]);
        }
    }
}

<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RolesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $roles = ["user","admin"];
        for($i = 0; $i < count($roles); $i++) {
            DB::table('roles')->insert([
                "role_name" => $roles[$i],
            ]);
        }
    }
}

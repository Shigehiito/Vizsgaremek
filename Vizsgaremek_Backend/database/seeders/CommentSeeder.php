<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class CommentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
            for($i = 0; $i < 10; $i++){
                DB::table('comments')->insert([
                    "user_id" => rand(5,9),
                    'content' => fake()->text(200),
                ]);
            }


    }
}

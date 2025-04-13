<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class CommentsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        $post_id = DB::table('posts')->pluck('id')->toArray();
        $user_id = DB::table('users')->pluck('id')->toArray();
        for($i = 0; $i < 10; $i++){
            DB::table('comments')->insert([
                'user_id' => $user_id[array_rand($user_id)],
                'post_id' => $post_id[array_rand($post_id)],
                'content' => fake()->text(50),
                'created_at' => now(),
            ]);
        }


    }
}

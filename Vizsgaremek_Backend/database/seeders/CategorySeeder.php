<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = ["Elden Ring","Grand Theft Auto V","Warframe","League Of Legends","Counter-Strike 2","Minecraft","Path of Exile 2","Pokemon Legends Z-A","The First Berserker: Khazan","Assassin's Creed Shadows"];
        for($i = 0; $i < count($categories); $i++){
            DB::table('category')->insert([
                'category_name' => $categories[$i],
                
            ]);
        }

    }
}

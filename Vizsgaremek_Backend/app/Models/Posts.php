<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Posts extends Model
{
    /** @use HasFactory<\Database\Factories\PostsFactory> */
    use HasFactory;

    protected $fillable = [
        'user_id',
        'category_id',
        'title',
        'body',
    ];

    public function users(){
        return $this->belongsTo(User::class);
    }
    public function comments(){
        return $this->hasMany(Comments::class);
    }


}

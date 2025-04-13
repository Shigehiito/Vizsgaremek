<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comments extends Model
{
    /** @use HasFactory<\Database\Factories\CommentsFactory> */
    use HasFactory;

    protected $fillable = [
        'user_id',
        'post_id',
        'title',
        'body',
    ];

    public function users(){
        return $this->belongsTo(User::class);
    }
    public function posts(){
        return $this->belongsTo(Posts::class);
    }
}

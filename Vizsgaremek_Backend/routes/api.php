<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostsController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CommentsController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\RolesController;
use App\Http\Controllers\CategoriesController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('/posts', [PostsController::class, 'index']);
Route::post('/posts', [PostsController::class, 'store']);
Route::put('/posts/{id}', [PostsController::class, 'update']);
Route::delete('/posts/{id}', [PostsController::class, 'destroy']);
Route::apiResource('/posts',PostsController::class);

Route::get('/comments', [CommentsController::class, 'index']);
Route::post('/comments', [CommentsController::class, 'store']);
Route::put('/comments/{id}', [CommentsController::class, 'update']);
Route::delete('/comments/{id}', [CommentsController::class, 'destroy']);
Route::apiResource('/comments',CommentsController::class);

Route::get('/categories', [CategoriesController::class, 'index']);
Route::post('/categories', [CategoriesController::class, 'store']);
Route::put('/categories/{id}', [CategoriesController::class, 'update']);
Route::delete('/categories/{id}', [CategoriesController::class, 'destroy']);
Route::apiResource('/categories',CategoriesController::class);

Route::get('/roles', [RolesController::class, 'index']);
Route::post('/roles', [RolesController::class, 'store']);
Route::put('/roles/{id}', [RolesController::class, 'update']);
Route::delete('/roles/{id}', [RolesController::class, 'destroy']);
Route::apiResource('/roles',RolesController::class);

Route::get('/users', [UsersController::class, 'index']);
Route::post('/users', [UsersController::class, 'store']);
Route::put('/users/{id}', [UsersController::class, 'update']);
Route::delete('/users/{id}', [UsersController::class, 'destroy']);
Route::apiResource('/users',UsersController::class);

Route::get('/register',[AuthController::class, 'registerForm']);
Route::post('/register',[AuthController::class, 'register']);

Route::get('/login',[AuthController::class, 'loginForm']);
Route::post('/login',[AuthController::class, 'login']);
Route::post('/logout',[AuthController::class, 'logout']);

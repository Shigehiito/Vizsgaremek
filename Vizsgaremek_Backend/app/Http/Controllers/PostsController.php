<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Posts;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\StorePostsRequest;
use App\Http\Requests\UpdatePostsRequest;
use Illuminate\Support\Facades\Repsonse;


class PostsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return \Response::json(
            [
                "data"=> [
                    ["posts"=> Posts::all()],
                ],
                "success"=> true,
                "message"=> "",
            ], 200
        );

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'body' => 'required|string',
            'user_id' => 'required|exists:users,id',
            'category_id' => 'required|exists:categories,id',
        ]);

        DB::table('posts')->insert([
            'title' => $request->title,
            'body' => $request->body,
            'user_id' => $request->user_id,
            'category_id' => $request->category_id,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        
        return response()->json([
            'message' => 'Post created successfully!'
        ], 201);
    }


    /**
     * Display the specified resource.
     */
    public function show(Posts $posts)
    {
        // $posts = DB::table('posts')->where('id', $id)->first();
        // return view('post_show' , ['posts' => $posts]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Posts $posts)
    {
        // $posts = DB::table('posts')->where('id', $id)->first();
        // return view('post_edit' , ['posts' => $posts]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatePostsRequest $request, Posts $id)
    {
        $id->update($request->all());
        return response()->json($id, 201);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Posts $id)
    {
        $id->delete();
        return response()->json($id);
    }
}

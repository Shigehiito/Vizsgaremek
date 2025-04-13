<?php

namespace App\Http\Controllers;

use App\Models\Comments;
use App\Http\Requests\StoreCommentsRequest;
use App\Http\Requests\UpdateCommentsRequest;
use Illuminate\Support\Facades\Repsonse;

class CommentsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return \Response::json(
            [
                "data"=> [
                    ["comments"=> Comments::all()],
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
    public function store(StoreCommentsRequest $request)
    {
        $comments = Comments::create($request->all());
        return response()->json($comments, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Comments $comments)
    {
        // $comments = DB::table('comments')->where('id', $id)->first();
        // return view('post_show' , ['comments' => $comments]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Comments $comments)
    {
        // $comments = DB::table('comments')->where('id', $id)->first();
        // return view('post_edit' , ['comments' => $comments]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCommentsRequest $request, Comments $id)
    {
        $id->update($request->all());
        return response()->json($id, 201);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Comments $id)
    {
        $id->delete();
        return response()->json($id);
    }
}

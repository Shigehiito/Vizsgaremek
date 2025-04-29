<?php

namespace App\Http\Controllers;

use App\Models\Comments;
use App\Http\Requests\StoreCommentsRequest;
use App\Http\Requests\UpdateCommentsRequest;
use Illuminate\Support\Facades\Response;

class CommentsController extends Controller
{
    public function index()
    {
        return response()->json(Comments::all(), 200);
    }

    public function store(StoreCommentsRequest $request)
{
    $validated = $request->validated();

    $comment = Comments::create([
        'post_id' => $validated['post_id'],
        'user_id' => $validated['user_id'],
        'content' => $validated['content'],
    ]);

    return response()->json([
        'message' => 'Comment created successfully!',
        'data' => $comment,
    ], 201);
}

    public function update(UpdateCommentsRequest $request, Comments $comments)
    {
        $comments->update($request->all());
        return response()->json($comments, 200);
    }

    public function destroy(Comments $comments)
    {
        $comments->delete();
        return response()->json(['message' => 'Comment deleted successfully']);
    }
}

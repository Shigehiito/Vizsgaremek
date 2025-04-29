<?php

namespace App\Http\Controllers;

use App\Models\Comments;
use App\Http\Requests\StoreCommentsRequest;
use App\Http\Requests\UpdateCommentsRequest;
use Illuminate\Support\Facades\Response;
use Illuminate\Http\Request;

class CommentsController extends Controller
{
    public function index()
    {
        $comments = Comments::with('users:id,name')->get(); // eager-load user name

        // Transform to include user_name explicitly
        $transformed = $comments->map(function ($comment) {
            return [
                'id' => $comment->id,
                'post_id' => $comment->post_id,
                'user_id' => $comment->user_id,
                'content' => $comment->content,
                'user_name' => $comment->users->name ?? 'Unknown',
            ];
        });

        return response()->json([
            'data' => $transformed
        ], 200);
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

    public function update(Request $request, $id)
{
    
    $comment = Comments::findOrFail($id);

    $comment->update([
        'content' => $request->input('content'),
    ]);

    return response()->json(['message' => 'Comment updated successfully'], 200);
}

    public function destroy($id)
    {
        $comment = Comments::findOrFail($id);
        $comment->delete();
        return response()->json(['message' => 'Comment deleted successfully'], 200);
    }
}

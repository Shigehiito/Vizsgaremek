<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show</title>
</head>
<body>
    <div class="container">
        <h1>Post</h1>
        <form action="/post/{{ $post->id }}" method="POST">
            @csrf
            @method('DELETE')
            <button type="submit" class="btn btn-primary">Delete</button>
        </form>
        <p>{{$post -> title}}</p>
        <p>{{$post -> body}}</p>
        <a href="/post/{{ $post->id }}/edit">Edit</a>
    </div>
</body>
</html>
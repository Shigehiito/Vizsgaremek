<form action="/posts" method='GET'>
    <input type="text" name="search" class="form-control">
</form>
<section class="container-fluid mt-4">
    @auth
        <form action="/logout" method="POST">
            @csrf
            <button type="submit">Logout</button>
        </form>
        <button class="btn btn-primary"><a href="/posts/create">Create Post</a></button>
    @endauth

    @guest
        <button class="btn btn-primary"><a href="/register">Registration</a></button>
        <button class="btn btn-primary"><a href="/login">Login</a></button>
    @endguest
    @php
        $num=1
    @endphp
    <table class="table table-bordered">
        <tr>
            <th>Post Title</th>
            <td>Post Body</td>
            <td>Edit Post</td>
        </tr>
        @foreach ($post as $item)
            <tr>
                <th>{{$item -> title}}</th>
                <td>{{$item -> body}}</td>
                <td><button class="btn btn-primary"><a href='post/${{$item->id}}/edit'>Edit</a></button></td>
            </tr>
                @php
                    $num++
                @endphp
                @endforeach
    </table>
    {{$post->links('pagination::bootstrap-5')}}
</section>




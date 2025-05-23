<div class="container">
    <h1>Login</h1>
    <div class="mb-3">
        <form action="/login" method="POST">
            @csrf

            <label for="EmailLoginFormControl">Email</label>
            <input type="text" name="email" id="EmailLoginFormControl" class="form-control">
            <br>
            @error('email')
            <p>{{$message}}</p>
            @enderror


            <label for="PWLoginFormControl">Password</label>
            <input type="password" name="password" id="PWLoginFormControl" class="form-control">
            <br>
            @error('password')
            <p>{{$message}}</p>
            @enderror

            <button type="submit" class="btn btn-primary">Login</button>
        </form>
    </div>
</div>

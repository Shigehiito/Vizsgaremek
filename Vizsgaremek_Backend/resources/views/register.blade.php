<div class="container">
    <h1>Registration</h1>

    <div class="mb-3">
        <form action="/register" method="POST">
            @csrf

            <label for="NameInputFormControl">Name</label>
            <input type="text" name="name" id="NameInputFormControl" class="form-control">
            <br>
            @error('name')
                <p>{{$message}}</p>
            @enderror


            <label for="EmailInputFormControl">Email</label>
            <input type="text" name="email" id="EmailInputFormControl" class="form-control">
            <br>
            @error('email')
            <p>{{$message}}</p>
            @enderror


            <label for="PWInputFormControl">Password</label>
            <input type="text" name="password" id="NameInputFormControl" class="form-control">
            <br>
            @error('password')
            <p>{{$message}}</p>
            @enderror

            <button type="submit" class="btn btn-primary">Register</button>
        </form>
    </div>
</div>

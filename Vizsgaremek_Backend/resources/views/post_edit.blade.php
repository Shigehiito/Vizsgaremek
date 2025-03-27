<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit</title>
</head>
<body>
<h1>Edit Post</h1>
<form action='' method='POST'>
    @csrf
    @method('PUT')
  <div class="mb-6">
    <label for="postTitle" class="form-label">Title</label>
    <input type="text" class="form-control" id="postTitle"></input>
  </div>
  <div class="mb-6">
    <label for="postBody" class="form-label">Body</label>
  </div>
  <button type="submit" class="btn btn-primary">Create</button>
  <textarea class="form-control" id="postBody"></textarea>
</form>
</body>
</html>
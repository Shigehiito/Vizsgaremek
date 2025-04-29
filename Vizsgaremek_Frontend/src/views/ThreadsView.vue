<template>
  <div class="thread-container">
    <div class="create-post">
      <h2>Create a New Thread</h2>
      <form @submit.prevent="createPost">
        <p>Title of your thread:</p>
        <input v-model="newTitle" type="text" placeholder="Thread Title" required />
        <textarea v-model="newContent" placeholder="Thread Content" required></textarea>

        <p>- Please select the category below -</p>
        <select class="dropdown" v-model="selectedCategory" required>
          <option disabled value="">Category</option>
          <option v-for="category in categories" :key="category.id" :value="category.id">
            {{ category.id }} - {{ category.name }}
          </option>
        </select>

        <button type="submit">Create Thread</button>
      </form>
    </div>

    <div v-for="post in posts" :key="post.id" class="post">
      <h3>{{ post.title }}</h3>
      <p>{{ post.body }}</p>
      <p><strong>Author:</strong> {{ post.user_name || 'Unknown' }}</p>

      <button 
        v-if="post.user_id == currentUserId"
        @click="deletePost(post.id)"
        class="delete-button"
      >
        Delete
      </button>

      <div class="comment-section">
        <h4>Comments:</h4>
        <input v-model="newComments[post.id]" type="text" placeholder="Write a comment..." />
        <button @click="submitComment(post.id)">Post Comment</button>
      </div>
      <div v-if="post.comments && post.comments.length">
      <div v-for="comment in post.comments" :key="comment.id" class="comment">
        <p><strong>{{ comment.user_id || 'Anonymous' }}:</strong> {{ comment.content }}</p>
      </div>
    </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'

const posts = ref([])
const newTitle = ref('')
const newContent = ref('')
const selectedCategory = ref('')
const currentUserId = ref(localStorage.getItem('user_id') || '')

const categories = ref([
  { id: 1, name: 'Elden Ring' },
  { id: 2, name: 'Grand Theft Auto V' },
  { id: 3, name: 'Warframe' },
  { id: 4, name: 'League Of Legends' },
  { id: 5, name: 'Counter-Strike 2' },
  { id: 6, name: 'Minecraft' },
  { id: 7, name: 'Path of Exile 2' },
  { id: 8, name: 'Pokemon Legends Z-A' },
  { id: 9, name: 'The First Berserker: Khazan' },
  { id: 10, name: "Assassin's Creed Shadows" },
])

// NEW: hold comments for each post separately
const newComments = reactive({})

const fetchPosts = async () => {
  try {
    const response = await fetch('http://127.0.0.1:8000/api/posts')
    const data = await response.json()
    posts.value = data.data[0].posts.map(post => ({
      ...post,
      comments: []
    }))
    await fetchCommentsForPosts()
  } catch (error) {
    console.error('Error fetching posts:', error)
  }
}
const fetchCommentsForPosts = async () => {
  try {
    const response = await fetch('http://127.0.0.1:8000/api/comments')
    const data = await response.json()

    const allComments = data.data[0].comments

    posts.value.forEach(post => {
      post.comments = allComments.filter(comment => comment.post_id === post.id)
    })
  } catch (error) {
    console.error('Error fetching comments:', error)
  }
}

const createPost = async () => {
  if (!currentUserId.value) {
    alert('You must be logged in to create a thread!')
    return
  }

  try {
    const response = await fetch('http://127.0.0.1:8000/api/posts', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: JSON.stringify({
        title: newTitle.value,
        body: newContent.value,
        user_id: currentUserId.value,
        category_id: selectedCategory.value,
      }),
    });

    if (response.ok) {
      alert('Thread created successfully!')
      newTitle.value = ''
      newContent.value = ''
      selectedCategory.value = ''
      await fetchPosts()
    } else {
      const result = await response.json()
      alert(result.message || 'Failed to create thread.')
    }
  } catch (error) {
    console.error('Network error:', error)
    alert('Create thread failed. Please try again.')
  }
}

const submitComment = async (postId) => {
  if (!currentUserId.value) {
    alert('You must be logged in to comment!')
    return
  }

  const commentContent = newComments[postId] || ''

  if (!commentContent.trim()) {
    alert('Comment cannot be empty!')
    return
  }

  try {
    const response = await fetch('http://127.0.0.1:8000/api/comments', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: JSON.stringify({
        post_id: postId,
        user_id: currentUserId.value,
        content: commentContent,
      }),
    });

    if (response.ok) {
      alert('Comment posted successfully!')
      newComments[postId] = ''
    } else {
      const result = await response.json()
      alert(result.message || 'Failed to post comment')
    }
  } catch (error) {
    console.error('Error posting comment:', error)
    alert('Failed to post comment')
  }
}

onMounted(fetchPosts)
</script>

<style scoped>
/* (keeping all your styles exactly) */
.dropdown {
  padding: 0.5rem;
  margin-bottom: 1rem;
  border: 1px solid #aaa;
  border-radius: 4px;
}

.thread-container {
  max-width: 700px;
  margin: 2rem auto;
  padding: 1rem;
}
.create-post {
  margin-bottom: 2rem;
  padding: 1rem;
  border: 1px solid #ccc;
  border-radius: 8px;
}
.create-post form {
  margin-top: 1rem;
}
.create-post input,
.create-post textarea {
  display: block;
  width: 100%;
  padding: 0.5rem;
  margin-bottom: 1rem;
  border: 1px solid #aaa;
  border-radius: 4px;
}
.create-post button {
  width: 100%;
  padding: 0.75rem;
  border: none;
  background-color: rgb(1, 119, 17);
  color: white;
  border-radius: 4px;
  cursor: pointer;
}
.post {
  margin-bottom: 1rem;
  padding: 1rem;
  border: 1px solid #ccc;
  border-radius: 8px;
}
.delete-button {
  margin-top: 0.5rem;
  padding: 0.5rem;
  background-color: #d9534f;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
.delete-button:hover {
  background-color: #c9302c;
}
.comments {
  margin-top: 1rem;
  padding-top: 1rem;
  border-top: 1px solid #ccc;
}
.comment {
  margin-bottom: 0.5rem;
  padding: 0.5rem;
  background-color: #f1f1f1;
  border-radius: 4px;
}
</style>
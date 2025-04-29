<template>
    <div class="thread-manager">
      <!-- Sidebar -->
      <div class="sidebar">
        <div 
          v-for="post in posts" 
          :key="post.id" 
          class="post-item" 
          @click="selectPost(post)"
          :class="{ active: selectedPost && selectedPost.id === post.id }"
        >
          {{ post.title }}
        </div>
      </div>
  
      <!-- Main content -->
      <div class="main-content">
        <div v-if="selectedPost">
          <h2>{{ selectedPost.title }}</h2>
          <p>{{ selectedPost.body }}</p>
  
          <h3>Comments:</h3>
  
          <!-- Debugging - REMOVE this later -->
          <!-- <pre>{{ comments }}</pre> -->
  
          <div v-if="comments.length === 0">No comments yet!</div>
          <div v-else>
            <div 
              v-for="comment in comments" 
              :key="comment.id" 
              class="comment-item"
            >
              <h4>{{ comment.title || 'No Title' }}</h4>
              <p>{{ comment.content || 'No Content' }}</p>
              <small><strong>Author:</strong> {{ comment.user_name || 'Unknown' }}</small>
            </div>
          </div>
  
          <!-- Add New Comment -->
          <div class="add-comment">
            <input 
              v-model="newCommentTitle" 
              type="text" 
              placeholder="Comment Title" 
              required 
            />
            <textarea 
              v-model="newCommentContent" 
              placeholder="Write your comment..." 
              rows="3" 
              required
            ></textarea>
            <button @click="submitNewComment">Submit Comment</button>
          </div>
        </div>
  
        <div v-else>
          <p>Please select a post to view.</p>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue'
  
  const posts = ref([])
  const comments = ref([])
  const selectedPost = ref(null)
  const newCommentTitle = ref('')
  const newCommentContent = ref('')
  const currentUserId = ref(localStorage.getItem('user_id') || '')
  
  // Fetch all posts
  const fetchPosts = async () => {
    try {
      const response = await fetch('http://127.0.0.1:8000/api/posts')
      const result = await response.json()
      posts.value = result.data[0].posts || []
    } catch (error) {
      console.error('Error fetching posts:', error)
    }
  }
  
  // Fetch comments for a selected post
  const fetchCommentsForSelectedPost = async () => {
    if (!selectedPost.value) return
  
    try {
      const response = await fetch('http://127.0.0.1:8000/api/comments')
      const result = await response.json()
  
      console.log('Fetched comments:', result)
  
      if (result.data && Array.isArray(result.data)) {
        const allComments = result.data[0].comments || []
        comments.value = allComments
          .filter(comment => comment.post_id === selectedPost.value.id)
          .map(comment => ({
            id: comment.id,
            post_id: comment.post_id,
            user_id: comment.user_id,
            title: comment.title,
            content: comment.content,
            user_name: comment.user_name || 'Unknown' // Safe fallback
          }))
      } else {
        comments.value = []
      }
    } catch (error) {
      console.error('Error fetching comments:', error)
    }
  }
  
  // Selecting a post
  const selectPost = async (post) => {
    selectedPost.value = post
    await fetchCommentsForSelectedPost()
  }
  
  // Submit a new comment
  const submitNewComment = async () => {
    if (!newCommentTitle.value.trim() || !newCommentContent.value.trim() || !selectedPost.value) {
      alert('Please fill both title and content.')
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
          post_id: selectedPost.value.id,
          user_id: currentUserId.value,
          title: newCommentTitle.value,
          content: newCommentContent.value,
        }),
      })
  
      const result = await response.json()
  
      if (response.ok) {
        alert('Comment submitted!')
        newCommentTitle.value = ''
        newCommentContent.value = ''
        await fetchCommentsForSelectedPost() // Refresh comments immediately!
      } else {
        alert(result.message || 'Failed to submit comment.')
      }
    } catch (error) {
      console.error('Submit error:', error)
      alert('Failed to submit comment.')
    }
  }
  
  onMounted(() => {
    fetchPosts()
  })
  </script>
  
  <style scoped>
  .thread-manager {
    display: flex;
    height: 100vh;
  }
  
  .sidebar {
    width: 20%;
    background-color: #121212;
    overflow-y: auto;
    padding: 10px;
    border-right: 5px solid #ccc;
  }
  
  .post-item {
    padding: 10px;
    margin-bottom: 5px;
    background-color: rgb(109, 108, 108);
    border: 1px solid #000000;
    cursor: pointer;
    border-radius: 10px;
  }
  
  .post-item.active {
    background-color: rgb(1, 119, 17);
    color: white;
  }
  
  .main-content {
    flex-grow: 1;
    padding: 20px;
    overflow-y: auto;
  }
  
  p {
    border-bottom: 1px solid #ccc;
    padding: 2%;
  }
  
  .comment-item {
    margin-top: 10px;
    padding: 10px;
    background-color: rgb(109, 108, 108);
    border-radius: 5px;
  }
  
  .add-comment {
    margin-top: 20px;
  }
  
  .add-comment input,
  .add-comment textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border-radius: 10px;
  }
  
  .add-comment button {
    background-color: rgb(1, 119, 17);
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
  
  .add-comment button:hover {
    background-color: rgb(0, 90, 10);
  }
  </style>
  
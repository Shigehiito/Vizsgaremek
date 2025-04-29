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

        <div v-if="comments.length === 0">No comments yet!</div>
        <div v-else>
          <div 
            v-for="comment in comments" 
            :key="comment.id" 
            class="comment-item"
          >
            <div v-if="editingComment === comment.id">
              <textarea v-model="editContent"></textarea>
              <button @click="saveEditedComment(comment.id)">Save</button>
              <button @click="cancelEditing">Cancel</button>
            </div>
            <div v-else>
              <p>{{ comment.content }}</p>
            </div>

            <small><strong>Author:</strong> {{ comment.user_name || 'Unknown' }}</small>

            <!-- Edit/Delete buttons -->
            <div v-if="canEditOrDelete(comment)">
              <button @click="startEditing(comment)">Edit</button>
              <button @click="deleteComment(comment.id)">Delete</button>
            </div>
          </div>
        </div>

        <!-- Add New Comment -->
        <div class="add-comment"> 
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
const newCommentContent = ref('')
const currentUser = ref(null)
const editingComment = ref(null)
const editContent = ref('')

const fetchPosts = async () => {
  try {
    const response = await fetch('http://127.0.0.1:8000/api/posts')
    const result = await response.json()
    posts.value = result.data[0].posts || []
  } catch (error) {
    console.error('Error fetching posts:', error)
  }
}

const fetchCurrentUser = () => {
  currentUser.value = {
    id: localStorage.getItem('user_id'),
    role_id: localStorage.getItem('user_role_id')
  }
}

const fetchCommentsForSelectedPost = async () => {
  if (!selectedPost.value) return
  try {
    const response = await fetch('http://127.0.0.1:8000/api/comments')
    const result = await response.json()
    let allComments = Array.isArray(result.data) ? result.data : result.data?.comments || []
    comments.value = allComments.filter(c => Number(c.post_id) === selectedPost.value.id).map(c => ({
      ...c,
      editing: false,
      user_name: `User #${c.user_id}`
    }))
  } catch (err) {
    console.error('Failed to fetch comments:', err)
  }
}

const selectPost = async (post) => {
  selectedPost.value = post
  await fetchCommentsForSelectedPost()
}

const submitNewComment = async () => {
  if (!newCommentContent.value.trim() || !selectedPost.value) return alert('Missing input')

  try {
    const response = await fetch('http://127.0.0.1:8000/api/comments', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: JSON.stringify({
        post_id: selectedPost.value.id,
        user_id: currentUser.value.id,
        content: newCommentContent.value
      })
    })
    const result = await response.json()
    if (response.ok) {
      alert('Comment submitted')
      newCommentContent.value = ''
      await fetchCommentsForSelectedPost()
    } else {
      alert(result.message || 'Failed to submit')
    }
  } catch (e) {
    console.error(e)
    alert('Submit failed')
  }
}

const canEditOrDelete = (comment) => {
  return currentUser.value?.id == comment.user_id || currentUser.value?.role_id == '2'
}

const startEditing = (comment) => {
  editingComment.value = comment.id
  editContent.value = comment.content
}

const cancelEditing = () => {
  editingComment.value = null
  editContent.value = ''
}

const saveEditedComment = async (commentId) => {
  try {
    const response = await fetch(`http://127.0.0.1:8000/api/comments/${commentId}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
      },
      body: JSON.stringify({
        content: editContent.value
      }),
    })

    if (response.ok) {
      alert('Comment updated.')
      editingComment.value = null
      await fetchCommentsForSelectedPost()
    } else {
      alert('Update failed.')
    }
  } catch (err) {
    console.error('Update error:', err)
    alert('Server error.')
  }
}

const deleteComment = async (commentId) => {
  if (!confirm('Are you sure you want to delete this comment?')) return

  try {
    const response = await fetch(`http://127.0.0.1:8000/api/comments/${commentId}`, {
      method: 'DELETE',
    })

    if (response.ok) {
      alert('Comment deleted.')
      await fetchCommentsForSelectedPost()
    } else {
      alert('Delete failed.')
    }
  } catch (err) {
    console.error('Delete error:', err)
    alert('Server error.')
  }
}

onMounted(() => {
  fetchPosts()
  fetchCurrentUser()
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
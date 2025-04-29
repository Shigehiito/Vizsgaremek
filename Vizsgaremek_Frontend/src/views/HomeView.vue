<template>
  <div>
    <h1> - All Posts - </h1>

    <div v-if="loading">Loading posts...</div>
    
    <div v-else-if="posts.length === 0">
      <p>No posts available.</p>
    </div>

    <div v-else>
      <div v-for="post in posts" :key="post.id" class="post">
        <h2>{{ post.title }}</h2>
        <p>{{ post.body }}</p>
      </div>
    </div>

    <div v-if="errorMessage" class="error">{{ errorMessage }}</div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'

const posts = ref([])
const loading = ref(true)
const errorMessage = ref('')

const loadPosts = async () => {
  loading.value = true
  errorMessage.value = ''

  try {
    const response = await fetch('http://127.0.0.1:8000/api/posts')
    const data = await response.json()
    console.log('Fetched posts:', data)

    posts.value = data.data[0].posts
  } catch (error) {
    console.error('Error fetching posts:', error)
    errorMessage.value = 'Error loading posts. Please try again later.'
  } finally {
    loading.value = false
  }
}
onMounted(() => {
  loadPosts()
})
</script>

<style scoped>
h1 {
  text-align: center;
  margin-top: 2rem;
}
.post {
  margin-bottom: 1rem;
  padding: 1rem;
  border: 1px solid #ccc;
  border-radius: 8px;
  max-width: 75%;
  margin: auto;
  margin-bottom: 0.5rem;
}

.error {
  margin-top: 1rem;
  color: red;
  text-align: center;
}
</style>
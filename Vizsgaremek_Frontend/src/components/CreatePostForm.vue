<template>
    <div>
      <h1>Create New Post</h1>
      <form @submit.prevent="createPost">
        <input v-model="title" type="text" placeholder="Title" required />
        <textarea v-model="content" placeholder="Content" required></textarea>
        <button type="submit">Submit</button>
      </form>
      <div v-if="message">{{ message }}</div>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  
  const title = ref('')
  const content = ref('')
  const message = ref('')
  
  const createPost = async () => {
    try {
      const token = localStorage.getItem('auth_token')
  
      const response = await fetch('http://localhost:8000/api/posts', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${token}`,
        },
        body: JSON.stringify({
          title: title.value,
          content: content.value,
        }),
      })
  
      const data = await response.json()
  
      if (response.ok) {
        message.value = 'Post created successfully!'
      } else {
        message.value = data.message || 'Error creating post.'
      }
    } catch (error) {
      console.error('Create Post Error:', error)
      message.value = 'Create post failed.'
    }
  }
  </script>
  
  <style scoped>
  form {
    max-width: 400px;
    margin: 2rem auto;
  }
  input, textarea {
    display: block;
    width: 100%;
    margin-bottom: 1rem;
    padding: 0.5rem;
  }
  button {
    padding: 0.75rem;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 4px;
  }
  </style>
  
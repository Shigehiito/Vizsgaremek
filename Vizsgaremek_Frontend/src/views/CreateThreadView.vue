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
  </div>
</template>

<script setup>
import { ref } from 'vue'

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
    })

    if (response.ok) {
      alert('Thread created successfully!')
      newTitle.value = ''
      newContent.value = ''
      selectedCategory.value = ''
    } else {
      const result = await response.json()
      alert(result.message || 'Failed to create thread.')
    }
  } catch (error) {
    console.error('Network error:', error)
    alert('Create thread failed. Please try again.')
  }
}
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
button:hover {
  background-color: rgb(0, 90, 10);
}
</style>
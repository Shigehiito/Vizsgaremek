<template>
  <div class="dashboard" v-if="user">
    <div class="card">
      <img class="avatar" src="https://www.gravatar.com/avatar?d=mp" alt="User Avatar" />
      <h2>Welcome, {{ user.name }}!</h2>
      <p><strong>Email:</strong> {{ user.email }}</p>
      <p><strong>Role:</strong> {{ user.role_id == 2 ? 'Admin' : 'User' }}</p>
      <button @click="logout" class="logout-button">Logout</button>
    </div>
  </div>
  <div v-else class="loading">
    <p>Loading user data or not logged in...</p>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'

const user = ref(null)
const router = useRouter()

onMounted(() => {
  const name = localStorage.getItem('user_name')
  const email = localStorage.getItem('user_email')
  const role_id = localStorage.getItem('user_role_id')

  if (email) {
    user.value = {
      name: name || 'User',
      email: email,
      role_id: role_id || '2'
    }
  } else {
    router.push('/login')
  }
})

function logout() {
  localStorage.clear()
  user.value = null
  alert('Logged out!')
  router.push('/login')
}
</script>

<style scoped>
.dashboard {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 80vh;
  background-color: var(--bg-color);
  color: var(--text-color);
}

.card {
  background-color: var(--card-bg);
  color: var(--text-color);
  padding: 2rem;
  border-radius: 16px;
  text-align: center;
  box-shadow: 0 4px 20px rgba(127, 125, 125, 0.354);
  width: 100%;
  max-width: 400px;
}
.avatar {
  width: 40%;
  height: 40%;
  border-radius: 50%;
  margin-bottom: 1rem;
  object-fit: cover;
  display: block;
  margin-left: auto;
  margin-right: auto;
}

.logout-button {
  margin-top: 20px;
  padding: 10px 24px;
  background-color: #d9534f;
  color: white;
  border: none;
  border-radius: 10px;
  font-weight: bold;
  cursor: pointer;
}
.logout-button:hover {
  background-color: #c9302c;
}
</style>

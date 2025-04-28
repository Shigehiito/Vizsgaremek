<template>
  <div class="dashboard" v-if="user">
    <h2>Welcome, {{ user.name }}</h2>
    <p>Email: {{ user.email }}</p>
    <p>Role: {{ user.role_id }}</p>
    <button @click="logout" class="logout-button">Logout</button>
  </div>
  <div v-else>
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
    console.error('User not logged in')
    router.push('/login')
  }
})

function logout() {
  localStorage.removeItem('user_email')
  localStorage.removeItem('user_name')
  localStorage.removeItem('user_role_id')
  user.value = null
  alert('Logged out!')
  router.push('/login')
}
</script>

<style scoped>
.dashboard {
  max-width: 600px;
  margin: 40px auto;
  padding: 20px;
  background-color: #307200;
  border-radius: 12px;
  text-align: center;
  color: white;
}
.logout-button {
  margin-top: 20px;
  padding: 10px 20px;
  background-color: #ffffff;
  color: black;
  border: none;
  border-radius: 8px;
  cursor: pointer;
}
.logout-button:hover {
  background-color: #a81c0c;
}
</style>

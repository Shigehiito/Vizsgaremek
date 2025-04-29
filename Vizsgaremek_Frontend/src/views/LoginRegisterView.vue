<template>
  <div class="auth-container">
    <h2>Register</h2>
    <form @submit.prevent="register">
      <input v-model="registerName" type="text" placeholder="Name" required />
      <input v-model="registerEmail" type="email" placeholder="Email" required />
      <input v-model="registerPassword" type="password" placeholder="Password" required />
      <button type="submit">Register</button>
    </form>

    <h2>Login</h2>
    <form @submit.prevent="login">
      <input v-model="loginEmail" type="email" placeholder="Email" required />
      <input v-model="loginPassword" type="password" placeholder="Password" required />
      <button type="submit">Login</button>
    </form>

    <div v-if="message" class="message">{{ message }}</div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const registerName = ref('')
const registerEmail = ref('')
const registerPassword = ref('')

const loginEmail = ref('')
const loginPassword = ref('')

const message = ref('')
const router = useRouter()

const register = async () => {
  try {
    const response = await fetch('http://127.0.0.1:8000/api/register', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: JSON.stringify({
        name: registerName.value,
        email: registerEmail.value,
        password: registerPassword.value,
      }),
    })

    if (response.ok) {
      message.value = 'Registration successful! Please login.'
    } else {
      const data = await response.json()
      message.value = data.message || 'Registration failed.'
    }
  } catch (error) {
    console.error('Registration error:', error)
    message.value = 'Registration error'
  }
}

const login = async () => {
  try {
    const response = await fetch('http://127.0.0.1:8000/api/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: JSON.stringify({
        email: loginEmail.value,
        password: loginPassword.value,
      }),
    })

    const data = await response.json()

    if (response.ok) {
      localStorage.setItem('user_id', data.user.id)
      localStorage.setItem('user_name', data.user.name)
      localStorage.setItem('user_email', data.user.email)
      localStorage.setItem('user_role_id', data.user.role_id)

      message.value = 'Login successful! Redirecting...'
      setTimeout(() => {
        router.push('/profile')
      }, 1000)
    } else {
      message.value = data.message || 'Login failed.'
    }
  } catch (error) {
    console.error('Login error:', error)
    message.value = 'Login error'
  }
}
</script>

<style scoped>
.auth-container {
  max-width: 400px;
  margin: 2rem auto;
  padding: 1rem;
  border: 1px solid #ccc;
  border-radius: 8px;
}
.auth-container form {
  margin-bottom: 2rem;
}
.auth-container input {
  display: block;
  width: 100%;
  padding: 0.5rem;
  margin-bottom: 1rem;
  border: 1px solid #aaa;
  border-radius: 4px;
}
.auth-container button {
  width: 100%;
  padding: 0.75rem;
  border: none;
  background-color: rgb(1, 119, 17);
  color: white;
  border-radius: 4px;
  cursor: pointer;
}
.message {
  margin-top: 1rem;
  text-align: center;
  color: green;
}
</style>

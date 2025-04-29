import axios from 'axios';
<template>
  <section>
    <div :class="{ dark: isDark }" id="app">
      <!-- <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
        <li class="nav-item">
          <router-link to="/" 
            class="nav-link" 
            exact-active-class="active-link">
              Home
          </router-link>
        </li>
        <li class="nav-item">
          <router-link
            to="/threads" 
            class="nav-link" 
            exact-active-class="active-link">
              Threads
          </router-link>
        </li>
        <li class="nav-item">
          <router-link 
            to="/login" 
            class="nav-link" 
            exact-active-class="active-link">
              Login/Register
        </router-link>
        </li>
        <li class="nav-item">
          <router-link
            to="/dashboard" 
            class="nav-link" 
            exact-active-class="active-link">
              Dashboard
        </router-link>
        </li>
        <li class="nav-item">
        <label class="theme-switch">
          <input type="checkbox" v-model="isDark" @change="toggleTheme" />
          <span class="slider"></span>
        </label>
        </li>
      </ul> -->

      <div class="navbar">
        <div class="nav-left">
          <router-link to="/" class="nav-link" exact-active-class="active-link">Home</router-link>
          <router-link to="/threads" class="nav-link" exact-active-class="active-link">Create Thread</router-link>
          <router-link to="/dashboard" class="nav-link" exact-active-class="active-link">User Profile</router-link>
          <router-link to="/comment-manager" class="nav-link" exact-active-class="active-link">Thread Manager</router-link>
        </div>
        <div class="nav-right">
          <router-link to="/login" class="nav-link" exact-active-class="active-link">Login/Register</router-link>
          <label class="theme-switch">
            <input type="checkbox" v-model="isDark" @change="toggleTheme" />
            <span class="slider"></span>
          </label>
        </div>
      </div>
        
    <router-view />
  </div>
</section>
</template>

<script>

export default {
  data() {
    return {
      isDark: false
    };
  },
  methods: {
    toggleTheme() {
      document.body.classList.toggle('dark', this.isDark);
      localStorage.setItem('theme', this.isDark ? 'dark' : 'light');
    }
  },
  mounted() {
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme === 'dark') {
      this.isDark = true;
      document.body.classList.add('dark');
    }
  }
}
</script>

<style>

body, html {
  margin: 0;
  padding: 0;
  height: 100%;
}

.dark {
  background-color: #121212;
  color: #fff;
}

.theme-switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.theme-switch input {
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  transition: 0.4s;
  border-radius: 50px;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  border-radius: 50px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  transition: 0.4s;
}

input:checked + .slider {
  background-color: #4caf50;
}

input:checked + .slider:before {
  transform: translateX(26px);
}

.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: rgb(1, 119, 17);
  padding: 1vh 2vw;
  flex-wrap: wrap;
}

.nav-left, .nav-right {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.nav-link {
  color: white;
  font-size: 150%;
  text-decoration: none;
}

.nav-link:hover {
  text-decoration: underline;
}

.active-link {
  font-weight: bold;
}

</style>
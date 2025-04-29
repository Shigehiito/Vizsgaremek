import { createRouter, createWebHistory } from 'vue-router';
import HomeView from '../views/HomeView.vue';
import CreateThreadView from '../views/CreateThreadView.vue';
import LoginRegisterView from '../views/LoginRegisterView.vue';
import UserProfile from '../views/UserProfile.vue';
import PostsView from '../views/PostsView.vue';

const routes = [
  { path: '/', name: 'Home', component: HomeView },
  { path: '/create-threads', name: 'CreateThreads', component: CreateThreadView },
  { path: '/login', component: LoginRegisterView },
  { path: '/profile', component: UserProfile },
  { path: '/posts', component: PostsView }
]

export default createRouter({
  history: createWebHistory(),
  routes
})

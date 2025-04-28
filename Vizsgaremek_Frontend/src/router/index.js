import { createRouter, createWebHistory } from 'vue-router';
import HomeView from '../views/HomeView.vue';
import ThreadsView from '../views/ThreadsView.vue';
import LoginRegisterView from '../views/LoginRegisterView.vue';
import UserDashboardView from '../views/UserDashboard.vue';

const routes = [
  { path: '/', name: 'Home', component: HomeView },
  { path: '/threads', name: 'Threads', component: ThreadsView },
  { path: '/login', component: LoginRegisterView },
  { path: '/dashboard', component: UserDashboardView }
]

export default createRouter({
  history: createWebHistory(),
  routes
})

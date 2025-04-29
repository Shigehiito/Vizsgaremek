import { createRouter, createWebHistory } from 'vue-router';
import HomeView from '../views/HomeView.vue';
import CreateThreadView from '../views/CreateThreadView.vue';
import LoginRegisterView from '../views/LoginRegisterView.vue';
import UserDashboardView from '../views/UserDashboard.vue';
import ThreadsView from '../views/ThreadsView.vue';

const routes = [
  { path: '/', name: 'Home', component: HomeView },
  { path: '/create-threads', name: 'CreateThreads', component: CreateThreadView },
  { path: '/login', component: LoginRegisterView },
  { path: '/dashboard', component: UserDashboardView },
  { path: '/threads', component: ThreadsView }
]

export default createRouter({
  history: createWebHistory(),
  routes
})

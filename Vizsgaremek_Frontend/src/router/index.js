import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import PostDetailView from '@/views/PostDetailView.vue'
import CreateView from '@/views/CreateView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
      meta:{
        title: 'Kezdőlap'
      }
    },
    {
      path: '/posts/:id',
      name: 'posts',
      component: PostDetailView,
      meta:{
        title: 'Cikk'
      }
    },
    {
      path: '/posts/create',
      name: 'create',
      component: CreateView,
      meta:{
        title: 'Létrehozás'
      }
    },
  ],
})
router.beforeEach((to ,from ,next)=>{
document.title = to.meta.title;
next();
});
export default router

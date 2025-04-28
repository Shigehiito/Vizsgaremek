<template>
  <div class="post-box">
    <h2>{{ post.title }}</h2>
    <p>{{ post.content }}</p>
    <button @click="$emit('edit-post', post)">Edit</button>
  </div>
</template>

<script setup>
defineProps({
  post: Object
});
</script>

<style scoped>
.post-box {
  border: 1px solid #ccc;
  border-radius: 8px;
  padding: 16px;
  margin-bottom: 16px;
  background: #307200;
}
:deep(.dark) .thread-box {
  background: #1e1e1e;
}
</style>
<template>
  <div class="thread-box">
    <h3>{{ thread.title }}</h3>
    <p>{{ thread.description }}</p>
    <small>Author: {{ thread.author }}</small>
    
    <button v-if="canEdit" @click="$emit('edit', thread)">Edit</button>
    <button v-if="canDelete" @click="$emit('delete', thread)">Delete</button>
  </div>
</template>

<script>
export default {
  props: {
    thread: Object,
    currentUser: Object
  },
  computed: {
    canEdit() {
      return (
        this.currentUser &&
        (this.currentUser.role === 'admin' || this.currentUser.username === this.thread.author)
      );
    },
    canDelete() {
      return this.canEdit;
    }
  }
};
</script>

<style scoped>
.thread-box {
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

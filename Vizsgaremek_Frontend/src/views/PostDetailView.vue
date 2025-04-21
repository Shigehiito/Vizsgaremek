<script>
import { http } from '@/utils/http';
export default{
    name: 'PostDetailView',
    components:
    "",
    data(){
        return {
            posts:[]
        }
    },
    methods:{
        async getPost(){
            const resp = await http.get(`/posts/${this.$routes.params.id}`);
            this.posts = await resp.data.data;
        }
    },
    mounted(){
        this.getPost();
    }

}
</script>

<template>


</template>


<style>
</style>
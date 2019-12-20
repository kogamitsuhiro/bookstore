<template>
  <div>
    <h2>投稿一覧</h2>
    <ul>
      <li
        v-for="(post, key) in posts"
        :key="key"
      >
        <p>
          <nuxt-link :to="`/admin/posts/${post.id}`">
            {{ post.title }}
          </nuxt-link>
        </p>
        <button @click="deletePost(post.id)">
          削除
        </button>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  middleware: 'auth',
  asyncData({ $axios }) {
    return $axios.$get('/api/api/v1/admin_posts')
      .then((res) => {
        return { posts: res }
      })
  },
  methods: {
    async deletePost(id) {
      this.$axios
      .$delete(`/api/api/v1/admin_posts/${id}`)
      .then(
        this.posts = this.posts.filter( post => {
          return post.id != id;
        })
      )
      .catch(e => {
        console.error(e)
      })
    }
  }
}
</script>
<style lang="scss" scoped>
li {
  display: flex;
  justify-content: space-between;
}
</style>
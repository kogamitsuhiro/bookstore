<template>
  <div>
    <h1>投稿一覧</h1>
    <ul>
      <li
        v-for="(post, key) in posts"
        :key="key"
      >
        <h2>
          <nuxt-link :to="`/posts/${post.id}`">
            {{ post.title }}
          </nuxt-link>
        </h2>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  asyncData({ $axios }) {
    return $axios.$get('/api/api/v1/posts')
      .then((res) => {
        return { posts: res }
      })
  }
}
</script>
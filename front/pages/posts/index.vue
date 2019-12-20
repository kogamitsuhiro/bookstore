<template>
  <div>
    <h2>みんなの本一覧</h2>
    <ul>
      <li
        v-for="(post, key) in posts"
        :key="key"
      >
        <p>
          <nuxt-link :to="`/posts/${post.id}`">
            {{ post.title }}
          </nuxt-link>
        </p>
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
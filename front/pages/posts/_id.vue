<template>
  <div>
    <h1>Title:{{ title }}</h1>
    <p>投稿者:{{ author }}</p>
    <p>Body:{{ body }}</p>
    <h2>カテゴリー</h2>
    <ul>
      <li
        v-for="(category, key) in categories"
        :key="key"
      >
        {{ categories[key] }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  asyncData({ $axios, params }) {
    return $axios.$get(`/api/api/v1/posts/${params.id}`)
      .then((res) => {
        return {
          title: res.post.title,
          body: res.post.body,
          author: res.user.name,
          categories: res.categories
        }
      })
  }
}
</script>
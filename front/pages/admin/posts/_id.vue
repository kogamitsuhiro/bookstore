<template>
  <div>
    <h1>Title:{{ title }}</h1>
    <p>投稿者:{{ author }}</p>
    <p>Body:{{ body }}</p>
    <p>{{ categories }}</p>
  </div>
</template>

<script>
export default {
  middleware: 'auth',
  asyncData({ $axios, params }) {
    return $axios.$get(`/api/api/v1/admin_posts/${params.id}`)
      .then((res) => {
        console.log(res)
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
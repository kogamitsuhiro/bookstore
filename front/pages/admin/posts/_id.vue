<template>
  <div>
    <h1>Title:{{ title }}</h1>
    <p>Body:{{ body }}</p>
  </div>
</template>

<script>
export default {
  asyncData({ $axios, params }) {
    return $axios.$get(`/api/api/v1/posts/${params.id}`)
      .then((res) => {
        return { title: res.title, body: res.body }
      })
  }
}
</script>
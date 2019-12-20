<template>
  <div>
    <h2>{{ title }}</h2>
    <p class="author">
      投稿者:{{ author }}
    </p>
    <ul class="category">
      <li
        v-for="(category, key) in categories"
        :key="key"
      >
        {{ categories[key] }}
      </li>
    </ul>
    <p class="body-html">
      {{ body }}
    </p>
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
  },
  methods: {
    html(body) {
      return body.replace(/\r?\n/g, '<br>')
    }
  },
}
</script>
<style lang="scss" scoped>
.author {
  font-size: 12px;
  text-align: right;
}
.body-html {
  white-space: pre-line;
}
.category {
  display: flex;
  justify-content: flex-end;
  margin-top: 10px;
  li {
    margin-left: 10px;
    padding: 5px 15px;
    background-color: $color-green;
    border-radius: 3px;
    color: $color-white;
    font-size: 12px;
  }
}
</style>
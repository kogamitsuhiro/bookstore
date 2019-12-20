<template>
  <div>
    <h2>管理画面</h2>
    <p>
      {{ loginUserName }}さんこんにちは
    </p>
    <ul>
      <li>
        <nuxt-link to="/admin/posts/">
          投稿一覧
        </nuxt-link>
      </li>
      <li>
        <nuxt-link to="/admin/posts/new">
          新規作成
        </nuxt-link>
      </li>
      <li>
        <nuxt-link to="/admin/categories/">
          カテゴリー一覧
        </nuxt-link>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  middleware: 'auth',
  computed: {
    loginUserName() {
      return this.$auth.user.name
    }
  },
}
</script>
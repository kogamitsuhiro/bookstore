<template>
  <div>
    <h1>管理画面</h1>
    <nuxt-link to="/admin/posts/">
      投稿一覧
    </nuxt-link>
  </div>
</template>

<script>
export default {
  middleware: 'auth'
}
</script>
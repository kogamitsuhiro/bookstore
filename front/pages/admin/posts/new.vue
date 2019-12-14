<template>
  <div class="signup-form">
    <form @submit.prevent="createPost">
      <p
        v-if="error"
        class="error"
      >
        {{ error }}
      </p>
      <p>
        <input
          v-model="form.title"
          type="text"
          placeholder="タイトル"
        >
      </p>
      <p>
        <input
          v-model="form.body"
          type="textarea"
          placeholder="本文"
        >
      </p>
      <div class="signup-btn">
        <button type="submit">
          投稿する
        </button>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  middleware: 'auth',
  data() {
    return {
      error: null,
      form: {
        title: "",
        body: ""
      }
    }
  },
  methods: {
    async createPost() {
      this.$axios
      .$post('/api/api/v1/admin_posts', this.form)
      .then(
        this.$router.push("/admin/posts")
      )
      .catch(e => {
        console.error(e)
      })
    }
  }
}
</script>
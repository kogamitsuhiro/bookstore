<template>
  <div class="signup-form">
    <form @submit.prevent="registration">
      <p
        v-if="error"
        class="error"
      >
        {{ error }}
      </p>
      <p>
        <input
          v-model="form.name"
          type="text"
          placeholder="お名前"
        >
      </p>
      <p>
        <input
          v-model="form.email"
          type="text"
          placeholder="メールアドレス"
        >
      </p>
      <p>
        <input
          v-model="form.password"
          type="text"
          placeholder="パスワード"
        >
      </p>
      <p>
        <input
          v-model="form.password_confirmation"
          type="text"
          placeholder="確認用パスワード"
        >
      </p>
      <div class="signup-btn">
        <button type="submit">
          登録する(無料)
        </button>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      error: null,
      form: {
        name: "",
        email: "",
        password: "",
        password_confirmation: ""
      }
    }
  },
  methods: {
    async registration() {
      this.$axios
      .$post('/api/api/v1/login', this.form)
      .then(res => {
        if(res.status) {
            this.$router.push("/")
        }
      })
      .catch(e => {
        console.error(e)
        switch(e.response.status) {
          case 400:
            this.error = "リクエストが間違っています"
            break
          case 409:
            this.error = "そのメールアドレスは既に使用されています"
            break
        }
      })
    }
  }
}
</script>
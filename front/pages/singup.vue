<template>
  <div class="register-container">
    <h2>アカウント作成</h2>
    <form @submit.prevent="registration">
      <div
        v-if="error"
        class="error"
      >
        {{ error }}
      </div>
      <div class="space-bottom-1">
        <input
          v-model="form.name"
          type="text"
          placeholder="お名前"
        >
      </div>
      <div class="space-bottom-1">
        <input
          v-model="form.email"
          type="text"
          placeholder="メールアドレス"
        >
      </div>
      <div class="space-bottom-1">
        <input
          v-model="form.password"
          type="text"
          placeholder="パスワード"
        >
      </div>
      <div class="space-bottom-1">
        <input
          v-model="form.password_confirmation"
          type="text"
          placeholder="確認用パスワード"
        >
      </div>
      <LoginBtn label="登録する(無料)" />
      <div class="space-bottom-1 txt-link">
        <nuxt-link to="/login">
          ログインはこちら
        </nuxt-link>
      </div>
    </form>
  </div>
</template>

<script>
import LoginBtn from '~/components/atoms/loginBtn.vue'
export default {
  components: {
    LoginBtn
  },
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
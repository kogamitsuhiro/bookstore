<template>
  <div class="register-container">
    <h2>ログイン</h2>
    <form @submit.prevent="login">
      <div
        v-if="error"
        class="error"
      >
        {{ error }}
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
      <LoginBtn label="ログイン" />
      <div class="space-bottom-1 txt-link">
        <nuxt-link to="/singup">
          会員登録はこちら
        </nuxt-link>
      </div>
    </form>
  </div>
</template>

<script>
import LoginBtn from '~/components/atoms/loginBtn.vue'
export default {
  middleware({ store, redirect }) {
    console.log(store.state.auth.loggedIn)
    if (store.state.auth.loggedIn) {
      return redirect('/')
    }
  },
  components: {
    LoginBtn
  },
  data() {
    return {
      error: null,
      form: {
        email: '',
        password: ''
      }
    }
  },
  methods: {
    async login() {
      try {
        await this.$auth.loginWith('local', {
          data: {
            auth: {
              email: this.form.email,
              password: this.form.password
            }
          }
        })
      } catch (e) {
        console.log(e)
        this.error = "ログイン情報をお確かめ下さい。"
      }
    }
  }
}
</script>
<style scoped lang="scss">
h1 {
  color: $color-green;
}
</style>
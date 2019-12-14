<template>
  <div>
    <h1>メールアドレスでログイン</h1>
    <p
      v-if="error"
      class="error"
    >
      {{ error }}
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
    <button @click="login">
      ログインする
    </button>
  </div>
</template>

<script>
export default {
  middleware({ store, redirect }) {
    console.log(store.state.auth.loggedIn)
    if (store.state.auth.loggedIn) {
      return redirect('/')
    }
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
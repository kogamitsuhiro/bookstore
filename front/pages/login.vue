<template>
  <div>
    <h1>ログイン画面</h1>
    <button @click="login">ログインする</button>
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
      name: 'test',
      email: 'test@example.com',
      password: 'test'
    }
  },
  methods: {
    async login() {
      try {
        await this.$auth.loginWith('local', {
          data: {
            auth: {
              name: this.name,
              email: this.email,
              password: this.password
            }
          }
        })
      } catch (e) {
        console.log(e)
      }
    }
  }
}
</script>
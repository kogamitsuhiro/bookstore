<template>
  <div>
    <div>
      <logo />
      <h1 class="title">
        sample_app
      </h1>
      <nuxt-link to="/login">
        ログイン画面へ
      </nuxt-link>
      <p
        v-if="loggedIn"
        @click="logout()"
      >
        Logout
      </p>
      <p v-if="loggedIn">
        {{ loginUserName }}さんこんにちは
      </p>
    </div>
  </div>
</template>

<script>
import Logo from '~/components/Logo.vue'

export default {
  components: {
    Logo
  },
  computed: {
    loggedIn() {
      return this.$auth.loggedIn
    },
    loginUserName() {
      return this.$auth.user.name
    }
  },
  methods: {
    async logout() {
      try {
        await this.$auth.logout()
        this.$router.push('/login')
      } catch (e) {
        console.log(e)
      }
    }
  }
}
</script>

<template>
  <header>
    <div class="header-inner">
      <h1>
        <nuxt-link to="/">
          <font-awesome-icon :icon="['fas', 'book']" />
          mini book store
        </nuxt-link>
      </h1>
      <nav>
        <div v-if="loggedIn">
          <a
            class="toLogin"
            @click.prevent
            @click="logout()"
          >
            ログアウト
          </a>
          <HeaderBtn
            label="管理画面TOP"
            link="admin"
          />
        </div>
        <div v-else>
          <nuxt-link
            to="/login"
            class="toLogin"
          >
            ログイン
          </nuxt-link>
          <HeaderBtn
            label="新規登録"
            link="singup"
          />
        </div>
      </nav>
    </div>
  </header>
</template>
<script>
import HeaderBtn from '~/components/atoms/headerBtn.vue'
export default {
  components: {
    HeaderBtn
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
        this.$router.push('/')
      } catch (e) {
        console.log(e)
      }
    }
  }
}
</script>
<style lang="scss" scoped>
header {
  position: absolute;
  top: 0;
  width: 100%;
  background-color: $color-white;
  border-bottom: 1px solid $color-white-2;
  box-shadow: 0 0 1px rgba(34,34,34,.08);
}
.header-inner {
  max-width: 840px;
  min-height: 64px;
  margin: 0 auto;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

h1 {
  font-size: 20px;
  font-weight: bold;
}

a {
  color:$color-black;
  &:hover {
    text-decoration: none;
  }
}
.toLogin {
  cursor: pointer;
  font-size: 12px;
  font-weight: 200;
  color: $color-gray;
}

</style>
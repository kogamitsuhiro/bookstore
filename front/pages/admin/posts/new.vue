<template>
  <div class="signup-form">
    <h2>記事の新規作成</h2>
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
      <ul>
        <li
          v-for="(category, key) in categories"
          :key="key"
        >
          <input
            :id="category.id"
            v-model="form.category_ids"
            type="checkbox"
            :value="category.id"
          >
          <label :for="category.id">{{ category.name }}</label>
        </li>
      </ul>
      <p>
        <textarea
          v-model="form.body"
          :rows="10"
          :cols="60"
          placeholder="本文"
        />
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
  asyncData({ $axios }) {
    return $axios.$get('/api/api/v1/admin_categories')
      .then((res) => {
        return { categories: res }
      })
  },
  data() {
    return {
      error: null,
      form: {
        title: "",
        body: "",
        category_ids: []
      }
    }
  },
  methods: {
    async createPost() {
      this.$axios
      .$post('/api/api/v1/admin_posts', this.form)
      .then(
        this.$router.push("/admin")
      )
      .catch(e => {
        console.error(e)
      })
    }
  }
}
</script>
<style lang="scss" scoped>
ul {
  display: flex;
  li {
    display: flex;
    *:last-child {
      margin-right: 10px;
    }
  }
}
</style>
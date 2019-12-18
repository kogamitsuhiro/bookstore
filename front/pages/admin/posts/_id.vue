<template>
  <div>
    <form @submit.prevent="updatePost">
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
            :checked="true"
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
          保存する
        </button>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  middleware: 'auth',
  async asyncData({ $axios, params }) {
    const [res, categories] = await Promise.all([
      $axios.$get(`/api/api/v1/admin_posts/${params.id}`),
      $axios.$get('/api/api/v1/admin_categories')
    ])
    return {
      form: {
        title: res.post.title,
        body: res.post.body,
        category_ids: res.categories
      },
      categories: categories
    }
  },
  data() {
    return {
      id: this.$route.params.id,
      error: null,
      form: {
        title: "",
        body: "",
        category_ids: []
      }
    }
  },
  methods: {
    async updatePost() {
      this.$axios
      .$put(`/api/api/v1/admin_posts/${this.id}`, this.form)
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
    margin-right: 10px;
  }
}
</style>
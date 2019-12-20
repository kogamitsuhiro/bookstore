<template>
  <div>
    <h2>カテゴリー</h2>
    <ul>
      <li
        v-for="(category, key) in categories"
        :key="key"
      >
        <p>
          {{ category.name }}
        </p>
      </li>
    </ul>

    <form @submit.prevent="createCategory">
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
          placeholder="カテゴリーを入力"
        >
      </p>
      <div class="category-btn">
        <button type="submit">
          追加する
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
        name: "",
      }
    }
  },
  methods: {
    async createCategory() {
      this.$axios
      .$post('/api/api/v1/admin_categories', this.form)
      .then(res =>{
        this.categories.push(res)
        this.form.name = ''
      })
      .catch(e => {
        console.error(e)
        this.error = "既に登録されているカテゴリーです"
      })
    }
  }
}
</script>
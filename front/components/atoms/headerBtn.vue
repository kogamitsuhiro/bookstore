<template>
  <button>
    <nuxt-link :to="`/${link}`">
      {{ label }}
    </nuxt-link>
  </button>
</template>
<script>
export default {
  props: {
    label: {
      type: String,
      dafault: '',
      required: true,
    },
    link: {
      type: String,
      dafault: '',
      required: true,
    }
  }
}
</script>
<style lang="scss" scoped>
button {
  margin-left: 16px;
  background-color: transparent;
  border: none;
  cursor: pointer;
  outline: none;
  padding: 0;
  appearance: none;
}
a {
  height: 32px;
  font-weight: 200;
  line-height: 1;
  border: 1px solid $color-green;
  background-color: $color-green;
  border-radius: 4px;
  font-size: 12px;
  white-space: nowrap;
  vertical-align: top;
  color: $color-white;
  text-decoration: none;
  padding: 0 20px;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
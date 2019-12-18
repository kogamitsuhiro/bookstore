<template>
  <div class="signup-btn">
    <button
      type="submit"
      :disabled="isPush"
    >
      {{ label }}
    </button>
  </div>
</template>
<script>
export default {
  props: {
    label: {
      type: String,
      dafault: '',
      required: true,
    },
    isPush: {
      type: Boolean,
      default: true,
      required: true
    }
  }
}
</script>
<style lang="scss" scoped>
.signup-btn {
  margin: 20px;
  text-align: center;
  button {
    width: 160px;
    height: 31px;
    font-weight: bold;
    line-height: 1;
    border: 1px solid $color-green;
    background-color: $color-green;
    color: $color-white;
    border-radius: 4px;
    font-size: 12px;
    &:disabled {
      opacity: 0.5;
    }
  }
}
</style>
<template>
  <header>
    <div class="header-inner">
      <h1>
        <nuxt-link to="/">
          <font-awesome-icon :icon="['fas', 'book']" />
          mini book store
        </nuxt-link>
      </h1>
    </div>
  </header>
</template>
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

</style>
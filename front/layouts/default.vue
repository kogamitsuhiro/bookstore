<template>
  <div id="wrapper">
    <Header />
    <main class="contents">
      <nuxt />
    </main>
    <Footer />
  </div>
</template>
<script>
  import Header from '~/components/common/_header';
  import Footer from '~/components/common/_footer';

  export default {
  components: {
    Header,
    Footer
  }
}
</script>
<style lang="scss" scoped>
#wrapper {
  min-height: 100vh;
  position: relative;
  box-sizing: border-box;
  padding: 65px 0 32px;
}
.contents {
  max-width: 840px;
  margin: 40px auto;
}
</style>

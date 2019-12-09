<template>
  <div>
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

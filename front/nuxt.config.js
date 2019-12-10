/* eslint-disable no-unused-vars */
/* eslint-disable no-undef */

export default {
  mode: 'universal',
  /*
  ** Headers of the page
  */
  head: {
    title: process.env.npm_package_name || '',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: process.env.npm_package_description || '' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },
  /*
  ** Customize the progress-bar color
  */
  loading: { color: '#fff' },
  /*
  ** Global CSS
  */
  css: [
    'reset-css', 
  ],
  /*
  ** Plugins to load before mounting the App
  */
  plugins: [
    'plugins/axios'
  ],
  /*
  ** Nuxt.js dev-modules
  */
  buildModules: [
  ],
  /*
  ** Nuxt.js modules
  */
  modules: [
    // Doc: https://bootstrap-vue.js.org
    '@nuxtjs/axios',
    '@nuxtjs/auth',
    'bootstrap-vue/nuxt',
  ],
  axios: {
    proxy: true
  },
  proxy: {
    '/api/': { target: 'http://back:3000', pathRewrite: { '^/api/': '/' } }
  },
  /*
  ** Auth configuration
  */
  auth: {
    strategies: {
      local: {
        endpoints: {
          login: { url: '/api/user_token', method: 'post', propertyName: 'jwt' },
          logout: false,
          user: { url: '/api/api/v1/login', method: 'get', propertyName: 'user' }
        }
      }
    }
  },
  /*
  ** Build configuration
  */
  build: {
    /*
    ** You can extend webpack config here
    */
    extend (config, ctx) {
    }
  }
}

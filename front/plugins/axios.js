/* eslint-disable no-unused-vars */
export default function({ $axios }) {
  $axios.setToken('access_token')

  $axios.onResponse(config => {
      $axios.setHeader('Access-Control-Allow-Origin', 'http://back:3000')
  })
}
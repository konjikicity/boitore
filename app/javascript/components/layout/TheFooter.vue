<template>
  <v-footer
    color="grey darken-3"
    padless
  >
    <v-row
      justify="center"
      no-gutters
    >
      <v-btn
        v-for="link in links"
        :key="link"
        color="white"
        :to="link.url"
        text
        rounded
        class="my-2"
        style="text-transform: none"
      >
        {{ link.text }}
      </v-btn>
      <v-col
        class="grey darken-4 py-4 text-center white--text"
        cols="12"
      >
        <strong>{{ copylight }}</strong>
      </v-col>
    </v-row>
  </v-footer>
</template>

 <script>
  export default {
    name: "TheFooter",
    data: function () {
    return {
      copylight:"©︎2021 BOIトレ",
      links: [
        {
          url: '/',
          text: 'HOME'

        },
        {
          url: '/how-to',
          text: 'BOIトレとは？'

        },
        {
          url: '/user-policy'
          text: '利用規約'

        },
        {
          url: '/privacy'
          text: 'プライバシーポリシー'

        },
        {
          url: '/info'
          text: 'お問い合わせ'

        }
      ]
    }
  }
}
 </script>

  <style scoped>
  
  </style>
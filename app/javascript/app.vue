<template>
  <v-app>
    <v-app-bar
      color="grey darken-3"
      style="height: 70px"
      app
    >
      <v-img 
        max-height="200"
        max-width="200"
        src="../assets/boitore.png"
      />
    </v-app-bar>
    <v-main>
      <v-container
        fluid
        fill-height
      >
        <v-row justify="center">
          <v-col cols="auto">
            <v-img 
              max-height="500"
              max-width="500"
              src="../assets/top.png"
            />     
          </v-col>
        </v-row>
        <v-row justify="center">
          <v-btn
            color="error"
            dark
            large
          >
            はじめてみる！
          </v-btn>
        </v-row>
      </v-container>
    </v-main>

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
          text
          rounded
          class="my-2"
          style="text-transform: none"
        >
          {{ link }}
        </v-btn>
        <v-col
          class="grey darken-4 py-4 text-center white--text"
          cols="12"
        >
          <strong>©︎2021 boiトレ</strong>
        </v-col>
      </v-row>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  data: function () {
    return {
      title: 'boiトレ',
      links: [
        'home',
        'boiトレとは？',
        '利用規約',
        'プライバシーポリシー',
        'お問い合わせ',
      ],
    };
  }
};
</script>

<style scoped>
p {
  text-align: center;
}
</style>

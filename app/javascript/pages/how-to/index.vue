<template>
  <v-container 
    fill-height 
  >
    <v-row
      justify="center"
    >
      <v-sheet
        elevation="20"
        tile
        outlined
        height="100%"
        width="80vw"
        class="rounded-lg pa-md-4 mx-lg-auto overflow-y-auto mt-9"
      >
        <v-card-title>
          <div
            class="font-weight-bold text-h4"
          >
            BOIトレとは？
          </div>
        </v-card-title>
        <v-card-text>
          <p>劇団四季にも使われている母音法を使って、発声練習ができるサービスです。</p>
          <p>テレワークで喋ることが少なくなった方にもおすすめです！</p>
        </v-card-text>
        <v-divider />
        <v-card-title>
          <div
            class="font-weight-bold text-h4"
          >
            母音法とは？
          </div>
        </v-card-title>
        <v-card-text>
          <p>文章を母音のみで発声する練習法で、母音がはっきり聞こえるようになり、</p>
          <p>聞こえづらかった声もはっきり聞こえるようになります！</p>
        </v-card-text>
        <v-divider />
        <v-divider />
        <v-card-title>
          <div
            class="font-weight-bold text-h4"
          >
            なにができるの？
          </div>
        </v-card-title>
        <v-card-text>
          <p>通常の文章と母音法後の文章の録音と再生</p>
          <p>音声認識を利用してそれぞれの文章がどう聞こえているかを確認できます！</p>
          <p>他にもTwiterで練習内容の共有, 登録していただくと練習内容の保存, MyPageから管理を行うことができます!</p>
        </v-card-text>
        <v-divider />
         <v-card color="basil"
         class="mt-9"
         elevation="0"
         >
    <v-card-title class="text-center justify-center py-6">
      <h1 class="font-weight-bold text-h2 basil--text">
        HowToBOIトレ？
      </h1>
    </v-card-title>

    <v-tabs
    grow
    color="basil"
    >
      <v-tab href="#tab1" class="font-weight-bold basil--text">練習方法！</v-tab>
      <v-tab href="#tab2" class="font-weight-bold basil--text">新規登録後！</v-tab>
      <v-tabs-slider color="light-green darken-3" />
    </v-tabs>

    <v-tab-item value="tab-1" transition="fade-transition">
    Tab 1 Content
  </v-tab-item>
  <v-tab-item value="tab-2" transition="fade-transition">
    Tab 2 Content
  </v-tab-item>
  </v-card>
  </v-sheet>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "HowToIndex",
  data() {
    return {
  tab: null,
        items: [
          '練習方法！', '新規登録後！'
        ],
        text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
  
    }
  }
}
</script>

<style scoped>
li {
  list-style: none;
}
.v-card {
  padding: 1rem;
}
.py {
  padding: 50px 0px 50px 0px;
}
p {
  font-size: 17px;
  font-weight: bold;
}
.basil--text {
  color: #356859 !important;
}
</style>
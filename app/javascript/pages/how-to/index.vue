<template>
  <v-container>
    <v-row
      justify="center"
    >
      <v-sheet
        elevation="20"
        tile
        outlined
        width="70vw"
        class="rounded-lg pa-md-8 mx-lg-auto my-9 gray"
      >
        <v-card
          elevation="0"
          class="gray"
        >
          <v-card-title>
            <div
              class="font-weight-bold text-h4 red--text"
            >
              BOIトレとは？
            </div>
          </v-card-title>
          <v-card-text
          class="white--text"
          >
            <p>劇団四季にも使われている母音法を使って、発声練習ができるサービスです。</p>
            <p>テレワークで喋ることが少なくなった方にもおすすめです！</p>
          </v-card-text>
          <v-divider />
          <v-card-title
            class="pt-7"
          >
            <div
              class="font-weight-bold text-h4 red--text"
            >
              母音法とは？
            </div>
          </v-card-title>
          <v-card-text
          class="white--text"
          >
            <p>文章を母音のみで発声する練習法で、母音がはっきり聞こえるようになり、</p>
            <p>聞こえづらかった声もはっきり聞こえるようになります！</p>
          </v-card-text>
          <v-divider />
          <v-divider />
          <v-card-title
            class="pt-7"
          >
            <div
              class="font-weight-bold text-h4 red--text"
            >
              なにができるの？
            </div>
          </v-card-title>
          <v-card-text
          class="white--text"
          >
            <p>通常の文章と母音法後の文章の録音と再生、</p>
            <p>音声認識を利用してそれぞれの文章がどう聞こえているか結果ページで見られます！</p>
            <p>他にもTwitterで練習内容の共有や、新規登録していただくと、練習内容の保存、MyPageから練習の管理ができます！</p>
          </v-card-text>
          <v-divider />
        </v-card>
        <div class="text-center justify-center py-9 basil">
          <h1
            class="font-weight-bold text-h2 red--text"
          > 
            HowToBOIトレ？
          </h1>
        </div>
        <v-tabs
          grow
        >
          <v-tab
            href="#tab-1"
            class="white--text font-weight-bold text-h6 gray"
          >
            練習方法
          </v-tab>
          <v-tab
            href="#tab-2"
            class="white--text font-weight-bold text-h6 gray"
          >
            新規登録後
          </v-tab>
          <v-tabs-slider color="red--text" />
          <v-tab-item
            value="tab-1"
            class="gray"
          >
            <TheHowToPlay />
          </v-tab-item>
          <v-tab-item value="tab-2">
            <TheAfterSignUp />
          </v-tab-item>
        </v-tabs>
        <transition name="fade">
          <v-btn 
            v-show="fab"
            v-scroll="onScroll"
            fab
            dark
            fixed
            bottom
            right
            color="error"
            @click="toTop"
          >
            <v-icon>{{ icons.apple }}</v-icon>
          </v-btn>
        </transition>
      </v-sheet>
    </v-row>
  </v-container>
</template>
<script>
const TheHowToPlay = () => import('../../components/how-to/TheHowToPlay')
const TheAfterSignUp = () => import('../../components/how-to/TheAfterSignUp')
import { mdiAppleKeyboardCaps } from '@mdi/js'

export default {
  name: "HowToIndex",
  components: {
    TheHowToPlay,
    TheAfterSignUp
  },
  data() {
    return {
      fab: false,
      icons: { apple: mdiAppleKeyboardCaps }
    }
  },
  methods: {
    onScroll (e){
      if (typeof window === 'undefined') return
      const top = window.pageYOffset ||   e.target.scrollTop || 0
      this.fab = top > 500
    },
    toTop () {
      this.$vuetify.goTo(0)
    }
  }
}
</script>
<style lang="scss" scoped>
.v-card__title {
  padding-bottom: 40px;
}
.fade-enter-active, .fade-leave-active {
  transition: 0.5s;
} 
.fade-enter, .fade-leave-to {
  opacity: 0;
  transform: scale(0);
}
.gray {
  background-color: #424242 !important;
}
p {
  font-size: 15px;
  font-weight: bold;
}
</style>
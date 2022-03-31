<template>
  <v-container 
    fill-height 
    fluid
  >
    <v-row
      justify="center"
    >
      <v-card
        elevation="20"
        tile
        outlined
        width="100%"
      >
        <v-card-title>
          <div
            class="font-weight-bold text-h5"
          >
            BOIトレとは？
          </div>
        </v-card-title>
        <v-card-text>
          <div>劇団四季にも使われている母音法を使って滑舌改善を目指すサービスです。</div>
          <div>テレワークで喋ることが少なくなった方にも発声練習におすすめです。</div>
        </v-card-text>
        <v-divider />
        <v-card-title>
          <div
            class="font-weight-bold text-h5"
          >
            母音法とは？
          </div>
        </v-card-title>
        <v-card-text>
          <div>文章を母音のみで発声する練習法で、母音がはっきり聞こえるようになるので</div>
          <div>聞こえづらかった声もはっきり聞こえるようになります。</div>
        </v-card-text>
        <v-divider />
        <v-divider />
        <v-card-title>
          <div
            class="font-weight-bold text-h5"
          >
            なにができるの？
          </div>
        </v-card-title>
        <v-card-text>
          <div>通常の文章と母音法後の文章の録音と再生</div>
          <div>音声認識を利用してそれぞれの文章がどう聞こえているかを確認できます！</div>
        </v-card-text>
        <v-divider />
        <v-card-title>
          <div
            class="font-weight-bold text-h5"
          >
            練習方法
          </div>
        </v-card-title>
        <v-card-text>
          <div
            class="font-weight-bold pb-8 text-h6"
          >
            Step.1 モードを選択する
          </div>
          <v-img
            :src="srcHowToMode"
            width="900"
            height="500"
            class="position"
          />
          <div
            class="pt-5"
          >
            練習したいモードを選択してください
          </div>
          <div
          class="pb-5"
          >
          現在3つの中から選べます
          </div>
          <div
            class="pb-8"
          >
            ※モードは随時追加予定です。
          </div>
          <div
            class="font-weight-bold pb-8 text-h6"
          >
            Step.2 文章を選択する
          </div>
          <v-img
            :src="srcHowToSelect"
            width="900"
            height="300"
            class="position"
          />
          <div
            class="pt-8 pb-5"
          >
            練習したい文章を選択してください
          </div>
          <div
            class="pb-8"
          >
            ※文章は随時追加予定です。
          </div>
          <div
            class="font-weight-bold pb-8 text-h6"
          >
            Step.3 まずは普通に録音！
          </div>
          <v-img
            :src="srcHowToNormal"
            width="900"
            height="350"
            class="position"
          />
          <div
            class="pt-8"
          >
            まずは普通に録音ボタンを押して普通に文章を発声してみましょう！
          </div>
          <div
            class="pb-8"
          >
            発声した後に停止ボタンを押すことで次の練習に進むことができます。
          </div>
          <div
            class="font-weight-bold pb-8 text-h6"
          >
            Step.4 母音法で練習！
          </div>
          <v-img
            :src="srcHowToBoin"
            width="1100"
            height="500"
            class="position"
          />
          <div
            class="pt-8"
          >
            次は母音法で練習してみましょう！
          </div>
          <div>
            母音の文章を<span class="red--text">ゆっくり・しっかり</span>何回か発音しましょう
          </div>
          <div
            class="pb-8"
          >
            その後、録音ボタンを押して普通の文章を録音してみてください！停止ボタンを押すと結果ボタンが表示されます！
          </div>
          <div
            class="font-weight-bold pb-8 text-h6"
          >
            Step.5 結果を見る！
          </div>
          <v-img
            :src="srcHowToResult"
            width="900"
            height="500"
            class="position"
          />
          <div
          class="pb-5"
          >結果画面では以下が確認できます</div>
          <ul>
            <li>判定結果:母音法での音声認識結果が元の文章と一致しているかを判定します</li>
            <li>判定基準:5段階のS・A・B・C・Dの順で評価</li>
            <li>音声認識結果: それぞれの録音した文章の音声認識結果</li>
            <li>録音結果: それぞれの文章の録音結果を再生することができます</li>
          </ul>
        </v-card-text>
        <v-divider />
        <v-row
          justify="center"
          class="py"
        >
          <v-btn
            class="error my-4z" 
            :to="{ name: 'ModeIndex'}"
            x-large
          >
            練習開始！
          </v-btn>
        </v-row>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "HowToIndex",
  data(){
    return {
      srcHowToSelect: require("HowToSelect.png"),
      srcHowToNormal: require("HowToNormal.png"),
      srcHowToBoin: require("HowToBoin.png"),
      srcHowToResult: require("HowToResult.png"),
      srcHowToMode: require("HowToMode.png")
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
</style>
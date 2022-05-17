<template>  
  <v-card
    class="basil"
  >
    <div
      class="font-weight-bold py-8 text-h5"
    >
      Step.1 モードを選択する
    </div>
    <v-img
      src="https://res.cloudinary.com/dzlhvpfmo/image/upload/v1652016264/boi%E3%83%88%E3%83%AC/77ccc5223a03a9fab6fc6ab60302a8b3_kobdtk.png"
      width="80%"
      height="60vh"
    />
    <p
      class="pt-5"
    >
      練習したいモードを選択してください
    </p>
    <p
      class="pb-5"
    >
      現在4つの中から選べます。
    </p>
    <p
      class="pb-8"
    >
      ※モードは随時追加予定です。
    </p>
    <div
      class="font-weight-bold pb-8 text-h5"
    >
      Step.2 文章を選択する
    </div>
    <v-img
      src="https://res.cloudinary.com/dzlhvpfmo/image/upload/v1651847193/boi%E3%83%88%E3%83%AC/8290d4739603c545808a957f722a595a_xqixvd.webp"
      width="80%"
      height="55vh"
    />
    <p
      class="pt-8 pb-5"
    >
      練習したい文章を選択してください
    </p>
    <p
      class="pb-8"
    >
      ※文章は随時追加予定です。
    </p>
    <div
      class="font-weight-bold pb-8 text-h5"
    >
      Step.3 まずは普通に録音！ 
    </div>
    <v-img
      src="https://res.cloudinary.com/dzlhvpfmo/image/upload/v1651847642/boi%E3%83%88%E3%83%AC/a0e0967ffcb302e8cce56974233d6ed4_biatha.webp"
      max-width="80%"
      max-height="60vh"
    />
    <p
      class="pt-8"
    >
      まずは普通に録音ボタンを押して普通に文章を発声してみましょう！
    </p>
    <p
      class="pb-8"
    >
      発声した後に停止ボタンを押すことで次の練習に進むことができます。
    </p>
    <div
      class="font-weight-bold pb-8 text-h5"
    >
      Step.4 母音法で練習！
    </div>
    <v-img
      src="https://res.cloudinary.com/dzlhvpfmo/image/upload/v1651847979/boi%E3%83%88%E3%83%AC/1dfd99d9ad8c985772cc7f4074289176_kgtv1g.jpg"
      max-width="80%"
      max-height="70vh"
    />
    <p
      class="pt-8"
    >
      次は母音法で練習してみましょう！
    </p>
    <p>
      母音の文章を<span class="red--text">ゆっくり・しっかり</span>何回か発音しましょう
    </p>
    <p
      class="pb-8"
    >
      その後、録音ボタンを押して普通の文章を録音してみてください！停止ボタンを押すと結果ボタンが表示されます！
    </p>
    <div
      class="font-weight-bold pb-8 text-h5"
    >
      Step.5 結果を見る！
    </div>
    <v-img
      src="https://res.cloudinary.com/dzlhvpfmo/image/upload/v1651833567/boi%E3%83%88%E3%83%AC/791fe2b17ae9dca4894bccddf15e71b4_ayrewv.webp"
      max-width="80%"
      max-height="70vh"
    />
    <p
      class="py-7 font-weight-bold text-h5"
    >
      結果画面では以下が確認できます
    </p>
    <ul>
      <li>判定結果:  母音法での音声認識結果が元の文章と一致しているかを判定します。</li>
      <li>判定基準:  5段階のS・A・B・C・Dの順で評価</li>
      <li>音声認識結果: それぞれの録音した文章の音声認識結果</li>
      <li>録音結果: それぞれの文章の録音結果を再生することができます。</li>
      <li class="pt-6">
        練習の結果をtwitterに共有することもできます！
      </li>
      <li class="red--text">
        ※ 録音音声は共有されません
      </li>
    </ul>
    <v-row
      justify="space-around"
      class="font-weight-bold py-15 text-h5"
    >
      <v-btn
        class="x-small light-blue white--text rounded-lg ml-10 font-weight-bold"
        :to="{ name: 'SignUpForm'}"
        style="text-transform: none"
        x-large
      >
        <v-icon
          class="mr-2"
        >
          {{ icons.file }}
        </v-icon>
        新規登録!
      </v-btn>
      <v-btn
        class="x-small white--text rounded-lg error mr-10 font-weight-bold"
        style="text-transform: none"
        x-large
        :to="{ name: 'ModeIndex'}"
      >
        <v-icon
          class="mr-2"
        >
          {{ icons.mic }}
        </v-icon>
        Start!
      </v-btn>
    </v-row>
  </v-card>
</template>
<script>
import { mdiMicrophone } from '@mdi/js'
import { mdiFileSign } from '@mdi/js'

export default{
  name: 'TheHowToPlay',
  data() {
    return {
      icons: {
        mic: mdiMicrophone,
        file: mdiFileSign
      }
    }
  }
}
</script>
<style scoped>
  p {
  font-size: 15px;
  font-weight: bold;
}
ul {
  font-weight: bold;
}
li {
  font-weight: bold;
  padding-bottom: 10px;
  list-style: none;
}
.py {
  padding: 50px 0px 50px 0px;
}
.basil {
  background-color: #FFFBE6 !important;
}
</style>
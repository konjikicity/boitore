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
      src="https://res.cloudinary.com/dzlhvpfmo/image/upload/v1651544233/HowToMode_mq9isf.webp"
      width="700"
      height="400"
    />
    <p
      class="pt-5"
    >
      練習したいモードを選択してください
    </p>
    <p
      class="pb-5"
    >
      現在3つの中から選べます
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
      src="https://res.cloudinary.com/dzlhvpfmo/image/upload/v1651544234/boi%E3%83%88%E3%83%AC/HowToSelect_mxojiv.webp"
      width="900"
      height="300"
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
      src="https://res.cloudinary.com/dzlhvpfmo/image/upload/v1651544234/boi%E3%83%88%E3%83%AC/HowToNormal_kzv4aj.webp"
      width="1100"
      height="400"
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
      src="https://res.cloudinary.com/dzlhvpfmo/image/upload/v1651544234/boi%E3%83%88%E3%83%AC/HowToBoin_mwospo.webp"
      width="1100"
      height="500"
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
      width="900"
      height="600"
    />
    <p
      class="py-7 font-weight-bold text-h5"
    >
      結果画面では以下が確認できます
    </p>
    <ul>
      <li>判定結果:  母音法での音声認識結果が元の文章と一致しているかを判定します</li>
      <li>判定基準:  5段階のS・A・B・C・Dの順で評価</li>
      <li>音声認識結果: それぞれの録音した文章の音声認識結果</li>
      <li>録音結果: それぞれの文章の録音結果を再生することができます</li>
      <li class="pt-6">
        練習の結果をtwitterに共有することもできます！
      </li>
    </ul>
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
</template>
<script>
export default{
  name: 'TheHowToPlay'

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
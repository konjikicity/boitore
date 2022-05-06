<template>
  <v-card>
    <v-card-title
      class="white--text font-weight-bold red lighten-1 pb-4"
    >
      ようこそBOIトレへ！
    </v-card-title>
    <v-card-text
      class="font-weight-bold text-h6 pt-5"
    >
      このサービスは母音法という発声練習法で発声練習をするサービスです！
    </v-card-text>
    <v-card-text
      class="pt-2"
    >
      <ul>
        <li>
          このサービスは、PCでのみプレイ可能です。<br>
          現時点で、スマートフォンからはご利用いただけません。
        </li>
        <li> 対応ブラウザは現在GoogleChromeのみとなっております。申し訳ございません</li>
        <li>このサービスでは、マイクを使用します。周囲の環境には十分ご配慮ください。</li>
        <li>練習する際はマイクの近くで練習しましょう。音声が認識できないことがあります。</li>
        <li>練習を開始した時点で、利用規約、プライバシーポリシーに同意頂いたものとみなします。</li>
      </ul>
    </v-card-text>
    <v-divider />
    <v-card-actions
      class="justify-end"
    >
      <v-btn
        class="red--text"
        :to="{ name: 'HowToIndex' }"
        text
        @click="dialog = false"
      >
        はじめての方はこちら
      </v-btn>
      <v-btn
        class="red--text"
        :to="{ name: 'ModeIndex' }"
        text
        style="text-transform: none"
        @click="dialog = false"
      >
        Start !
      </v-btn>
    </v-card-actions>
  </v-card>
</template>
<script>
export default {
  name: "TheWarning",
}
</script>
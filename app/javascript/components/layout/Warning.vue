<template>
  <v-card>
    <v-card-title
      class="white--text font-weight-bold red lighten-1 pb-4"
    >
      注意事項
    </v-card-title>
    <v-card-text
      class="pt-5"
    >
      <ul>
        <li>
          このサービスは、PCでのみプレイ可能です。<br>
          現時点で、スマートフォンからはご利用いただけません。
        </li>
        <li>
          対応ブラウザは現在GoogleChromeのみとなっております。申し訳ございません
        </li>
        <li>このサービスでは、マイクを使用します。周囲の環境には十分ご配慮ください。</li>
        <li>
          練習を開始した時点で、利用規約、プライバシーポリシーに同意頂いたものとみなします。
        </li>
      </ul>
    </v-card-text>
    <v-divider />
    <v-card-actions
      class="justify-end"
    >
      <v-btn
        color="error"
        text
        :to="{ name: 'HowToIndex' }"
        @click="dialog = false"
      >
        はじめての方はこちら
      </v-btn>
      <v-btn
        color="error"
        text
        :to="{ name: 'ModeIndex' }"
        @click="dialog = false"
      >
        開始！
      </v-btn>
    </v-card-actions>
  </v-card>
</template>
<script>
export default {
  name: "Warning",
  
}
</script>
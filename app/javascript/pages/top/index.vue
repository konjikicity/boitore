<template>
  <v-container
    fluid
    fill-height
  >
    <v-row
      justify="center"
    >
      <v-img 

        :src="srcTop"
        max-width="800"
        max-height="500"
        class="position"
      /> 
    </v-row>
    <v-row
      justify="center"
      class="mr"
    >
      <div>
        <v-dialog
          v-model="dialog"
          width="800"
        >
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              class="mb-8"
              color="error"
              x-large
              dark
              v-bind="attrs"
              v-on="on"
            >
              練習してみる！
            </v-btn>
          </template>
          <v-card>
            <v-card-title
              class="white--text font-weight-bold"
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
                  対応ブラウザは現在GoogleChromeのみとなっております
                </li>
                <li>このサービスでは、マイクを使用します。周囲の環境には十分ご配慮ください。</li>
                <li>
                  ゲームを開始した時点で、利用規約、プライバシーポリシーに同意頂いたものとみなします。
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
                :to="{ name: 'SelectIndex' }"
                @click="dialog = false"
              >
                開始！
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </div>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "TopIndex",
  data() {
    return {
      dialog: false,
      srcTop: require("top.svg")
    }
  }
}
</script>

<style scoped>
.mr {
  margin: 0px 0px 20px 0px;
}
.v-card__title {
  background-color: #EF5350;
}

</style>

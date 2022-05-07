<template>  
  <v-card
    class="basil"
  >
    <div
      class="font-weight-bold py-8 text-h5"
    >
      練習保存機能
    </div>
    <v-img
      src="https://res.cloudinary.com/dzlhvpfmo/image/upload/v1651839957/boi%E3%83%88%E3%83%AC/14caecababc47167a653af9bcea383dd_ddmqi0.webp"
      max-width="100%"
      max-height="90vh"
    />
    <p
      class="pt-5"
    >
      練習した音声を結果ページから保存できるようなります！
    </p>
    <p
      class="pb-5"
    >
      保存後は下記のカレンダー機能から参照することができます！
    </p>
    <div
      class="font-weight-bold py-8 text-h5"
    >
      カレンダー機能
    </div>
    <v-img
      src="https://res.cloudinary.com/dzlhvpfmo/image/upload/v1651848206/boi%E3%83%88%E3%83%AC/82c12d5b788af2c08eccde25941dbbcb_fokzhx.jpg"
      width="100%"
      height="90vh"
    />
    <p
      class="pt-5"
    >
      保存した音声はMyPageのカレンダーから見られます！
    </p>
    <p
      class="pb-5"
    >
      登録された音声をクリックすると詳細画面が表示され、練習結果を見られます！
    </p>
    <ul>
      他にもこんなことができます！
      <li class="pt-5">
        日単位での表示
      </li>
      <li>練習履歴を一覧で表示</li>
      <li>日付でのソート機能</li>
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
          mdi-file-sign
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
          mdi-microphone
        </v-icon>
        Start!
      </v-btn>
    </v-row>
  </v-card>
</template>
<script>
export default{
  name: 'TheAfterSignUp'

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
}
.py {
  padding: 50px 0px 50px 0px;
}
.basil {
  background-color: #FFFBE6 !important;
}
</style>
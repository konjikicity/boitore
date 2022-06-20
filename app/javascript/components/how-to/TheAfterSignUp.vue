<template>  
  <v-card
    class="gray"
  >
    <div
      class="font-weight-bold py-8 text-h5 white--text"
    >
      練習保存機能
    </div>
    <v-img
      src="https://res.cloudinary.com/dzlhvpfmo/image/upload/v1651839957/boi%E3%83%88%E3%83%AC/14caecababc47167a653af9bcea383dd_ddmqi0.png"
      max-height="700"
      max-width="700"
    />
    <p
      class="pt-5 white--text"
    >
      練習した音声を結果ページから保存できるようなります！
    </p>
    <p
      class="pb-5 white--text"
    >
      保存後は下記のカレンダー機能から参照することができます！
    </p>
    <div
      class="font-weight-bold py-8 text-h5 white--text"
    >
      カレンダー機能
    </div>
    <v-img
      src="https://res.cloudinary.com/dzlhvpfmo/image/upload/v1651848206/boi%E3%83%88%E3%83%AC/82c12d5b788af2c08eccde25941dbbcb_fokzhx.jpg"
      max-height="700"
      max-width="700"
    />
    <p
      class="pt-5 white--text"
    >
      保存した音声はMyPageのカレンダーから見られます！
    </p>
    <p
      class="pb-5 white--text"
    >
      登録された音声をクリックすると詳細画面が表示され、練習結果を見られます！
    </p>
    <ul
    class="white--text">
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
  name: 'TheAfterSignUp',
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
}
.py {
  padding: 50px 0px 50px 0px;
}
.gray {
  background-color: #424242 !important;
}
</style>
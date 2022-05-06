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
      width="1000"
      height="800"
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
      Calendar機能
    </div>
    <v-img
      src="https://res.cloudinary.com/dzlhvpfmo/image/upload/v1651840575/boi%E3%83%88%E3%83%AC/c3de5a67d40450b79c35b77ce6b214ee_r7gjyz.webp"
      width="1500"
      height="700"
    />
    <p
      class="pt-5"
    >
      保存した音声はMyPageのカレンダーから確認することができます！
    </p>
    <p
      class="pb-5"
    >
      登録された音声をクリックすると詳細画面が表示され、練習結果の確認ができます！
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
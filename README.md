# BOIトレ
![rails](https://img.shields.io/badge/Rails-v6.1.4.4-red)
![rails](https://img.shields.io/badge/Vue-v2.6.14-brightgreen)

### https://www.boitore.jp/

### サービス概要
劇団四季も使っている「母音法」という発声練習方法で、発声練習ができるサービスです。

### まず母音法とは？
日本語は母音の「あ・い・う・え・お」と子音でできている。<br>
いわば母音は言葉の土台部分にあたるので、<br>
この土台がしっかり発音できるようになると、ハッキリした声で発音できるようになる<br>

例)「おはようございます」→「おあいうおあいあう」<br>
という感じで母音のみで発音する感じ<br>


## 画面・機能一覧
| トップページ|モード選択ページ|
| ------------------------------------------------------------------|--------------------------------------------------------------------|
| <img src="https://i.gyazo.com/c90e3a5f4bde7fe5af07a62c313d066d.jpg">|<img src="https://i.gyazo.com/eb53696f87720c42f988f072e8f529d7.jpg">|
| ・スタートボタンをクリックすると注意事項のモーダルを表示|・モードを選択できます。<br>・難易度によって選択できる文章が変化|

| 文字選択ページ|
| --------------------------------------------------------------------|
| <img src="https://i.gyazo.com/6bed2e0ca79a4c16287f8b984bf28e3e.jpg">|
| ・練習する文字を選択する<br>・スライダー形式で文字を選択可能|

| 通常練習ページ|母音法練習ページ                                                       
| ------------------------------------------------------------------|------------------------------------------------------------------|
| <img src="https://i.gyazo.com/e05f5798c618641ac53520fb43a3e8ab.jpg">|<img src="https://i.gyazo.com/93190b380e5fff31b2345a5492191d17.jpg">|
| ・選択した文章を録音できる。<br>・録音ボタンを押して5秒後に録音が終了<br>・録音終了後、母音法の練習ページへのリンクを表示|・母音法の文章を発音した後、文章を録音できる。<br>・録音ボタンを押して5秒後に録音が終了　<br>・録音終了後、結果ページへのリンクを表示|

| 結果ページ|
| --------------------------------------------------------------------|
| <img src="https://i.gyazo.com/78046198c1d4ddfe079a33969ed19ae2.png">|
| ・録音した音声の音声認識を見れる<br>・録音した音声を再生できる<br>・新規登録をしていると保存可能<br>・twitter共有ボタンより投稿が可能|

| マイページ|
| --------------------------------------------------------------------------------|
|  <img src="https://i.gyazo.com/c4fcb5b5cd9522d79be53bcd3d8584e2.jpg">|
| ・カレンダーで保存した音声を表示する<br>・タブで練習履歴の一覧も表示できる|　

| プライバシーポリシー|how-toページ|
| ------------------------------------------------------------------|-------------------------------------------------------------|
| <img src="https://i.gyazo.com/8e31dca93c80ca9ac9e70cc8e6f8d13e.jpg">|<img src ="https://i.gyazo.com/c8ac90bd4902658c5f5556c7c1acad59.jpg">|            
| プライバシーポリシーを表示する|how-toページを表示する|      

| 利用規約|お問い合わせ|
| ------------------------------------------------------------------|-------------------------------------------------------------------- |
| <img src="https://i.gyazo.com/3548b81701a27a50a4b497d9f5401566.jpg">|<img src="https://i.gyazo.com/6c031093568e5c44618025eb57dfe2a7.jpg"> |
| 利用規約を表示する|お問い合わせ先(Twitterアカウント)の情報を表示する| 

| ログインページ|新規登録ページ|
| ------------------------------------------------------------------|------------------------------------------------------------|
| <img src="https://i.gyazo.com/389a8297ee427eb2e626b8ff9997db50.jpg">|<img src="https://i.gyazo.com/8eb28348ffee82eeff1136b829523571.jpg">|
| ログインページを表示する|新規登録ページを表示する|

## 使用技術
**フロントエンド**
<ul>
  <li>Vue.js 2.6.14</li>
  <details>
    <summary>主要yarnパッケージ</summary>
    <ul>
      <li><a href="https://github.com/vuetifyjs/vuetify">vuetify</a></li>
      <li><a href="https://github.com/vuejs/vue-router">vue-router</a></li>
      <li><a href="https://github.com/vuejs/vuex/tree/3.x">vuex</a></li>
      <li><a href="https://github.com/logaretm/vee-validate">vee-validate</a></li>
      <li><a href="https://github.com/robinvdvleuten/vuex-persistedstate">vue-persistedstate</a></li>
      <li><a href="https://github.com/axios/axios">axios</a></li>
      <li><a href="https://github.com/eslint/eslint">eslint</a></li>
    </ul>
  </deatails>
</ul>

**バックエンド**
<ul>
  <li>Ruby 3.0.2</li>
  <li>Rails 6.1.4.4</li>
  <details>
    <summary>主要gem</summary>
    <ul>
      <li><a href="https://github.com/lynndylanhurley/devise_token_auth">devise_token_auth</a></li>
      <li><a href="https://github.com/rails-api/active_model_serializers">active_model_serializers</a></li>
      <li><a href="https://github.com/carrierwaveuploader/carrierwave">carrierwave</a></li>     
      <li><a href="https://github.com/cloudinary/cloudinary_gem">cloudinary</a></li>
      <li><a href="https://github.com/mbleigh/seed-fu">seed-fu</a></li>
      <li><a href="https://github.com/kpumuk/meta-tags">meta-tags</a></li>
      <li><a href="https://github.com/rubocop/rubocop">rubocop</a></li>
    </ul>
  </deatails>
</ul>
  
**インフラ**
- Heroku
- PostgreSQL
- Cloudinary

**使用API**
- MediaRecorderAPI(音声録音に使用)
- WebSpeechAPI(音声認識に使用)
- ひらがな化API（音声認識した文章をひらがなに変換するために使用）

### 画面遷移図
https://www.figma.com/file/4h1J03eBaY1HfQgUWrITyE/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3

### ER図
https://drive.google.com/file/d/1A6Mliev9MKTnjQ7ACH_bxTKpjfW-O8wG/view?usp=sharing

## こだわった点・苦労した点
[issue](https://github.com/konjikicity/boitore/issues/243)

## 関連ページ
- Twitterハッシュタグ: [#BOIトレ](https://twitter.com/hashtag/BOI%E3%83%88%E3%83%AC?src=hashtag_click)
- Qiita記事: [【個人開発】母音法を広めたい！劇団四季も使っている『母音法』で発声練習ができるサービス『BOIトレ ~ 母音法で発声練習 ~』をリリースしました！](https://qiita.com/konjikicity/items/005cda4b9248803efa7e)
# vowel-training

### サービス概要
滑舌に悩みを持っている人が
母音法で滑舌を練習できるサービスです。

### まず母音法とは？
日本語は母音の「あ・い・う・え・お」と子音でできている。
いわば母音は言葉の土台部分にあたるので
この土台がしっかり発音できるようになると
ハッキリした声で発音できるようになる
例)「おはようございます」→「おあいうおあいあう」
という感じで母音のみで発音する感じ

### メインのターゲットユーザー
- 滑舌が悪いことが悩みの人
- 小さい声でもしっかり相手に言葉を伝えたい人

### ユーザーが抱える課題
- 滑舌が悪いせいで何回も相手に聞き変えされてしまう
- 音声チャットサービスなどを使うと滑舌が悪いせいでさらに言葉が相手に伝わりずらくなる。
- リモートワークが増えたことでしゃべる機会が減っているので、いきなりしゃべると変な声になる。
- 自分の音声チャット等で自分の音声がどう聞こえているか判断しずらい

### 解決方法
- 劇団四季でも使われている母音法を用いることで滑舌改善を図る。
- 最初の音声、母音法を練習したあとの音声を比較できるようにすることで改善点を自分で把握、意識できる

### 実装予定の機能
- MVP
  - 音声入力による録音機能
    1. まず発声する用意された言葉を選択、難易度を星で表現
    2. 何もせず自分の声を録音
    3. 上記の母音法でその言葉を練習
    4. もういちどその言葉を発声して録音
    5. 2つの録音が録音されると結果画面に遷移して録音された音声を確認できる
- 本リリース
  - 結果画面にtipsや発声に役立つyoutubeのリンクを埋め込み
  - ログイン機能の追加
   - 練習した通常音声、母音の音声をログイン時は保存できるようにする
   - マイページで音声を確認できる

### なぜこのサービスを作りたいのか？
もともと自分は滑舌が悪く、小、中学校はそのことで心ない言葉をかけられていた時期も
ありました。見かねた親が滑舌を改善できる塾に通わせてくれるようになり
そこで出会ったのが母音法でした。他にも練習方法はありましたが、自分で体験した中で
一番母音法が効果があり、成人するにつれて、相手から聞き直されたり、他の人から指摘を
受けることがなくなっていきました。
そこで、滑舌に悩みを持っている人が母音法を練習できるサービスを作ることで
自分と同じように滑舌を改善することができるのではないか？と思いました。
普通の音声と母音法を練習した音声を比較することで、自分で変化に気づくことができ
投稿して意見をもらえるようなプラットホームをつくることで、より改善に向かうことを
期待しています。
自分は滑舌が悪いのが個性だ！と思っていましたが、心ない言葉をかけられると
落ち込むこともありました。そんな僕と同じような思いをして欲しくないので
同じ悩みを抱えている人に滑舌改善のキッカケになれるようなサービスにしたいと
考えております。

### スケジュール
- 12/31 〆ER図作成
- 1/31 〆MVPリリース
- 2/31 〆本リリース

### 画面遷移図
https://www.figma.com/file/4h1J03eBaY1HfQgUWrITyE/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3
<template>
  <v-container
    class="privacy-policy white--text scroll"
    fill-height
    fluid
  >
    <v-row align-content="center">
      <v-spacer />
      <v-col cols="10">
        <h1>プライバシーポリシー</h1>

        <h2>取得する情報</h2>
        <p>
          本サービスはユーザーから以下の情報を取得します。
        </p>
        <ul>
          <li>メールアドレス</li>
          <li>
            外部サービスのプライバシー設定によりユーザーが連携先に開示を認めた情報
          </li>
          <li>Cookie(クッキー)を用いて生成された識別情報</li>
          <li>
            OSが生成するID、端末の種類、端末識別子等のユーザーが利用するOSや端末に関する情報
          </li>
          <li>
            当社ウェブサイトの滞在時間、入力履歴、購買履歴等の当社ウェブサイトにおけるユーザーの行動履歴
          </li>
          <li>
            ユーザーの音声データ
          </li>
        </ul>

        <h2>情報を利用する目的</h2>
        <p>
          本サービスは、ユーザーから取得した情報を以下の目的のために利用します。
        </p>
        <ul>
          <li>当社サービスに関する登録の受付、ユーザーの本人確認、認証のため</li>
          <li>ユーザーの当社サービスの利用履歴を管理するため</li>
          <li>
            当社サービスにおけるユーザーの行動履歴を分析し、当社サービスの維持改善に役立てるため
          </li>
          <li>市場分析、マーケティングのため</li>
          <li>ユーザーからのお問い合わせに対応するため</li>
          <li>当社の規約や法令に違反する行為に対応するため</li>
          <li>当社サービスの変更、提供中止、終了、契約解除をご連絡するため</li>
          <li>当社規約の変更等を通知するため</li>
          <li>以上の他、当社サービスの提供、維持、保護及び改善のため</li>
        </ul>

        <h2>第三者提供</h2>
        <p>
          本サービスは、ユーザーから取得する情報のうち、個人データ（個人情報保護法第２条第６項）に該当するものついては、あらかじめユーザーの同意を得ずに、第三者（日本国外にある者を含みます。）に提供しません。
        </p>
        <p>
          但し、次の場合は除きます。
        </p>
        <ul>
          <li>個人データの取扱いを外部に委託する場合</li>
          <li>本サービスが買収された場合</li>
          <li>
            事業パートナーと共同利用する場合（具体的な共同利用がある場合は、その内容を別途公表します。）
          </li>
          <li>その他、法律によって合法的に第三者提供が許されている場合</li>
        </ul>

        <h2>アクセス解析ツール</h2>
        <p>
          本サービスは、ユーザーのアクセス解析のために、「Googleアナリティクス」を利用しています。Googleアナリティクスは、トラフィックデータの収集のためにCookieを使用しています。トラフィックデータは匿名で収集されており、個人を特定するものではありません。Cookieを無効にすれば、これらの情報の収集を拒否することができます。詳しくはお使いのブラウザの設定をご確認ください。Googleアナリティクスについて、詳しくは以下からご確認ください。
        </p>
        <a href="https://marketingplatform.google.com/about/analytics/terms/jp/">Googleアナリティクス利用規約</a>
     
        <h2>プライバシーポリシーの変更</h2>
        <p>
          本サービスは、必要に応じて、このプライバシーポリシーの内容を変更します。
        </p>

        <h2>お問い合わせ</h2>
        <p>
          お客様の情報の開示、情報の訂正、利用停止、削除をご希望の場合は、以下のTwitterアカウント宛にダイレクトメールにてご連絡ください。
        </p>
        <v-btn
          href="https://twitter.com/konjikicity"
          min-height="20"
          class="x-small light-blue white--text my-10"
          style="text-transform: none"
          rounded
        >
          <v-icon
            class="mr-2"
          >
            mdi-twitter
          </v-icon>
          @konjikicity
        </v-btn>
        <p>
          この場合、必ず、運転免許証のご提示等当社が指定する方法により、ご本人からのご請求であることの確認をさせていただきます。なお、情報の開示請求については、開示の有無に関わらず、ご申請時に一件あたり1,000円の事務手数料を申し受けます。
        </p>

        <h2>事業者の名称</h2>
        <p>BOIトレ</p>

        <br>
        2022年3月26日 制定<br>
      </v-col>
      <v-spacer />
    </v-row>
  </v-container>
</template>
<script>
export default {
  name: "PrivacyPolicy"
}
</script>
<style scoped>
h1 {
  margin-top: 20px;
  margin-bottom: 10px;
}
h2,
h3 {
  margin-top: 15px;
}
.v-application p {
  line-height: 1.7rem;
  margin-top: 0.3rem;
  margin-left: 10px;
  margin-bottom: 0.3rem;
}
ul,
ol {
  margin-left: 15px;
}
ul li,
ol li {
  line-height: 1.7rem;
}
.privacy-policy {
  margin-bottom: 20px;
}
.scroll {
  position: fixed;
  overflow: auto;
  height: 90vh;
}
</style>
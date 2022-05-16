<template>
  <v-container
    class="inquiry white--text"
    fill-height
    fluid
  >
    <v-row align-content="center">
      <v-spacer />
      <v-col
        class="text-center"
        cols="10"
      >
        <p class="font-weight-bold">
          サービスの利用に関するお問い合わせ、不具合の報告などがございましたら、
        </p>
        <p class="font-weight-bold">
          お手数ですが、以下のTwitterアカウント宛のダイレクトメールにてお知らせください。
        </p>
        <v-icon>mdi-email</v-icon>
        <p>
          <v-btn
            href="https://twitter.com/konjikicity"
            min-height="20"
            class="x-small light-blue white--text"
            rounded
            style="text-transform: none"
          >
            <v-icon
              class="mr-2"
            >
              {{ icons.twitter }}
            </v-icon>
            @konjikicity
          </v-btn>
        </p>
      </v-col>
      <v-spacer />
    </v-row>
  </v-container>
</template>
<script>
import { mdiTwitter } from '@mdi/js'

export default {
  name: "Contact",
  data() {
    return {
      icons: { twitter: mdiTwitter }
    }
  }
}
</script>
<style scoped>
.post-link {
  display: inline-block;
  word-break: break-all;
  padding: 2px 8px;
  border-radius: 5px;
  text-transform: none !important;
  white-space: normal;
  max-width: calc(100% - 30px);
  height: inherit !important;
}
</style>
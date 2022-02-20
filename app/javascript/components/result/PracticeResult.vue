<template>
  <v-row justify="space-around">
    <v-col cols="auto">
      <v-dialog
        transition="dialog-bottom-transition"
        max-width="auto"
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            color="error"
            v-bind="attrs"
            class="mb-5"
            x-large
            v-on="on"
            @click="setRecords"
          >
            結果を見る!
          </v-btn>
        </template>

        <template v-slot:default="dialog">
          <v-card>
            <div class="text-h3 text-center py-9">
              録音結果！
            </div>
            <v-divider />
            <v-row
              justify="center"
            >
              <v-col
                class="text-center py-9"
                cols="5"
              >
                <p>練習前の音声</p>
                <audio
                  :src="normalVoice.url"
                  controls
                />
              </v-col>
              <v-col
                class="text-center py-9"
                cols="5"
              >
                <p>練習後の音声</p>
                <audio 
                  :src="boinVoice.url"
                  controls
                />
              </v-col>
            </v-row>
            <v-divider />
            <v-card-actions class="justify-center py-15">      
              <v-btn
                text
                :to="{ name: 'SelectIndex'}"
                class="mr-5"
                @click="dialog = false"
              >
                もう一度練習する
              </v-btn>
              <v-btn
                text
                :to="{ name: 'TopIndex'}"
                @click="dialog = false"
              >
                タイトルへ戻る
              </v-btn>
            </v-card-actions>
          </v-card>
        </template>
      </v-dialog>
    </v-col>
  </v-row>
</template>
<script>
export default {
  data () {
      return {
         boinVoice: { url: ''},
         normalVoice: { url: ''}
      }
  },
  methods: {
    setRecords() {
      this.boinVoice.url = sessionStorage.getItem('setBoin');
      this.normalVoice.url = sessionStorage.getItem('setNormal');
    }
  }
} 
</script>
<style scoped>

</style>
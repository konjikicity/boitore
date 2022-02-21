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
            <div class="text-center">
              <h3 class="text-h3 font-weight-bold pt-10">判定結果！</h3>
            </div>
            <div class="text-center py-9">
            <p v-bind:style="{ color: activeColor }" class="text-h2 font-weight-bold">{{ judge }}</p>
            <p class="py text-h4">{{ judgeText }}</p>
            </div>
            <v-divider />
            <v-row
            justify="center"
            >
            <h3 class="py-9 text-h5 font-weight-bold">音声認識の結果</h3>
            </v-row>
            <v-row
            justify ="center"
            >
            <v-col
            cols="5"
            class="text-center"
            >
            <p class="py">通常の録音は<span class="red--text">{{ normalRecognition }}</span>と聞こえています。</p>
            </v-col>
            <v-col
            cols="5"
            class="text-center"
            >
            <p class="py">母音法の録音は<span class="red--text">{{ boinRecognition }}</span>と聞こえています。</p>
            </v-col>
            </v-row>
            <v-divider />
            <v-row
              justify="center"
            >
              <v-col
                class="text-center py-9"
                cols="5"
              >
                <p>通常の音声</p>
                <audio
                  :src="normalVoice.url"
                  controls
                />
              </v-col>
              <v-col
                class="text-center py-9"
                cols="5"
              >
                <p>母音法の音声</p>
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
         normalVoice: { url: ''},
         boinRecognition: '',
         normalRecognition: '',
         judge: '',
         judgeText: '',
         activeColor: ''
      }
  },
  methods: {
    setRecords() {
      this.boinVoice.url = sessionStorage.getItem('setBoin');
      this.normalVoice.url = sessionStorage.getItem('setNormal');
      this.boinRecognition = sessionStorage.getItem('setBoinRecognition');
      this.normalRecognition = sessionStorage.getItem('setNormalRecognition')

    }
  },
  watch: {
    boinRecognition: function() {
      if(this.boinRecognition == 'こんにちは'){
        this.judge = 'Good!'
        this.activeColor = 'red'
        this.judgeText = 'しっかりこんにちはと聞こえています!'
      }
      else if(this.boinRecognition == 'おはようございます') {
        this.judge = 'Good!'
        this.activeColor = 'red'
        this.judgeText = 'しっかりおはようございますと聞こえています!'
      }
      else if(this.boinRecognition == 'よろしくお願いします') {
        this.judge = 'Good!'
        this.activeColor = 'red'
        this.judgeText = 'しっかりよろしくお願いしますと聞こえています!'
      }
      else {
        this.judge = 'Bad..'
        this.activeColor = 'blue'
        this.judgeText = '文字を認識できませんでした...もう一度練習しましょう!'
        
      }
    }
  }
} 
</script>
<style scoped>
.py {
  margin: 0;
  padding: 0px 0px 30px 0px;
}

</style>
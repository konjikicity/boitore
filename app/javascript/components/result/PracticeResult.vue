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
              <h3 class="text-h3 font-weight-bold pt-10">
                判定結果！
              </h3>
            </div>
            <div class="text-center py-9">
              <p
                :style="{ color: activeColor }"
                class="text-h2 font-weight-bold"
              >
                {{ judge }}
              </p>
              <p class="py text-h4">
                {{ judgeText }}
              </p>
              <p class="py text-h4">
                {{ score }}点
              </p>
            </div>
            <v-divider />
            <v-row
              justify="center"
            >
              <h3 class="py-9 text-h5 font-weight-bold">
                音声認識の結果
              </h3>
            </v-row>
            <v-row
              justify="center"
            >
              <v-col
                cols="5"
                class="text-center"
              >
                <p class="py">
                  通常の録音は<span class="red--text">{{ normalRecognition }}</span>と聞こえています。
                </p>
              </v-col>
              <v-col
                cols="5"
                class="text-center"
              >
                <p class="py">
                  母音法の録音は<span class="red--text">{{ boinRecognition }}</span>と聞こえています。
                </p>
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
            <v-row
              justify="center"
            >
              <Message :alert="alert" />
            </v-row>
            <v-row
              justify="center"
            >
              <v-btn
                v-if="token !== null"
                class="error my-12"
                @click="saveResult"
              >
                結果を保存する
              </v-btn>
            </v-row>            
            <v-divider />
            <v-card-actions class="justify-center py-15">      
              <v-btn
                :to="{ name: 'ModeIndex'}"
                class="mr-5"
                @click="dialog = false"
              >
                もう一度練習する
              </v-btn>
              <v-btn
                :to="{ name: 'TopIndex'}"
                exact
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
import Message from '../../components/layout/Message'

export default {
  name: 'PracticeResult',
  components: {
    Message
  },
  data () {
    return {
      boinVoice: { url: ''},
      normalVoice: { url: ''},
      boinRecognition: '',
      normalRecognition: '',
      judge: '',
      judgeText: '',
      activeColor: '',
      normalSentence: '',
      boinSentence: '',
      score: '',
      token: null,
      uid: null,
      id: null,
      alert: null,
      normalForm: null,
      boinForm: null
    }
  },
  watch: {
    boinRecognition: function() {
        
      // 選択した文章と音声認識した文章を比較して何文字あっているかを算出
      let resultWord = this.boinRecognition
      let normalWord = this.normalSentence
      let resultWordReplace = resultWord.replace(/\s+/g, "");
      let resultWordSplit = resultWordReplace.split('');
      let normalWordSplit = normalWord.split('');
      let resultDifference = normalWordSplit.filter(i => resultWordSplit.indexOf(i) == -1);
      let resultNormalLength = normalWord.length
      let resultDifferenceLength = resultDifference.length
      let result = resultNormalLength - resultDifferenceLength

      //音声認識された文章の空白をなくす
      this.boinRecognition = resultWordReplace
      this.normalRecognition = this.normalRecognition.replace(/\s+/g, "")

      // 全体の文字の数を細分化して評価基準を作る
      let resultA = resultNormalLength * 0.75
      if (resultA > 0) resultA = Math.round(resultA);
      let resultB = resultNormalLength * 0.5
      if (resultB > 0) resultB = Math.round(resultB);
      let resultC = resultNormalLength * 0.25
      if (resultC > 0) resultC = Math.round(resultC);

      if(resultWord == normalWord ){
        this.judge = 'S'
        this.activeColor = 'red'
        this.judgeText = '一言一句違わぬ発音です！すばらしい'
        this.score = 100
      }
      else if( result >= resultA  ) {
        this.judge = 'A'
        this.activeColor = 'red'
        this.judgeText = 'あと一歩で完璧です！自信持っていきましょう！'
        this.score = 75 + Math.floor( Math.random() * 25 ); 
      }
      else if( result >= resultB ) {
        this.judge = 'B'
        this.activeColor = 'red'
        this.judgeText = '人によっては聞こえづらいかもしれません...もう少し頑張りましょう！'
        this.score = 50 + Math.floor( Math.random() * 26 );
      }
      else if( result >= resultC ) {
        this.judge = 'C'
        this.activeColor = 'red'
        this.judgeText = '少し聞き取りずらいかもしれません...fight!'
        this.score = 25 + Math.floor( Math.random() * 26 );
      }
      else {
        this.judge = 'D'
        this.activeColor = 'blue'
        this.judgeText = '全く聞き取れないかもです...もう一度練習しましょう!'
        this.score = 10 + Math.floor( Math.random() * 16 );
         
      }
  
    }
  },
  methods: {
    //storeに保存した文章を取得する
    setRecords() {
      this.id = this.$store.getters['login/id']
      this.token = this.$store.getters['login/token']
      this.uid = this.$store.getters['login/uid']
      this.client = this.$store.getters['login/client']
      this.normalSentence = this.$store.getters['practice/normalSentence']
      this.boinSentence = this.$store.getters['practice/boinSentence']
      this.boinVoice.url = this.$store.getters['practice/boinVoice']
      this.normalVoice.url = this.$store.getters['practice/normalVoice']
      this.boinRecognition = this.$store.getters['practice/boinRecognition']
      this.normalRecognition = this.$store.getters['practice/normalRecognition']
      this.boinForm = this.$store.getters['practice/boinForm']
      this.normalForm = this.$store.getters['practice/normalForm']
    },
    saveResult() {
      const form = new FormData();
      form.append("play_result[normal_voice]", this.normalForm)
      form.append("play_result[boin_voice]", this.boinForm)
      form.append("play_result[practiced_sentence]", this.normalSentence)
      form.append("play_result[practiced_normal]", this.normalRecognition)
      form.append("play_result[practiced_boin]", this.boinRecognition)
      form.append("play_result[judge]", this.judge)
      form.append("play_result[score]", this.score)
      form.append("play_result[user_id]", this.id)
      this.$axios.post('/play_results', form,{
        headers: {
          'content-type': 'multipart/form-data',
          uid: this.uid,
          "access-token": this.token,
          client: this.client,
        },   
      })
        .then(res => {
        
          this.$store.dispatch(
            "message/showMessage",
            {
              message: "文章を保存しました。",
              type: "success",
              status: true,
            },
          )
          
          console.log({ res })
          this.$router.push({ name: 'MyPageIndex' })
        })
        .catch(err => {
          console.log(err.status)
          this.alert = "練習していない文章があります！ 文章が保存できませんでした."
        });
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
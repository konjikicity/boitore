<template>
  <v-row justify="space-around">
    <v-col cols="auto">
      <v-card
        min-width="80vw"
      >
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
          <p class="py text-h4 font-weight-bold">
            {{ judgeText }}
          </p>
          <p class="py text-h4 font-weight-bold">
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
          <v-col
            cols="3"
            class="text-center"
          >
            <v-btn
              :href="shareTwitter"
              target="_blank"
              class="x-small light-blue white--text mt-12 mb-3 font-weight-bold"
              rounded
              style="text-transform: none"
            >
              <v-icon
                class="mr-2"
              >
                {{ icons.twitter }}
              </v-icon>
              結果をツイートする！
            </v-btn>
            <p class="red--text font-weight-bold">
              ※ 録音音声は共有されません
            </p>
          </v-col>
          <v-col
            v-if="users.token !== null"
            cols="3"
            class="text-center"
          >
            <v-btn
              class="error my-12"
              rounded
              @click="saveResult"
            >
              <v-icon
                class="mr-2"
              >
                {{ icons.save }}
              </v-icon>
              結果を保存する
            </v-btn>
          </v-col>
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
    </v-col>
  </v-row>
</template>
<script>
import { mdiTwitter } from '@mdi/js'
import { mdiContentSaveOutline } from '@mdi/js'
import { mapGetters } from 'vuex'

export default {
  name: 'ThePracticeResult',
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
      normalForm: null,
      boinForm: null,
      users: {
        id: null,
        token: null,
        uid: null,
        client: null,
      },
      icons: { 
        twitter: mdiTwitter,
        save: mdiContentSaveOutline
      } 
    }
  },
  computed: {
    fullPath() {
      return window.location.origin + this.$router.resolve({ name: "TopIndex" }).href
    },
    shareTwitter() {
      let share= "https://twitter.com/intent/tweet?url=" + 
      "【練習結果】" +
      "%0D%0A" +
      "%0D%0A" +
      "通常の音声認識:"+ `『${this.normalRecognition}』と聞こえました` +
      "%0D%0A" + 
      "母音法の音声認識:"+ `『${this.boinRecognition}』と聞こえました` +
      "%0D%0A" + 
      "得点:" + `%20${this.score}` +
      "%0D%0A" + 
      "評価:" + `%20${this.judge}` +
      "%0D%0A" +
      this.fullPath + "&hashtags=BOIトレ"+"&hashtags=母音法"

      return share
    },
    ...mapGetters(["login/id","login/uid", "login/token", "login/client"]),
    ...mapGetters(["practice/normalSentence", "practice/boinSentence", "practice/boinVoice", "practice/normalVoice",
      "practice/boinRecognition", "practice/normalRecognition", "practice/boinForm", "practice/normalForm"
    ])
  },
  watch: {
    boinRecognition: function() {
        
      // 選択した文章と音声認識した文章を比較して何文字あっているかを算出
      const resultWord = this.boinRecognition
      const normalWord = this.normalSentence
      const resultWordReplace = resultWord.replace(/\s+/g, "");
      const resultWordSplit = resultWordReplace.split('');
      const normalWordSplit = normalWord.split('');
      const resultDifference = normalWordSplit.filter(i => resultWordSplit.indexOf(i) == -1);
      const resultNormalLength = normalWord.length
      const resultDifferenceLength = resultDifference.length
      const result = resultNormalLength - resultDifferenceLength

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
      
      // 評価基準に基づいて採点を行う
      if(resultWord == normalWord ){
        this.judge = 'S'
        this.activeColor = 'yellow'
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
  created() {
    this.getLogin();
    this.getPracticeResult();
  },
  methods: {
    async saveResult() {
      try {
        const form = new FormData()
        form.append("play_result[normal_voice]", this.normalForm)
        form.append("play_result[boin_voice]", this.boinForm)
        form.append("play_result[practiced_sentence]", this.normalSentence)
        form.append("play_result[practiced_normal]", this.normalRecognition)
        form.append("play_result[practiced_boin]", this.boinRecognition)
        form.append("play_result[judge]", this.judge)
        form.append("play_result[score]", this.score)
        form.append("play_result[user_id]", this.users.id)

        await this.$axios.post('play_results', form,{
          headers: {
            'content-type': 'multipart/form-data',
            uid: this.users.uid,
            "access-token": this.users.token,
            client: this.users.client,
          },   
        })

        this.$store.dispatch(
          "message/showMessage",
          {
            message: "練習内容を保存しました。",
            type: "success",
            status: true,
          },
        )
        this.$router.push({ name: 'MyPageIndex' })
      }
      catch(error) {
        console.log(error)
      }
    },
    getLogin() {
      this.users.id = this['login/id']
      this.users.token = this['login/token']
      this.users.uid = this['login/uid']
      this.users.client = this['login/client']
    },
    getPracticeResult() {
      this.normalSentence = this['practice/normalSentence']
      this.boinSentence = this['practice/boinSentence']
      this.boinVoice.url = this['practice/boinVoice']
      this.normalVoice.url = this['practice/normalVoice']
      this.boinRecognition = this['practice/boinRecognition']
      this.normalRecognition = this['practice/normalRecognition']
      this.boinForm = this['practice/boinForm']
      this.normalForm = this['practice/normalForm']
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
<template>
  <v-container 
    fill-height 
    fluid
  >
    <v-row
      justify="center"
    >
      <v-col
        cols="9"
      >
        <div
          class="py-4"
        >
          <h1
            class="white--text"
          >
            Step.3 母音法で練習
          </h1>
        </div>
        <div
          class="white--text font-weight-bold pb-5"
        >
          母音の文章を<span class="red--text">しっかり・ゆっくり</span>発音した後に普通の文章を録音してみましょう!
        </div>
        <v-card
          class="mb-3"
          elevation="20"
        >
          <v-card-title
            class="red lighten-1"
          >
            <h3 class="white--text">
              母音の文章
            </h3>
          </v-card-title>
          <v-divider />
          <div
            class="text-h2 text-center py fc"
          >
            {{ sentence.boin }}
          </div>
        </v-card>
        <v-card
          class="mb-15"
          elevation="20"
        >
          <v-card-title
            class="red lighten-1"
          >
            <h3 class="white--text">
              普通の文章
            </h3>
          </v-card-title>
          <v-divider />
          <div
            class="text-h2 text-center py fc"
          >
            {{ sentence.normal }}
          </div>
        </v-card>
        <v-row
          justify="center"
          class="mb-4"
        >
          <v-btn
            v-if="status==='init' || 'recording'"
            :loading="status==='recording'"
            :disabled="status === 'recorded'"
            fab
            dark
            x-large
            class="red lighten-1"
            @click="startRecording"
          >
            <v-icon>mdi-microphone</v-icon>
          </v-btn>
        </v-row>
        <v-row
          justify="center"
        >
          <div 
            class="white--text text-h6 pb-5 font-weight-bold"
          >
            {{ recordingText }}
          </div>
        </v-row>
        <v-row
          justify="center"
        >
          <div>
            <v-btn
              v-if="status === 'recorded'"
              color="error"
              class="mb-5"
              x-large
              rounded
              @click.stop="PracticeResult"
            >
              結果を見る!
            </v-btn>
            <v-dialog
              v-model="dialog"
              transition="dialog-bottom-transition"
              max-width="auto"
            >
              <ThePracticeResult />
            </v-dialog>
          </div>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
import ThePracticeResult from 'components/result/ThePracticeResult.vue'

export default {
  name: "BoinPractice",
  components:  {
    ThePracticeResult
  },
  data () {
    return {
      sentence: [],
      status: 'init',
      recorder: null,
      audioData: [],
      boinVoice: { url: ''},
      recognition: null,
      boinRecognition: null,
      recordingText: '',
      boinRecognitionToHiragana: [],
      normalRecognition: null,
      dialog: false
    }
  },
  watch: {
    // 音声認識にデータが代入されたタイミングでひらがなに変換する
    boinRecognition:function() {
      const APIKEY = process.env.VUE_APP_HIRAGANA_KEY
      const BASE_URL = process.env.VUE_APP_API_URL
      const SENTENCE = this.boinRecognition;
      const OUTPUT_TYPE = 'hiragana';

      const options = {
        method: 'post',
        url: BASE_URL,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Content-Type': 'application/json'
        },
        data: {
          app_id: APIKEY,
          sentence: SENTENCE,
          output_type: OUTPUT_TYPE
        }
      };

      this.$axios(options)
        .then(res => {
          this.boinRecognitionToHiragana = res.data
          this.$store.commit('practice/setBoinRecognition', this.boinRecognitionToHiragana.converted )
        })
        .catch(err => console.log(err.status));

    }},
  mounted() {
    this.fetchSentences();
    this.normalRecognition = this.$store.getters['practice/normalRecognition']
    // マイク許可
    navigator.mediaDevices.getUserMedia({ audio: {
      echoCancellation: true,
      echoCancellationType: 'system',
      noiseSuppression: false
    }})
      .then(stream => {
        this.recorder = new MediaRecorder(stream);
        this.recognition = new webkitSpeechRecognition(stream);
        this.recognition.lang = 'ja';

        this.recorder.addEventListener('dataavailable', e => {

          this.audioData.push(e.data);

        });

        this.recorder.addEventListener('stop', () => {
            
          this.recordingText='録音完了!';
          const audioBlob = new Blob(this.audioData);
          const url = URL.createObjectURL(audioBlob);
          this.boinVoice.url = url; 
          this.$store.commit('practice/setBoinForm', audioBlob)
          this.$store.commit('practice/setBoinVoice', this.boinVoice.url )

        });

        this.recognition.onresult = (event) => {

          if (event.results.length > 0) {
            this.boinRecognition = event.results[0][0].transcript;
      
          }

        };

        this.recorder.addEventListener('start', () => {
            
          this.recordingText = '録音中..(終了まであと5秒)';
          let sec = 4;
          let countDownTime =  setInterval( () => {
            let remainingTime = sec--;
            this.recordingText = '録音中..(終了まであと'+remainingTime+'秒)';
            if( sec === 0 ){
              clearInterval(countDownTime);
            }
          }, 1000);
          setTimeout( () => {
            this.stopRecording();
          }, 5000);
        });
      });
  },
  methods: {
    async fetchSentences() {
      try {
        const res = await this.$axios.get('/api/modes/' + this.$route.params.mode_id + '/selects/' + this.$route.params.id)
        this.sentence = res.data
        this.$store.commit('practice/setNormalSentence', this.sentence.normal)
        this.$store.commit('practice/setBoinSentence', this.sentence.boin)         
      }
      catch(error) {
        console.log(error)
      }
    },
    // 録音開始
    startRecording() {

      this.status = 'recording';
      this.audioData = [];
      this.recorder.start();
      this.recognition.start();
    },
    // 録音停止
    stopRecording() { 

      this.status = 'recorded';
      this.recorder.stop();
      this.recognition.stop();
    },
    PracticeResult(){

      if(this.normalRecognition && this.boinRecognition !== null) {
        this.dialog = true
      }
      else {
        this.$router.push({ name: 'ModeIndex' })
        this.$store.dispatch(
          "message/showMessage",
          {
            message: "音声をうまく認識できませんでした....もう一度練習してみよう",
            type: "error",
            status: true,
          }
        )
      }  
    }
  }
}
</script>
<style scoped>
.py {
  padding: 35px 0px 35px 0px; 
}
.fc {
  color: #424242;
}
</style>
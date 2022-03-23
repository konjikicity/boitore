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
          <v-card-title>
            <h3 class="white--text">
              母音の文章
            </h3>
          </v-card-title>
          <v-divider />
          <div
            class="text-h2 text-center py"
          >
            {{ sentence.boin }}
          </div>
        </v-card>
        <v-card
          class="mb-15"
          elevation="20"
        >
          <v-card-title>
            <h3 class="white--text">
              普通の文章
            </h3>
          </v-card-title>
          <v-divider />
          <div
            class="text-h2 text-center py"
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
            color="error"
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
        <v-row>
          <PracticeResult 
            v-if="status === 'recorded'"
            :normal-sentence="sentence.normal"
          />
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
import PracticeResult from 'components/result/PracticeResult.vue'

export default {
  name: "BoinPractice",
  components:  {
    PracticeResult
  },
  data () {
    return {
      sentence: [],
      status: 'init',
      recorder: null,
      audioData: [],
      audioExtension: '',
      boinVoice: { url: ''},
      recognition: null,
      boinRecognition: '',
      recordingText: '',
      boinRecognitionToHiragana: []
    }
  },
  watch: {
    boinRecognition:function() {
      const APIKEY = 'a58867b205dbef9f181c87b274754847752eefdb3d35ae27d19e92cdee2dabf5';
      const BASE_URL = 'https://labs.goo.ne.jp/api/hiragana';
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
          sessionStorage.setItem('setBoinRecognition',this.boinRecognitionToHiragana.converted);
        })
        .catch(err => console.log(err.status));
         
    }},
  created () {
    this.fetchSentences();
    
  },
  mounted() {
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
          this.audioExtension = this.getExtension(e.data.type);

        });
        this.recorder.addEventListener('stop', () => {
            
          this.recordingText='録音完了!';
          const audioBlob = new Blob(this.audioData);
          const url = URL.createObjectURL(audioBlob);
          this.boinVoice.url = url; 
          sessionStorage.setItem('setBoin',this.boinVoice.url);

        });
        this.recognition.onresult = (event) => {
          if (event.results.length > 0) {
            this.boinRecognition = event.results[0][0].transcript;
            sessionStorage.setItem('setBoinRecognition',this.boinRecognition);

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
            };
          }, 1000);
          setTimeout( () => {
            this.stopRecording();
          }, 5000);
        });
      });
  },
  methods: {
    fetchSentences() {
      this.$axios.get('/modes/' + this.$route.params.mode_id + '/selects/' + this.$route.params.id)



        .then(res => this.sentence = res.data)
        .catch(err => console.log(err.status));

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
    // 拡張子を正規表現を使って必要な部分だけ抜き出す
    getExtension(audioType) {

      let extension = 'wav';
      const matches = audioType.match(/audio\/([^;]+)/);

      if(matches) {

        extension = matches[1];

      }

      return '.'+ extension;

    }
  }
}
</script>
<style scoped>
.v-card__title {
  background-color: #EF5350;
}
.py {
  padding: 35px 0px 35px 0px; 
}
</style>
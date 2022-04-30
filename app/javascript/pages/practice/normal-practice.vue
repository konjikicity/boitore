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
            Step.2 通常練習
          </h1>
        </div>
        <div
          class="white--text font-weight-bold pb-5"
        >
          まずは普通の文章を録音してみましょう!
        </div>
        <v-card 
          elevation="20"
        >
          <v-card-title>  
            <h3 class="white--text">
              普通の文章
            </h3>
          </v-card-title>
          <v-divider />
          <div
            class="text-h2 py text-center"
          >
            {{ sentence.normal }}
          </div>
        </v-card>
        <v-row
          justify="center"
        >
          <v-btn
            v-if="status === 'init' || 'recording'"
            :disabled="status === 'recorded'"
            :loading="status ==='recording'"
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
            class="white--text py-5 text-h6 font-weight-bold"
          >
            {{ recordingText }}
          </div>
        </v-row>
        <v-row
          justify="center"
        >
          <v-btn
            v-if="status=== 'recorded'"
            :to="{ name: 'BoinPractice', params: { id: sentence.id, mode_id: sentence.mode_id }}"
            color="error"
            class="my-10"
            x-large
          >
            母音法で練習する!   
          </v-btn>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>

export default {
  name: "NormalPractice",

  data () {
    return {
      sentence: [],
      status: 'init',     
      recorder: null,     
      audioData: [],      
      audioExtension: '', 
      normalVoice: { url: ''},
      recognition: null,
      normalRecognition: '',
      normalRecognitionToHiragana: [],
      recordingText: '',
      normalForm: ''
    }
  },
  watch: {
    // 音声認識にデータが代入されたタイミングでひらがなに変換する
    normalRecognition:function() {
      const APIKEY = process.env.VUE_APP_HIRAGANA_KEY
      const BASE_URL = process.env.VUE_APP_API_URL
      const SENTENCE = this.normalRecognition;
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
      console.log(options)

      this.$axios(options)
        .then(res => {
          this.normalRecognitionToHiragana = res.data
          this.$store.commit('practice/setNormalRecognition', this.normalRecognitionToHiragana.converted )
        })
        .catch(err => console.log(err.status));
         
    }},
  created() {
    this.fetchSentences();
  },
  mounted() {
    //マイク許可
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

          this.recordingText= '録音完了!';
          const audioBlob = new Blob(this.audioData, { type: 'audio/wav' });
          const url = URL.createObjectURL(audioBlob);
          this.normalVoice.url = url;
          this.$store.commit('practice/setNormalForm', audioBlob)
          this.$store.commit('practice/setNormalVoice', this.normalVoice.url )
          
        });
        this.recognition.onresult = (event) => {
          if (event.results.length > 0) {
            this.normalRecognition = event.results[0][0].transcript;

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
      this.$axios.get('/api/modes/' + this.$route.params.mode_id + '/selects/' + this.$route.params.id)



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
    
      this.recorder.stop();
      this.recognition.stop();
      this.status = 'recorded';

    },
  }
}
</script>
<style scoped>
.py {
  padding: 80px 0;
}
.mb {
  margin-bottom: 60px;
}
.v-card {
  margin-bottom: 50px;
}
.v-card__title {
  background-color: #EF5350;
}
</style>
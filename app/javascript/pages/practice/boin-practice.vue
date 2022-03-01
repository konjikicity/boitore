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
            母音法で練習
          </h1>
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
          <v-btn 
            v-if="status === 'recording'" 
            transition
            fab
            dark
            x-large
            class="ml-5"
            color="error"
            @click="stopRecording"
          >
            <v-icon>
              mdi-square
            </v-icon>
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
         status: 'init',     // 状況
         recorder: null,     // 音声にアクセスする "MediaRecorder" のインスタンス
         audioData: [],      // 入力された音声データ
         audioExtension: '', // 音声ファイルの拡張子
         boinVoice: { url: ''},
         recognition: null,
         boinRecognition: '',
         recordingText: ''
      }
  },
  created () {
    this.fetchSentences();
    
  },
  mounted() {
     navigator.mediaDevices.getUserMedia({ audio: {
       
       echoCancellation: true,
       echoCancellationType: 'system',
       noiseSuppression: false
     }})
      .then(stream => {

        this.recorder = new MediaRecorder(stream);
        this.recognition = new webkitSpeechRecognition(stream);
        this.recorder.addEventListener('dataavailable', e => {

            this.audioData.push(e.data);
            this.audioExtension = this.getExtension(e.data.type);

        });
        this.recorder.addEventListener('stop', () => {

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


      });
  },
  methods: {
   fetchSentences() {
      this.$axios.get('selects/' + this.$route.params.id)



        .then(res => this.sentence = res.data)
        .catch(err => console.log(err.status));

    },
    startRecording() {

    this.status = 'recording';
    this.recordingText='録音中...';
    this.audioData = [];
    this.recorder.start();
    this.recognition.start();

    },
    stopRecording() { 

    this.status = 'recorded';
    this.recordingText='録音完了!';
    this.recorder.stop();
    this.recognition.stop();
    

    },
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
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
          class="py-14"
        >
          <h1
            class="white--text"
          >
            通常練習
          </h1>
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
            :loading="status==='recording'"
            fab
            dark
            x-large
            color="error"
            @click="startRecording"
          >
            <v-icon>mdi-microphone</v-icon>
          </v-btn>
        </v-row>
        <v-btn 
          :disabled="status === 'init'" 
          class="mx-2"
          fab
          dark
          x-large
          color="error"
          @click="stopRecording"
        >
          <v-icon>
            mdi-square
          </v-icon>
        </v-btn>
        <v-row
          justify="center"
        >
          <v-btn
            :to="{ name: 'BoinPractice', params: { id: $route.params.id }}"
            color="error"
            class="mb-10"
          >
            次の練習へ    
          </v-btn>
        </v-row>
       
        <v-layout
          v-if="audioData.length > 0"
          column
          wrap
        >
          <h4 class="mt-3">
            Recordings
          </h4>
          <v-card>
            <v-card-title primary-title>
              <v-layout
                column
                wrap
              >
                <div class="ml-3">
                  <div>
                    <audio
                      :src="normalVoice.url"
                      controls
                    />
                  </div>
                </div>
              </v-layout>
            </v-card-title>
          </v-card>
        </v-layout>
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
        status: 'init',     // 状況
        recorder: null,     // 音声にアクセスする "MediaRecorder" のインスタンス
        audioData: [],      // 入力された音声データ
        audioExtension: '', // 音声ファイルの拡張子
        normalVoice: { url: ''}  
      }
  },
  created () {
    this.fetchSentences();
  },
    mounted() {
      navigator.mediaDevices.getUserMedia({ audio: true })
      .then(stream => {

        this.recorder = new MediaRecorder(stream);
        this.recorder.addEventListener('dataavailable', e => {

            this.audioData.push(e.data);
            this.audioExtension = this.getExtension(e.data.type);

        });
        this.recorder.addEventListener('stop', () => {

            const audioBlob = new Blob(this.audioData);
            const url = URL.createObjectURL(audioBlob);
            this.normalVoice.url = url;

        });

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
    this.audioData = [];
    this.recorder.start();

    },
    stopRecording() {

    this.recorder.stop();
    this.status = 'ready';

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
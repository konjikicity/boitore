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
          class="py-10"
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
            class="text-h2 text-center py-14"
          >
            {{ sentence.boin }}
          </div>
        </v-card>
        <v-card
          class="mb-5"
          elevation="20"
        >
          <v-card-title>
            <h3 class="white--text">
              普通の文章
            </h3>
          </v-card-title>
          <v-divider />
          <div
            class="text-h2 text-center py-14"
          >
            {{ sentence.normal }}
          </div>
        </v-card>
        <v-row
          justify="center"
        >
          <v-btn 
            :loading="status==='NowRecording'"
            fab
            dark
            x-large
            color="error"
            class="mt-5"
            @click="startRecording"
          >
            <v-icon>mdi-microphone</v-icon>
          </v-btn>
        </v-row>
        <v-btn 
          :disabled="status === 'init'" 
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
          <PracticeResult />
        </v-row>
        <v-layout
          v-if="recordings.length > 0"
          column
          wrap
        >
          <h4 class="mt-3">
            Recordings
          </h4>
          <div
            v-for="(recording,idx) in recordings"
            :key="recording.ts"
          >
            <v-card>
              <v-card-title primary-title>
                <v-layout
                  column
                  wrap
                >
                  <div class="ml-3">
                    <div>
                      <audio
                        :src="recording.blobUrl"
                        controls="true"
                      />
                    </div>
                  </div>
                </v-layout>
              </v-card-title>
            </v-card>
            <v-divider v-if="idx !== (recordings.length-1)" />
          </div>
        </v-layout>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
import PracticeResult from 'components/result/PracticeResult.vue'
import RecorderService from '../../plugins/RecorderService'
import utils from '../../plugins/Utils'

export default {
  name: "BoinPractice",
  components:  {
    PracticeResult
  },
  filters: {
    fileSizeToHumanSize (val) {
      return utils.humanFileSize(val, true)
    }
  },
  data () {
      return {
        sentence: [],
        status: 'init',
        supportedMimeTypes: [],
        recordings: [],
        cleanupWhenFinished: true,
        addNoise: false,
        numAudioSamples: 0
      }
  },
  created () {
    this.fetchSentences();
    this.recorderSrvc = new RecorderService()
    this.recorderSrvc.em.addEventListener('recording', (evt) => this.onNewRecording(evt))
    this.recorderSrvc.em.addEventListener('onaudioprocess', (evt) => this.onAudioProcess(evt))
    this.recorderSrvc.config.broadcastAudioProcessEvents = true
  },
  methods: {
   fetchSentences() {
      this.$axios.get('selects/' + this.$route.params.id)



        .then(res => this.sentence = res.data)
        .catch(err => console.log(err.status));

    },
    startRecording () {
      this.numAudioSamples = 0
      this.recorderSrvc.startRecording()
        .then(() => {
          this.status = 'NowRecording'
        })
        .catch((error) => {
          console.error('Exception while start recording: ' + error)
          alert('Exception while start recording: ' + error.message)
        })
    },
     stopRecording () {
      this.recorderSrvc.stopRecording()
      this.status = 'recorded'
    },
        onAudioProcess (e) {
      this.numAudioSamples++
      let inputBuffer = e.detail.inputBuffer
      let outputBuffer = e.detail.outputBuffer
      for (let channel = 0; channel < outputBuffer.numberOfChannels; channel++) {
        let inputData = inputBuffer.getChannelData(channel)
        let outputData = outputBuffer.getChannelData(channel)
        // Each sample
        for (let sample = 0; sample < inputBuffer.length; sample++) {
          if (this.addNoise) {
            outputData[sample] = (inputData[sample] + (Math.random() * 0.02))
          }
          else {
            outputData[sample] = inputData[sample]
          }
        }
      }
    },
    onNewRecording (evt) {
      this.recordings.push(evt.detail.recording)
    }

    
  }
}
</script>
<style scoped>
.v-card__title {
  background-color: #EF5350;
}

</style>
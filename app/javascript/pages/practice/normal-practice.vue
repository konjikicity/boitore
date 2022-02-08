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
        <div>
          <h1
            class="py-14"
          >
            通常練習
          </h1>
        </div>
        <v-card 
          elevation="20"
        >
          <v-card-title
            class="justify-center"
          >
            <div
              class="text-h2 py"
            >
              {{ sentence.normal }}
            </div>
          </v-card-title>
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
import RecorderService from '../../plugins/RecorderService'
import utils from '../../plugins/Utils'

export default {
  name: "NormalPractice",
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
.py {
  padding: 80px 0;
}
.mb {
  margin-bottom: 60px;
}
.v-card {
  margin-bottom: 50px;
}
</style>
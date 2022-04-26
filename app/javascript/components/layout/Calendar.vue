<template>
  <div>
    <v-sheet
      tile
      height="6vh"
      color="red lighten-1"
      class="d-flex align-center"
    >
      <v-btn
        outlined
        small
        class="ma-4 white--text"
        @click="setToday"
      >
        今日
      </v-btn>
      <v-btn
        icon
        @click="$refs.calendar.prev()"
      >
        <v-icon
          class="white--text"
        >
          mdi-chevron-left
        </v-icon>
      </v-btn>
      <v-btn
        icon
        @click="$refs.calendar.next()"
      >
        <v-icon
          class="white--text"
        >
          mdi-chevron-right
        </v-icon>
      </v-btn>
      <v-toolbar-title
        class="white--text font-weight-bold"
      >
        {{ title }}
      </v-toolbar-title>
    </v-sheet>
    <v-sheet height="73vh">
      <v-calendar
        ref="calendar"
        v-model="value"
        :events="events"
        :event-color="getEventColor"
        locale="ja-jp"
        :day-format="(timestamp) => new Date(timestamp.date).getDate()"
        :month-format="(timestamp) => (new Date(timestamp.date).getMonth() + 1) + ' /'"
        dark
        @change="getEvents"
        @click:date="viewDay" 
        @click:event="showEvent"
      />
      <v-row justify="center">
        <v-dialog
          v-model="selectedOpen"
          :close-on-content-click="false"
          :activator="selectedElement"
          offset-x
          max-width="60vw"
        >
          <v-card
            color="grey lighten-4"
            flat
          >
            <v-toolbar
              :color="selectedEvent.color"
              dark
            >
              <v-toolbar-title>
                {{ selectedEvent.name }}
              </v-toolbar-title>
              <div
                class="pl-15"
              >
                {{ selectedEvent.start }}
              </div>
            </v-toolbar>
            <v-simple-table>
              <template v-slot:default>
                <tbody>
                  <tr>
                    <th>音声認識(通常練習)</th>
                    <td>{{ selectedEvent.practiced_normal }}</td>
                  </tr>
                  <tr>
                    <th>音声認識(母音法後の練習)</th>
                    <td>{{ selectedEvent.practiced_boin }}</td>
                  </tr>
                  <tr>
                    <th>得点</th>
                    <td>{{ selectedEvent.score }}</td>
                  </tr>
                  <tr>
                    <th>評価</th>
                    <td>{{ selectedEvent.judge }}</td>
                  </tr> 
                  <tr>
                    <th>通常練習の音声</th>
                    <td>
                      <audio
                        :src="selectedEvent.normal_voice"
                        controls
                      />
                    </td>
                  </tr>
                  <tr>
                    <th>母音法後の音声</th>
                    <td>
                      <audio
                        :src="selectedEvent.normal_voice"
                        controls
                      />
                    </td>
                  </tr>
                </tbody>
              </template>
            </v-simple-table>
          </v-card>
        </v-dialog>
      </v-row>
    </v-sheet>
  </div>
</template>

<script>
import moment from 'moment'

export default {
  name: 'Calender',
  data(){
    return {
      events: [],
      value: moment().format('yyyy-MM-DD'),
      uid: null,
      token: null,
      client: null,
      play_results: [],
      dialog: false,
      selectedEvent: {},
      selectedElement: null,
      selectedOpen: false,
    }
  },
  computed: {
    title() {
      return moment(this.value).format('yyyy年 M月')
    }
  },
  mounted() {
    this.fetchPlayResults();

  },
  created() {
    this.name = this.$store.getters['login/name']
    this.uid = this.$store.getters['login/uid']
    this.token = this.$store.getters['login/token']
    this.client = this.$store.getters['login/client']
  },
  methods: {
    getEvents() {
      let i = 0;
      const events = [];
      for (let i = 0; i < this.play_results.length; i++) {
        const first =  moment(this.play_results[i].created_at).format('yyyy-MM-DD-HH:mm');
        const name = this.play_results[i].practiced_sentence
        const practiced_normal = this.play_results[i].practiced_normal
        const practiced_boin = this.play_results[i].practiced_boin
        const normal_voice = this.play_results[i].normal_voice
        const boin_voice = this.play_results[i].boin_voice
        const score = this.play_results[i].score
        const judge = this.play_results[i].judge
        events.push({
          name: name,
          start: first,
          color: 'red lighten-1',
          practiced_normal: practiced_normal,
          practiced_boin: practiced_boin,
          normal_voice: normal_voice,
          boin_voice: boin_voice,
          score: score,
          judge: judge
        }); 
       
      }
      console.log(events)
      this.events = events
    },
    setToday () {
      this.value = moment().format('yyyy-MM-DD')
    },
    getEventColor(event) {
      return event.color;
    },
    viewDay({ date }) {
      alert(`date: ${date}`);
    },
    fetchPlayResults() {
      this.$axios.get('/play_results', {
        headers: {
          uid: this.uid,
          "access-token": this.token,
          client: this.client,
        },
      })
        .then(res => {
          console.log(res.data);
          this.play_results = res.data;
          this.getEvents();
        })
        .catch(err => console.log(err.status));
    },
    showEvent ({ nativeEvent, event }) {
      const open = () => {
        this.selectedEvent = event
        console.log(event)
        this.selectedElement = nativeEvent.target
        requestAnimationFrame(() => requestAnimationFrame(() => this.selectedOpen = true))
      }

      if (this.selectedOpen) {
        this.selectedOpen = false
        requestAnimationFrame(() => requestAnimationFrame(() => open()))
      } else {
        open()
      }

      nativeEvent.stopPropagation()
    },
  },
};
</script>
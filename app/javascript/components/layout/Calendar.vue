<template>
  <div>
    <v-sheet tile height="6vh" color="grey lighten-3" class="d-flex align-center">
    <v-btn outlined small class="ma-4" @click="setToday">
+       今日
+     </v-btn>
      <v-btn icon @click="$refs.calendar.prev()">
        <v-icon>mdi-chevron-left</v-icon>
      </v-btn>
      <v-btn icon @click="$refs.calendar.next()">
        <v-icon>mdi-chevron-right</v-icon>
      </v-btn>
      <v-toolbar-title>{{ title }}</v-toolbar-title>
    </v-sheet>
    <v-sheet height="73vh">
      <v-calendar
        ref="calendar"
        :events="events"
        :event-color="getEventColor"
        @change="getEvents"
        v-model="value"
        locale="ja-jp"
        :day-format="(timestamp) => new Date(timestamp.date).getDate()"
        :month-format="(timestamp) => (new Date(timestamp.date).getMonth() + 1) + ' /'"
        @click:event="showEvent"
        @click:date="viewDay"
        dark
      ></v-calendar>
    </v-sheet>
  </div>
</template>

<script>
import moment from 'moment'

export default {
  data: () => ({
    events: [],
    value: moment().format('yyyy-MM-DD')
  }),
  computed: {
    title() {
      return moment(this.value).format('yyyy年 M月')
    }
  },
  methods: {
    getEvents() {
      const events = [
        {
          name: '会議',
          start: new Date('2023-05-03T01:00:00'), 
          end: new Date('2020-05-03T02:00:00'), 
          color: 'blue',
          timed: true, 
        },
      ];
      this.events = events;
    },
     setToday () {
       this.value = moment().format('yyyy-MM-DD')
  },
    getEventColor(event) {
      return event.color;
    },
    showEvent({ event }) {
      alert(`clicked ${event.name}`);
 },
  viewDay({ date }) {
  alert(`date: ${date}`);
  },
  },
};
</script>
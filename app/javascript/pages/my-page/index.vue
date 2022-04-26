<template>
  <v-container>
    <v-row>
      <v-col cols="3">
        <v-sheet rounded="lg">
          <v-list color="transparent">
            <v-list-item
              link
              color="grey lighten-4"
            >
              <v-list-item-content>
                <v-list-item-title>
                  <v-avatar
                    class="mb-4"
                    color="grey darken-1"
                    size="64"
                  />
                  <div>{{ name }}</div>
                  <div>{{ uid }}</div>
                </v-list-item-title>
              </v-list-item-content>
            </v-list-item>

            <v-divider class="my-2" />
            <v-list-item
              v-for="(item, i) in items"
              :key="i"
              link
              @click="triggerClick(item.action)"
            >
              <v-list-item-icon>
                <v-icon v-text="item.icon" />
              </v-list-item-icon>
              <v-list-item-content>
                <v-list-item-title v-text="item.text" />
              </v-list-item-content>
            </v-list-item>
          </v-list>
        </v-sheet>
      </v-col>

      <v-col>
        <v-sheet
          height="70vh"
          rounded="lg"
        >
          <ResultTable 
            v-show="ChangeSheet === true"
          />
          <Calendar
            v-show="ChangeSheet === false"
          />
        </v-sheet>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import Calendar from'../../components/layout/Calendar'
import ResultTable from '../../components/layout/ResultTable'

export default {
  name: 'MyPageIndex',
  components: {
    Calendar,
    ResultTable
  },
  data(){
    return {
      name: null,
      uid: null,
      items: [ 
        { text: 'カレンダー', icon: 'mdi-calendar', action: "OpenCalendar" },
        { text: '練習履歴', icon: 'mdi-clock', action: "OpenHistory" }
      ],
      ChangeSheet: false
    }
  },
  created() {
    this.name = this.$store.getters['login/name']
    this.uid = this.$store.getters['login/uid']
  },
  methods: {
    triggerClick(action) {
      if (action === 'OpenHistory') {
        this.anyHistory()
      } else if (action === 'OpenCalendar') {
        this.anyCalendar()
      }
    },
    anyHistory() {
      this.ChangeSheet = true  
    },
    anyCalendar() {
      this.ChangeSheet = false  
    }
   
  }
}
</script>
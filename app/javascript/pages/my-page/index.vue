<template>
  <v-container>
    <v-row>
      <v-col cols="3">
        <v-sheet
          rounded="lg"
          class="pb-4"
        >
          <v-toolbar
            color="grey darken-2"
            rounded="lg"
            class="rounded-b-0"
          >
            <v-toolbar-title
    
              class="white--text font-weight-bold"
            >
              MyPage
            </v-toolbar-title>
          </v-toolbar>
          <v-list-item
            v-for="(item, i) in items"
            :key="i"
            link
            class="pt-4"
            @click="triggerClick(item.action)"
          >
            <v-list-item-icon>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title v-text="item.text" />
            </v-list-item-content>
          </v-list-item>
        </v-sheet>
      </v-col>

      <v-col>
        <v-sheet
          height="70vh"
          rounded="lg"
        >
          <TheResultTable 
            v-show="ChangeSheet === true"
          />
          <TheCalendar
            v-show="ChangeSheet === false"
          />
        </v-sheet>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
const  TheCalendar  = () => import('../../components/calendar/TheCalendar');
const  TheResultTable  = () => import('../../components/calendar/TheResultTable');
import { mdiCalendar } from '@mdi/js'
import { mdiClock } from '@mdi/js'

export default {
  name: 'MyPageIndex',
  components: {
    TheCalendar,
    TheResultTable
  },
  data(){
    return {
      items: [ 
        { text: 'カレンダー', icon: mdiCalendar, action: "OpenCalendar" },
        { text: '練習履歴', icon: mdiClock, action: "OpenHistory" }
      ],
      ChangeSheet: false
    }
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
<style scoped>
.block {
  display: block;
}
</style>
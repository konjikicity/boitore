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
              v-for="link in links"
              :key="link.index"
              link
            >
              <v-list-item-content>
                <v-list-item-title>
                  {{ link }}
                </v-list-item-title>
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
          <Calendar />
        </v-sheet>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import Message from '../../components/layout/Message'
import Calendar from'../../components/layout/Calendar'

export default {
  name: 'MyPageIndex',
  components: {
    Calendar,
  },
  data(){
    return {
      name: null,
      uid: null,
      links: [
        '練習一覧',
        'カレンダー',
      ],
    }
  },
  created() {
    this.name = this.$store.getters['login/name']
    this.uid = this.$store.getters['login/uid']
  }
}
</script>
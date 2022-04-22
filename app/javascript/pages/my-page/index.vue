<template>
      <v-container
      >
        <v-row>
          <v-col cols="2">
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
        ></v-avatar>
        <div>{{ name }}</div>
        <div>{{ uid }}</div>


                    </v-list-item-title>
                  </v-list-item-content>
                </v-list-item>
                <v-divider class="my-2"></v-divider>
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
              height="73vh"
              rounded="lg"
            >
               <Calendar />
            </v-sheet>
          </v-col>
        </v-row>
      </v-container>
  </v-app>
</template>

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
      token: null,
      client: null,
      play_results: [],
      links: [
        '練習一覧',
        'カレンダー',
      ],
    }
  },
  created() {
    this.name = this.$store.getters['login/name']
    this.uid = this.$store.getters['login/uid']
    this.token = this.$store.getters['login/token']
    this.client = this.$store.getters['login/client']
  },
  mounted() {
    this.fetchPlayResults();
  },
  methods: {
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
        })
        .catch(err => console.log(err.status));
    }
  }
}
</script>
<template>
  <v-container 
    fill-height 
    fluid
  >
    <v-row
      justify="center"
    >
      <v-card
        width="800px"
        class="mx-auto mt-5"
      >
        <v-card-title>
          <h1 class="display-1">
            MyPage
          </h1>
        </v-card-title>
        <div>
          <p>こんにちは、{{ name }}さん</p>
        </div>
        <ul v-for="play_result in play_results" :key="play_result.id">
        <li>
         {{ play_result.practiced_sentence }}
        </li>
        
      </ul>
      </v-card>
    </v-row>
  </v-container>
</template>
<script>
import Message from '../../components/layout/Message'
export default {
  name: 'MyPageIndex',
  data(){
    return {
      name: null,
      uid: null,
      token: null,
      client: null,
      play_results: []
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
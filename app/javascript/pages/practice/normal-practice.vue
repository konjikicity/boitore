<template>
  <v-container 
    fill-height 
    fluid
  >
    <v-row
      justify="center"
      align-content="center"
    >
      <v-col
        cols="9"
      >
        <div>
          <h1
            class="mb-16"
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
        justify="center">
        <v-btn
          :to="{ name: 'BoinPractice', params: { id: $route.params.id }}"
          color="error"
        >
            次の練習へ    
        </v-btn>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
export default {
  name: "NormalPractice",
  data () {
      return {
        sentence: []
      }
  },
  created () {
    this.fetchSentences();
  },
  methods: {
   fetchSentences() {
      this.$axios.get('selects/' + this.$route.params.id)



        .then(res => this.sentence = res.data)
        .catch(err => console.log(err.status));

    }
  }
}
</script>
<style scoped>
.py {
  padding: 80px 0;
}
.v-card {
  margin-bottom: 100px;
}
</style>
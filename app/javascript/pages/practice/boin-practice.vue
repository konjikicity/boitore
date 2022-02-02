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
            class="py-10"
          >
            母音法で練習
          </h1>
        </div>
        <v-card
          class="mb-3"
          elevation="20"
        >
          <v-card-title>
            <h3>母音の文章</h3>
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
            <h3>通常の文章</h3>
          </v-card-title>
          <v-divider/>
          <div
            class="text-h2 text-center py-14"
          >
            {{ sentence.normal }}
          </div>
        </v-card>
        <div
          class="text-center"
        >
          <PracticeResult />
        </div>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
import PracticeResult from 'components/result/PracticeResult.vue'

export default {
  components:  {
    PracticeResult
  },
  name: "BoinPractice",
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

</style>
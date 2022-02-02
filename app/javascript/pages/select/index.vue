<template>
  <v-container
    fluid
    fill-height
  >
    <v-row
      justify="center"
      align-content="center"
    >
      <v-col
        cols="11"
      >
        <h1
          class="py-5"
        >
          文字の選択
        </h1>
        <v-carousel
          cycle
          hide-delimiter-background
          height="400"
        >
          <template v-slot:prev="{ on, attrs }">
            <v-btn
              color="error"
              v-bind="attrs"
              v-on="on"
            >
              前の文章
            </v-btn>
          </template>
          <template v-slot:next="{ on, attrs }">
            <v-btn
              color="error"
              v-bind="attrs"
              v-on="on"
            >
              次の文章
            </v-btn>
          </template>
          <v-carousel-item
            v-for="sentence in sentences"
            :key="sentence.id"
          >
            <v-card
              elevation="20"
              height="100%"
          

            >
              <v-row
                class="fill-height"
                align="center"
                justify="center"
              >
                <router-link 
                  :to="{ name: 'NormalPractice', params: { id: sentence.id}}"
                >
                  <div class="text-h2">
                    {{ sentence.normal }}
                  </div>
                </router-link>
              </v-row>
            </v-card>
          </v-carousel-item>
        </v-carousel>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "SelectIndex",
  data () {
      return {
        sentences: []
      }
  },
  created () {
    this.fetchSentences();
  },
  methods: {
   fetchSentences() {
      this.$axios.get("selects")



        .then(res => this.sentences = res.data)
        .catch(err => console.log(err.status));

    }
  }
}
</script>

<style scoped>

</style>
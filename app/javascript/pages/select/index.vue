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
        <div
          class="py-5"
        >
          <h1
            class="white--text"
          >
            Step.1 文章の選択
          </h1>          
        </div>
        <div
          class="white--text font-weight-bold pb-5"
        >
          練習したい文章を選択しましょう!
        </div>
        <v-carousel
          hide-delimiter-background
          hide-delimiters
          height="400"
        >
          <template v-slot:prev="{ on, attrs }">
            <v-btn
              class="red lighten-1 font-weight-bold"
              v-bind="attrs"
              x-large
              rounded
              v-on="on"
            >
              前の文章
            </v-btn>
          </template>
          <template v-slot:next="{ on, attrs }">
            <v-btn
              class="red lighten-1 font-weight-bold"
              v-bind="attrs"
              x-large
              rounded
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
                  :to="{ name: 'NormalPractice', params: { id: sentence.id, mode_id: sentence.mode_id }}"
                >
                  <p>
                    {{ sentence.normal }}
                  </p>
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
  mounted (){
    this.fetchSentences();
  },
  methods: {
    async fetchSentences() {
      try {
        const res = await this.$axios.get( '/api/modes/' + this.$route.params.id + '/selects')
        this.sentences = res.data
      }
      catch(error) {
        console.log(error)
      }
    }
  }
}
</script>

<style  scoped>
.v-application a{
    text-decoration: none;
    color: #616161;
}
.v-application a:hover {
   color: #E57373;
   transition: 0.5s;
}
.v-application p {
  font-size: 80px;
  margin-bottom: 0px;
  
}
</style>
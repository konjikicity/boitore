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
            文字の選択
          </h1>
        </div>
        <v-carousel
          hide-delimiter-background
          height="400"
          class="rounded-lg"
        >
          <template v-slot:prev="{ on, attrs }">
            <v-btn
              color="error"
              v-bind="attrs"
              x-large
              v-on="on"
            >
              前の文章
            </v-btn>
          </template>
          <template v-slot:next="{ on, attrs }">
            <v-btn
              color="error"
              v-bind="attrs"
              x-large
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
  created () {
    this.fetchSentences();
    sessionStorage.removeItem('setNormal');
    sessionStorage.removeItem('setBoin');
    sessionStorage.removeItem('setNormalRecognition');
    sessionStorage.removeItem('setBoinRecognition');

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

<style  scoped>
.v-application a {
    color: #212121;
    text-decoration: none;
}
.v-application a:hover {
  color: #EF5350;
  transition: 0.5s;
}
.v-application p {
  font-size: 80px;
  margin-bottom: 0px;
  
}

</style>
<template>
  <v-container
    fluid
    fill-height
  >
    <div class="text-h3">
      <p>文字の選択</p>
    </div>
    <v-carousel
      cycle
      height="500"
      hide-delimiter-background
    >
      <template v-slot:prev="{ on, attrs }">
        <v-btn
          color="dark"
          v-bind="attrs"
          v-on="on"
        >
          前の文章
        </v-btn>
      </template>
      <template v-slot:next="{ on, attrs }">
        <v-btn
          color="dark"
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
        <v-sheet
          color="teal lighten-5"
          height="100%"
        >
          <v-row
            class="fill-height"
            align="center"
            justify="center"
          >
            <router-link 
              :to="{ name: 'NormalPractice', params: {id: Number(sentence.id), normal: String(sentence.normal), boin: String(sentence.boin)}}"
            >
              <div class="text-h2">
                {{ sentence.normal }}
              </div>
            </router-link>
          </v-row>
        </v-sheet>
      </v-carousel-item>
    </v-carousel>
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
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
      show-arrows-on-hover
      hide-delimiters
      class="rounded"
    >
      <template v-slot:prev="{ on, attrs }">
        <v-btn
          color="dark"
          v-bind="attrs"
          v-on="on"
        >
          Previous slide
        </v-btn>
      </template>
      <template v-slot:next="{ on, attrs }">
        <v-btn
          color="dark"
          v-bind="attrs"
          v-on="on"
        >
          Next slide
        </v-btn>
      </template>
      <v-carousel-item
        v-for="(sentence,i) in sentences"
        :key="i"
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
            <div class="text-h2">
              {{ sentence.normal }}
            </div>
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
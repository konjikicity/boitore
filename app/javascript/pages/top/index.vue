<template>
  <v-container
    fluid
    fill-height
  >
    <v-row
      justify="center"
    >
      <v-img 

        :src="srcTop"
        max-width="700"
        max-height="500"
        class="position"
      /> 
    </v-row>
    <v-row
      justify="center"
      class="mr pb-100"
    >
      <div>
        <v-btn
          class="mb-8"
          color="error"
          x-large
          dark
          rounded
          @click.stop="isPlay"
        >
          練習してみる！
        </v-btn>
        <v-dialog
          v-model="dialog"
          width="800"
        >
          <TheWarning />
        </v-dialog>
      </div>
    </v-row>
  </v-container>
</template>

<script>
import TheWarning from "components/shared/TheWarning"

export default {
  name: "TopIndex",
  components: {
    TheWarning
  },
  data() {
    return {
      dialog: false,
      srcTop: require("top.png")
    }
  },
  methods: {
    isPlay(){
      this.dialog = true
    }
  }
}
</script>

<style scoped>
.mr {
  margin: 0px 0px 20px 0px;
}
.v-card__title {
  background-color: #EF5350;
}
.pb-100 {
  padding-bottom: 100px;
}

</style>

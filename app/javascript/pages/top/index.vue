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
        max-width="600"
        max-height="550"
        class="position"
      /> 
    </v-row>
    <v-row
      justify="center"
      class="mr"
    >
      <div>
        <v-btn
          class="mb-8"
          color="error"
          x-large
          dark
          @click.stop="isPlay"
        >
          練習してみる！
        </v-btn>
        <v-dialog
          v-model="dialog"
          width="800"
        >
          <Warning />
        </v-dialog>
      </div>
    </v-row>
  </v-container>
</template>

<script>
import Warning from "components/layout/Warning"

export default {
  name: "TopIndex",
  components: {
    Warning
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

</style>

<template>
  <v-container
    fluid
    fill-height
  >
    <v-row
      align-content="center"
      justify="center"
    >
      <v-img
        src="https://res.cloudinary.com/dzlhvpfmo/image/upload/v1651544233/boi%E3%83%88%E3%83%AC/top_eyvzeg.webp"
        max-width="40vw"
        max-height="40vh"
      />
    </v-row>
    <v-row
      justify="center"
    >
      <v-btn
        class="mb-8 font-weight-bold"
        color="error"
        x-large
        dark
        style="text-transform: none"
        @click.stop="isPlay"
      >
        Start !
      </v-btn>
      <v-dialog
        v-model="dialog"
        width="800"
      >
        <TheWarning />
      </v-dialog>
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
.row+.row {
    margin: 0;
}
</style>

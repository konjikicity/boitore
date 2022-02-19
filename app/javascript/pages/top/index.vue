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
        max-width="800"
        max-height="500"
        class="position"
      /> 
    </v-row>
    <v-row
      justify="center"
      class="mr"
    >
      <v-btn
        to="/selects"
        color="error"
        dark
        x-large
        class="ml"
      >
        練習してみる！
      </v-btn>  
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "TopIndex",
  data() {
    return {
      srcTop: require("top.png")
    }
  }
}
</script>

<style scoped>
.mr {
  margin: 0px 0px 20px 0px;
}
</style>

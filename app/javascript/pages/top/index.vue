<template>
  <v-container
    fluid
    fill-height
  >
    <v-row justify="center">
      <v-col cols="auto">
        <v-img 
          max-height="500"
          max-width="500"
          src="../assets/top.png"
        />     
      </v-col>
    </v-row>
    <v-row justify="center">
      <v-col cols="auto">
        <v-btn
          to="/select"
          color="error"
          dark
          large
        >
          {{ start }}
        </v-btn>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "TopIndex",
  data() {
    return {
      start: "練習してみる！"   
    }
  }
}
</script>

<style scoped>

</style>

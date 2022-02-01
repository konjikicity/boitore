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
          練習してみる！
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
      
    }
  }
}
</script>

<style scoped>

</style>

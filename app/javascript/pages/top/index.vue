<template>
  <v-container
    fluid
    fill-height
  >
    <v-row
    justify="center"
    >
    <v-col
    cols="6"
    >
        <v-img 

          src="../assets/top.png"
          max-width="800"
          max-height="600"
          class="position"
        /> 
    </v-col>
    <v-col
    cols="6"
    class="d-flex align-center"
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
.position {
  left: 160px;
}
.ml {
  margin-left: 90px;
}
</style>

<template>
  <v-bottom-navigation v-model="value">
    <v-btn value="recent">
      <span>Recent</span>
    </v-btn>
 
    <v-btn value="favorites">
      <span>Favorites</span>      
    </v-btn>
 
    <v-btn value="nearby">
      <span>Nearby</span>      
    </v-btn>
  </v-bottom-navigation>
</template>

<script>
export default {
  data: function () {
    return {
      message: 'Hello Vue!'
    };
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>

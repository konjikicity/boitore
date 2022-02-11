<template>
  <v-app-bar
    color="grey darken-3"
    style="height: 70px"
    app
  >
    <v-img 
      max-height="200"
      max-width="200"
      :src="srcLogo"
    />
  </v-app-bar>
</template>

<script>
export default {
  name: "TheHeader",
  data() {
    return {
      srcLogo: require("boitore.png")
    }
  }
}
</script>

<style scoped>

</style>
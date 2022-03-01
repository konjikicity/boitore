<template>
  <v-app-bar
    color="grey darken-3"
    style="height: 70px"
    app
  >
    <v-img 
      max-height="150"
      max-width="150"
      :src="srcLogo"
    />
  </v-app-bar>
</template>

<script>
export default {
  name: "TheHeader",
  data() {
    return {
      srcLogo: require("logo.png")
    }
  }
}
</script>

<style scoped>

</style>
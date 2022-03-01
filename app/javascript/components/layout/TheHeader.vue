<template>
  <v-app-bar
    color="grey darken-3"
    style="height: 70px"
    app
  >
    <router-link
    :to="{ name: 'TopIndex'}"
    >
    <v-img 
      max-height="150"
      max-width="150"
      :src="srcLogo"
    />
    </router-link>
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
.v-image:hover {
  opacity: 0.8;
}

</style>
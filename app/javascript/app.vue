<template>
  <v-app :style="{ 'background-image': 'url(' + srcBg + ')', 'background-size': 'no-repeat center'}">
    <TheHeader />
    <v-main>
      <router-view />
    </v-main>
    <TheFooter />
  </v-app>
</template>

<script>
import TheHeader from "components/layout/TheHeader"
import TheFooter from "components/layout/TheFooter"

export default {
  components: {
    TheHeader,
    TheFooter,
  },
  data() {
    return{
      srcBg: require('back-ground.jpg')
    }
  }
}
</script>
<style scoped>

</style>
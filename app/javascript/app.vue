<template>
  <v-app 
  :style="{ 'background-image': 'url(' + srcBg + ')'}"
  >
    <TheHeader />
    <v-main>
    <transition mode="out-in">
      <router-view />
    </transition>
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
.v-enter-active, .v-leave-active {
  transition: opacity .5s;
}
.v-enter, .v-leave-to {
  opacity: 0;
}

</style>
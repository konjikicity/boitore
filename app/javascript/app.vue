<template>
  <v-app>
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
.theme--light.v-application{
  background: url('../assets/images/back-ground.jpg');
  background-size: cover;
  background-position: center center;
  width: 100%;
  height: 100%;
}
.theme--light.v-application::before{
  content: '';
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background-color: rgba(0,0,0,0.5);
}
.v-enter-active, .v-leave-active {
  transition: opacity .5s;
}
.v-enter, .v-leave-to {
  opacity: 0;
}
</style>
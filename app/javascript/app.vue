<template>
  <v-app>
    <TheHeader />
    <v-main>
      <transition mode="out-in">
        <router-view />
      </transition>
    </v-main>
  </v-app>
</template>

<script>
import TheHeader from "components/shared/TheHeader"

export default {
  components: {
    TheHeader,
  },
  data() {
    return{
      
    }
  }
}
</script>
<style lang="scss" scoped>

.theme--light.v-application{
  background: url('https://res.cloudinary.com/dzlhvpfmo/image/upload/v1651544234/back-ground_myiel1.jpg');
  background-size: cover;
  background-position: center center;
  width: 100%;
  height: 100%;

  &:before {
    content: '';
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-color: rgba(0,0,0,0.5);

  }
}
.v-enter-active, .v-leave-active {
  transition: opacity .5s;
}
.v-enter, .v-leave-to {
  opacity: 0;
}
</style>
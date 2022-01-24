<template>
  <v-app>
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
  }
}
</script>
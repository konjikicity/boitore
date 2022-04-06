<template>
  <v-snackbar
    v-model="status"
    transition="slide-x-reverse-transition"
    right
    top
    :color="type"
  >
    <div class="ml-5 font-weight-bold white--text">
      {{ message }}
    </div>
  </v-snackbar>
</template>

<script>
import { mapGetters } from "vuex"
export default {
  computed: {
    ...mapGetters([ "message", "type", "status" ])
  }
}
</script>
<template>
  <v-snackbar
    v-model="status"
    transition="slide-x-reverse-transition"
    right
    top
    :color="type"
    timeout="9000"
  >
    <div class="ml-5 font-weight-bold white--text">
      {{ message }}
    </div>
  </v-snackbar>
</template>

<script>
import { mapGetters } from "vuex"
export default {
  name: "FlashMessage",
  computed: {
    ...mapGetters('message', ["message", "type", "status"])
  }
}
</script>
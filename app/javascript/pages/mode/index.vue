<template>
  <v-container
  fill-height
  fluid
  >
  <v-row>
  <v-btn
  v-for="(mode, index) of modes"
    :key="mode"
  >
  {{ mode }}
  </v-btn>
  </v-row>
  </v-container>
</template>
<script>
export default {
  name: "ModeIndex",
  data(){
    return {
      modes: []
    }
  },
  mounted() {
    this.fetchModes();
  },
  methods: {
    fetchModes() {
      this.$axios.get('modes')


        .then(res => this.modes = res.data)
        .catch(err => console.log(err.status));
    }
  }
}
</script>
<style scoped>
</style>

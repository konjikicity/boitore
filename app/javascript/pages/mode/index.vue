<template>
  <v-container
  fill-height
  fluid
  >
  <v-btn
  v-for="mode in modes"
    :key="mode"
    :to="{ name: 'SelectIndex', params: { id: mode.id}}"
  >
  {{ mode.difficulty }}
  </v-btn>
  </v-container>
</template>
<script>
export default {
  name: "ModeIndex",
  data(){
    return {
      modes: [
      ]
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

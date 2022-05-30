<template>
  <v-container
    fill-height
    fluid
  >
    <v-row
      class="d-flex flex-column"
      justify="center"
      align-content="center"
    >
      <div
        class="text-center mb-6"
      >
        <h1
          class="white--text"
        >
          モード選択
        </h1>
      </div>
      <div
        v-for=" mode in modes"
        :key="mode.id"
        class="font-weight-bold white--text"
      >
        <v-btn
          :to="{ name: 'SelectIndex', params: { id: mode.id}}"
          class="red lighten-1 my-5 rounded-pill mr-4 white--text font-weight-bold"
          elevation="10"
          x-large
          :width="150"
        >
          {{ mode.difficulty }}
        </v-btn>
        {{ mode.description }}
      </div>
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
  created() {
    this.fetchModes();
  },
  methods: {
    async fetchModes(){
      try {
        const res = await this.$axios.get('modes')
        this.modes = res.data
      }
      catch(error) {
        console.log(error); 
      }
    }
  }
}
</script>


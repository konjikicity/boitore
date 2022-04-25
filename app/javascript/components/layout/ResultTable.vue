<template>
  <v-simple-table>
    <template v-slot:default>
      <thead>
        <tr>
          <th class="text-left">
            Name
          </th>
          <th class="text-left">
            Calories
          </th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="play_result in play_results"
          :key="play_result.practiced_sentence"
        >
          <td>{{ play_result.practiced_sentence }}</td>
          <td>{{ play_result.practiced_normal }}</td>
        </tr>
      </tbody>
    </template>
  </v-simple-table>
</template>
<script>
export default {
  name: "ResultTable",
    data () {
      return {
        play_results: []
     }
   },
   mounted() {
     this.fetchPlayResults()
   },
   methods: {
     fetchPlayResults() {
      this.$axios.get('/play_results', {
        headers: {
          uid: this.uid,
          "access-token": this.token,
          client: this.client,
        },
      })
        .then(res => {
          console.log(res.data);
          this.play_results = res.data;
        })
        .catch(err => console.log(err.status));
    },
   }
}
</script>
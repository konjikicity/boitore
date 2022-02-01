<template>
  <v-container 
    fill-height 
    fluid
  >
    <v-row
      justify="center"
      align-content="center"
    >
      <v-col
        cols="9"
      >
        <div>
          <h1
            class="mb-16"
          >
            母音法で練習
          </h1>
        </div>
        <v-card
          class="mb-3"
          elevation="20"
        >
          <v-card-title>
            <h3>母音の文章</h3>
          </v-card-title>
          <v-divider />
          <div
            class="text-h2 text-center py-14"
          >
            {{ $route.params.boin }}
          </div>
        </v-card>
        <v-card
          class="mb-16"
          elevation="20"
        >
          <v-card-title>
            <h3>通常の文章</h3>
          </v-card-title>
          <v-divider/>
          <div
            class="text-h2 text-center py-14"
          >
            {{ $route.params.normal }}
          </div>
        </v-card>
        <div
          class="text-center"
        >
          <PracticeResult />
        </div>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
import PracticeResult from 'components/result/PracticeResult.vue'

export default {
  components:  {
    PracticeResult
  }
 

}
</script>
<style scoped>

</style>
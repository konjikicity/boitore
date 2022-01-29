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
        cols="11"
      >
        <div>
          <h1
            class="mb-16"
          >
            通常練習
          </h1>
        </div>
        <v-card 
          height="300"
          class="mb-16"
          elevation="20"
        >
        <v-card-title
        class="justify-center"
        >
            <div
              class="text-h2 mt-16 pt-9"
            >
              {{ normal }}
            </div>
        </v-card-title>
        </v-card>
     
        <router-link 
          :to="{ name: 'BoinPractice', params: {normal: $route.params.normal, boin: $route.params.boin}}"
        >
          <p
            class="text-center"
          >
            次の練習へ
          </p>     
        </router-link>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
export default {
 props: ["id","normal","boin"]

}
</script>
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
          height="200"
          class="mb-3"
          elevation="20"
        >
          <v-card-title>
            <h3>母音の文章</h3>
          </v-card-title>
          <v-card-text>
            <div
              class="text-h2 text-center align-items-center"
            >
              {{ $route.params.boin }}
            </div>
          </v-card-text>
        </v-card>
        <v-card 
          height="200"
          class="mb-16"
          elevation="20"
        >
          <v-card-title>
            <h3>通常の文章</h3>
          </v-card-title>
          <v-card-text>
            <div
              class="text-h2 text-center align-items-center"
            >
              {{ $route.params.normal }}
            </div>
          </v-card-text>
        </v-card>
        <p
          class="text-center"
        >
          結果画面へ
        </p>     
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
export default {
 

}
</script>
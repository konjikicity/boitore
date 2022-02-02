<template>
  <v-row justify="space-around">
    <v-col cols="auto">
      <v-dialog
        transition="dialog-bottom-transition"
        max-width="auto"
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            color="error"
            v-bind="attrs"
            v-on="on"
          >
            結果を見る!
          </v-btn>
        </template>

        <template v-slot:default="dialog">
          <v-card>
            <div class="text-h3 text-center py-9">
              録音結果！
            </div>
            <v-divider />
            <v-row
              justify="center"
            >
              <v-col
                class="text-center py-9"
                cols="5"
              >
                <p>通常の文章</p>
                <audio controls />
              </v-col>
              <v-col
                class="text-center py-9"
                cols="5"
              >
                <p>母音の文章</p>
                <audio controls />
              </v-col>
            </v-row>
            <v-divider />
            <v-card-actions class="justify-center py-15">      
              <v-btn
                text
                :to="{ name: 'SelectIndex'}"
                @click="dialog = false"
                class="mr-5"
              >
                もう一度練習する
              </v-btn>
              <v-btn
                text
                :to="{ name: 'TopIndex'}"
                @click="dialog = false"
              >
                タイトルへ戻る
              </v-btn>
            </v-card-actions>
          </v-card>
        </template>
      </v-dialog>
    </v-col>
  </v-row>
</template>
<script>
</script>
<style scoped>
</style>
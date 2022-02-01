<template>
      <v-dialog
        transition="dialog-bottom-transition"
        max-width="600"
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            color="error"
            v-bind="attrs"
            v-on="on"
          >結果を見る！</v-btn>
        </template>
      </v-dialog>
</template>
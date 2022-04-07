  <template>
  <div>
    <v-alert v-if="alert" type="error">
      {{ alert }}
    </v-alert>
  </div>
</template>
<script>
export default {
  name: "Message",
  props: {
    alert: {
      type: String,
      default: null
    }
  }
}
</script>
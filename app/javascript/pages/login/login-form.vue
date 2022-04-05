<template>
  <v-card
  width="800px"
  class="mx-auto mt-5"
  >
    <v-card-title>
      <h1 class="display-1">ログイン</h1>
    </v-card-title>
    <v-form>
<v-text-field 
prepend-icon="mdi-account-circle"
label="メールアドレス"
v-model="email"
class="px-7"  
/>
<v-text-field 
v-bind:type="showPassword ? 'text' : 'password'" 
prepend-icon="mdi-lock" 
v-bind:append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'" 
label="パスワード" 
@click:append="showPassword = !showPassword" 
class="px-7"
/>
  <v-card-actions>
    <v-btn 
    class="error ml-7"
    @click="submit"
    >ログイン</v-btn>
  </v-card-actions>
</v-form>
  </v-card>
</template>
<script>
export default {
  name: "LoginForm",
  data(){
    return {
      showPassword: false,
      email:'',
      password:'',
    }
  },
  methods: {
    submit(){

    }
  }
}
</script>
<style scoped>
</style>
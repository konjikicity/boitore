<template>
  <v-card
  width="800px"
  class="mx-auto mt-5"
  >
    <v-card-title>
      <h1 class="display-1">ユーザー登録</h1>
    </v-card-title>
    <v-form>
<v-text-field 
prepend-icon="mdi-account-circle"
label="ユーザー名"
v-model="name"
class="px-7"  
/>
<v-text-field 
prepend-icon="mdi-mail"
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
v-model="password"
/>
<v-text-field 
v-bind:type="showPassword ? 'text' : 'password'" 
prepend-icon="mdi-lock" 
v-bind:append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'" 
label="パスワード確認" 
@click:append="showPassword = !showPassword" 
class="px-7"
v-model="passwordConfirmation"
/>
  <v-card-actions>
    <v-btn 
    class="error ml-7"
    @click="signUp"
    >登録</v-btn>
  </v-card-actions>
</v-form>
  </v-card>
</template>
<script>
import axios from 'axios'

export default {
  name: "LoginForm",
  data(){
    return {
      showPassword: false,
      name: '', 
      email:'',
      password:'',
      passwordConfirmation: '',
    }
  },
  methods: {
   async signUp () {
      try {
        const res = await axios.post('http://localhost:3000/auth', {
          name: this.name,
          email: this.email,
          password: this.password,
          password_confirmation: this.passwordConfirmation
          }
        )
        console.log({ res })
        return res
      } catch (error) {
        console.log({ error })
      }

    }
  }
}
</script>
<style scoped>
</style>
<template>
  <v-card
    width="800px"
    class="mx-auto mt-5"
  >
    <v-card-title>
      <h1 class="display-1">
        ユーザー登録
      </h1>
    </v-card-title>
    <v-form>
      <v-text-field 
        v-model="name"
        prepend-icon="mdi-account-circle"
        label="ユーザー名"
        class="px-7"  
      />
      <v-text-field 
        v-model="email"
        prepend-icon="mdi-mail"
        label="メールアドレス"
        class="px-7"  
      />
      <v-text-field 
        v-model="password" 
        :type="showPassword ? 'text' : 'password'" 
        prepend-icon="mdi-lock" 
        :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'" 
        label="パスワード" 
        class="px-7"
        @click:append="showPassword = !showPassword"
      />
      <v-text-field 
        v-model="passwordConfirmation" 
        :type="showPassword ? 'text' : 'password'" 
        prepend-icon="mdi-lock" 
        :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'" 
        label="パスワード確認" 
        class="px-7"
        @click:append="showPassword = !showPassword"
      />
      <v-card-actions>
        <v-btn 
          class="error ml-7"
          @click="signUp"
        >
          登録
        </v-btn>
      </v-card-actions>
    </v-form>
  </v-card>
</template>
<script>
import axios from 'axios'
import setItem from '../../src/auth/setItem'

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
        setItem(res.headers, res.data.data.name)
        this.$router.push({ name: 'ModeIndex' })
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
<template>
  <v-card
    width="800px"
    class="mx-auto mt-5"
  >
    <v-card-title>
      <h1 class="display-1">
        ログイン
      </h1>
    </v-card-title>
    <v-form
      @submit.prevent="login"
    >
      <v-text-field 
        v-model="email"
        prepend-icon="mdi-account-circle"
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
      <v-card-actions>
        <v-btn 
          class="error ml-7"
          @click="login"
        >
          ログイン
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
      email:'',
      password:'',
    }
  },
  methods: {
    async login(){
      try {
        const res = await axios.post('http://localhost:3000/auth/sign_in', {
          email: this.email,
          password: this.password,
        }
        )
        setItem(res.headers, res.data.data.name)
        this.$store.commit('updateToken', res.headers["access-token"])
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
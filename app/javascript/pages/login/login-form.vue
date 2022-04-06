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
    <validation-observer
      ref="observer"
    >
      <v-form
        @submit.prevent="login"
      >
        <validation-provider
          v-slot="{ errors }"
          rules="required"
          name="メールアドレス"
        >
          <v-text-field 
            v-model="email"
            prepend-icon="mdi-account-circle"
            :error-messages="errors"
            label="メールアドレス"
            class="px-7"
          />
        </validation-provider>

        <validation-provider
          v-slot="{ errors }"
          rules="required"
          name="パスワード"
        >
          <v-text-field 
            v-model="password" 
            :type="showPassword ? 'text' : 'password'" 
            prepend-icon="mdi-lock" 
            :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'" 
            label="パスワード"
            :error-messages="errors"
            class="px-7" 
            @click:append="showPassword = !showPassword"
          />
        </validation-provider>
        <div
          v-show="this.email !== null && this.password !== null" 
          class="valid"
        >
          {{ error }}
        </div>
        <v-card-actions>
          <v-btn 
            class="error ml-7"
            @click="login"
          >
            ログイン
          </v-btn>
        </v-card-actions>
      </v-form>
    </validation-observer>
  </v-card>
</template>
<script>
import axios from 'axios'
import setItem from '../../src/auth/setItem'
import { ValidationProvider, ValidationObserver, setInteractionMode, extend } from "vee-validate";

export default {
  name: "LoginForm",
  data(){
    return {
      showPassword: false,
      email: null,
      password: null,
      error: null
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
        this.$refs.observer.validate()
        if(this.email !== null && this.password !== null){
          this.error= "メールアドレスかパスワードを間違えています"
        }
        console.log({ error })
        
      }
    }
  }
}
</script>
<style scoped>
.valid {
  line-height: 12px;
  word-break: break-word;
  text-align: center;
  color: red;
  font-size: 15px;
}
</style>
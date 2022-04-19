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
          name="email"
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
          name="password"
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
        >
          <Message :alert="alert" />
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
import Message from '../../components/layout/Message'
import { ValidationProvider, ValidationObserver, setInteractionMode, extend } from "vee-validate";

export default {
  name: "LoginForm",
  components: {
    Message
  },
  data(){
    return {
      showPassword: false,
      email: null,
      password: null,
      alert: null,
      notice: null
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
        this.$store.commit('login/updateToken', res.headers["access-token"])
        this.$router.push({ name: 'ModeIndex' })
        this.$store.dispatch(
          "message/showMessage",
          {
            message: "ログインしました",
            type: "success",
            status: true,
          },
        )
        console.log({ res })
        return res
      } catch (error) {
        this.$refs.observer.validate()
        if(this.email !== null && this.password !== null){
          this.alert = 'メールアドレスまたはパスワードが違います。'
          this.notice = null
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
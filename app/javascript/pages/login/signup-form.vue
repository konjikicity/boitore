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
    <validation-observer
      ref="observer"
    >
      <v-form
        @submit.prevent="signUp"
      >
        <validation-provider
          v-slot="{ errors }"
          rules="required|max:10"
          name="ユーザー名"
        >
          <v-text-field 
            v-model="name"
            prepend-icon="mdi-account-circle"
            label="ユーザー名"
            class="px-7" 
            :error-messages="errors"
          />
        </validation-provider>

        <validation-provider
          v-slot="{ errors }"
          rules="required|email"
          name="メールアドレス"
        >
          <v-text-field 
            v-model="email"
            prepend-icon="mdi-mail"
            label="メールアドレス"
            class="px-7"
            :error-messages="errors"  
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
            class="px-7"
            :error-messages="errors"
            @click:append="showPassword = !showPassword"
          />
        </validation-provider>

        <validation-provider
          v-slot="{ errors }"
          rules="required|confirmed:password"
          name="password_confirmation"    
        >
          <v-text-field 
            v-model="passwordConfirmation" 
            :type="showPassword ? 'text' : 'password'" 
            prepend-icon="mdi-lock" 
            :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'" 
            label="パスワード確認" 
            class="px-7"
            :error-messages="errors"
            @click:append="showPassword = !showPassword" 
          />
        </validation-provider>
        <v-card-actions>
          <v-btn 
            class="error ml-7"
            @click="signUp"
          >
            登録
          </v-btn>
        </v-card-actions>
      </v-form>
    </validation-observer>
  </v-card>
</template>
<script>
import axios from 'axios'
import { ValidationProvider, ValidationObserver, setInteractionMode, extend } from "vee-validate";

export default {
  name: "SignUpForm",
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
        this.$store.commit('login/loginUser', { token: res.headers["access-token"], client: res.headers.client, 
          uid: res.data.data.uid, name: res.data.data.name,id: res.data.data.id
        })
        this.$router.push({ name: 'ModeIndex' })
        this.$store.dispatch(
          "message/showMessage",
          {
            message: "ユーザー登録が完了しました",
            type: "success",
            status: true,
          },
        )
        console.log({ res })
        return res
       
      } catch (error) {
        this.$refs.observer.validate()
        console.log({ error })
      }

    }
  }
}
</script>
<style scoped>
</style>
<template>
  <v-card
    width="800px"
    class="mx-auto mt-5"
  >
    <v-card-title>
      <h1 class="display-1 font-weight-bold">
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
          <TheMessage :alert="alert" />
        </div>
   
        <v-card-actions>
          <v-btn 
            class="error ml-7 font-weight-bold"
            @click="login"
          >
            ログイン
          </v-btn>
        </v-card-actions>
        <v-row
          justify="center"
          class="font-weight-bold py-9"
        >
          新規登録がお済みでない方は
          <router-link :to="{ name: 'SignUpForm' }">
            こちら
          </router-link>
        </v-row>
      </v-form>
    </validation-observer>
  </v-card>
</template>
<script>
import TheMessage from '../../components/shared/TheMessage'

export default {
  name: "LoginForm",
  components: {
    TheMessage
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
        const res = await this.$axios.post('/auth/sign_in', {
          email: this.email,
          password: this.password,
        }
        )
        this.$store.commit('login/loginUser', { token: res.headers["access-token"], client: res.headers.client,
          uid: res.data.data.uid, name: res.data.data.name,id: res.data.data.id
        })
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
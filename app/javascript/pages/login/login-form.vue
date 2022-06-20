<template>
  <v-container
    fill-height 
    fluid
  >
    <v-row
      justify="center"
    >
      <v-col
        cols="5"
      >
        <v-card
          class="mx-auto"
          height="500px"
        >
          <v-card-title>
            <h2 class="font-weight-bold pt-5 pl-2">
              ログイン
            </h2>
          </v-card-title>
    
          <validation-observer
            ref="observer"
            v-slot="{ invalid }"
          >
            <v-form
              @submit.prevent="login"
            >
              <validation-provider
                v-slot="{ errors }"
                rules="required|email"
                name="メールアドレス"
              >
                <v-text-field 
                  v-model="email"
                  :prepend-icon="icons.account"
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
                  :prepend-icon="icons.password" 
                  :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'" 
                  label="パスワード"
                  :error-messages="errors"
                  class="px-7" 
                  @click:append="showPassword = !showPassword"
                />
              </validation-provider>
              <TheMessage :alert="alert" />
              <v-card-actions>
                <v-btn 
                  :disabled="invalid"
                  class="error ml-7 font-weight-bold"
                  @click="login"
                >
                  ログイン
                </v-btn>
              </v-card-actions>
              <v-row
                justify="center"
              >
                <div
                  class="font-weight-bold mt-120"
                >
                  新規登録がお済みでない方は
                  <router-link :to="{ name: 'SignUpForm' }">
                    こちら
                  </router-link>
                </div>
              </v-row>
            </v-form>
          </validation-observer>
        </v-card>
      </v-col>
      <div
        class="white--text my-auto font-weight-bold px-10"
      >
        or
      </div>
      <v-col
        cols="3"
      >
        <v-card
          class="mx-auto"
          height="500px"
        >
          <v-card-title>
            <h3 class="font-weight-bold pt-5 pl-2">
              他のサービスでログイン
            </h3>
          </v-card-title>
          <div
            class="my-auto"
          >
            <v-row
              justify="center"
              class="mt-80"
            >
              <v-btn
                :href="googleLoginURL"
                class="x-small red white--text font-weight-bold py-7"
                style="text-transform: none"
              >
                <v-icon
                  class="mr-2"
                >
                  {{ icons.google }}
                </v-icon>
                Googleアカウントでログイン
              </v-btn>
            </v-row>
            <v-row
              class="font-weight-bold"
              justify="center"
            >
              または
            </v-row>
            <v-row
              justify="center"
            >
              <v-btn
                :href="twitterLoginURL"
                class="x-small light-blue white--text font-weight-bold py-7"
                style="text-transform: none"
              >
                <v-icon
                  class="mr-2"
                >
                  {{ icons.twitter }}
                </v-icon>
                Twitterアカウントでログイン
              </v-btn>
            </v-row>
          </div>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
const  TheMessage = () => import('../../components/shared/TheMessage');
import { mdiAccountCircle } from '@mdi/js'
import { mdiLock } from '@mdi/js'
import { mdiTwitter } from '@mdi/js'
import { mdiGoogle } from '@mdi/js'

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
      notice: null,
      icons: {
        account: mdiAccountCircle,
        password: mdiLock,
        twitter: mdiTwitter,
        google: mdiGoogle
      },
      twitter: {
        url: process.env.VUE_APP_TWITTER_URL,
        redirectUrl: process.env.VUE_APP_TWITTER_REDIRECT_URL
      },
      google: {
        url: process.env.VUE_APP_GOOGLE_URL,
        redirectUrl: process.env.VUE_APP_GOOGLE_REDIRECT_URL
      }
    }
  },
  computed: {
    twitterLoginURL() {
      return `${this.twitter.url}?auth_origin_url=${encodeURI(this.twitter.redirectUrl)}`

    },
    googleLoginURL() {
      return `${this.google.url}?auth_origin_url=${encodeURI(this.google.redirectUrl)}`

    }
  },
  methods: {
    async login(){
      try {
        await this.$axios.post('auth/sign_in', {
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
      } 
      catch (error) {
        this.alert = 'メールアドレスまたはパスワードが違います'
        this.notice = null
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
.mt-120 {
  margin-top: 120px;
}
.mt-80 {
  margin-top: 80px;
}
.row+.row  {
  margin-top: 50px;
}
</style>
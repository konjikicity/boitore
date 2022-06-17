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
            <h1 class="display-1 font-weight-bold">
              ユーザー登録
            </h1>
          </v-card-title>
          <validation-observer
            ref="observer"
            v-slot="{ invalid }"
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
                  :prepend-icon="icons.account"
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
                  :prepend-icon="icons.email"
                  label="メールアドレス"
                  class="px-7"
                  :error-messages="errors"  
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
                  class="px-7"
                  :error-messages="errors"
                  @click:append="showPassword = !showPassword"
                />
              </validation-provider>

              <validation-provider
                v-slot="{ errors }"
                rules="required|confirmed:パスワード"
                name="パスワード確認"    
              >
                <v-text-field 
                  v-model="passwordConfirmation" 
                  :type="showPassword ? 'text' : 'password'" 
                  :prepend-icon="icons.password" 
                  :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'" 
                  label="パスワード確認" 
                  class="px-7"
                  :error-messages="errors"
                  @click:append="showPassword = !showPassword" 
                />
              </validation-provider>
              <TheMessage :alert="alert" />
              <v-card-actions>
                <v-btn 
                  class="error ml-7 font-weight-bold"
                  :disabled="invalid"
                  @click="signUp"
                >
                  登録
                </v-btn>
              </v-card-actions>
            </v-form>
          </validation-observer>
          <v-row
            justify="center"
            class="font-weight-bold py-9"
          >
            既にご登録済みの方は
            <router-link :to="{ name: 'LoginForm' }">
              こちら
            </router-link>
          </v-row>
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
            <h2 class="font-weight-bold pt-5 pl-2">
              他のサービスで新規登録
            </h2>
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
                Googleアカウントで新規登録
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
                Twitterアカウントで新規登録
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
import { mdiEmail } from '@mdi/js'
import { mdiTwitter } from '@mdi/js'
import { mdiGoogle } from '@mdi/js'

export default {
  name: "SignUpForm",
  components: {
    TheMessage
  },
  data(){
    return {
      showPassword: false,
      name: '', 
      email:'',
      password:'',
      passwordConfirmation: '',
      alert: null,
      notice: null,
      icons: {
        account: mdiAccountCircle,
        password: mdiLock,
        email: mdiEmail,
        twitter: mdiTwitter,
        google: mdiGoogle
      },
      twitter: {
        url: 'http://localhost:3000/api/v1/auth/twitter',
        redirectUrl:'http://localhost:3000/oauth/twitter/callback'
      },
      google: {
        url: 'http://localhost:3000/api/v1/auth/google',
        redirectUrl:'http://localhost:3000/oauth/google/callback'
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
    async signUp () {
      try {
        const res = await this.$axios.post('auth', {
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
        this.alert = '名前またはメールアドレスが使用されています。'
        this.notice = null
      }

    }
  }
}
</script>
<style scoped>
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
<template>
  <div>
    <v-app-bar
      color="grey darken-3"
      height="70"
      dark
      app
    >
      <TheFlashMessage />
      <router-link
        :to="{ name: 'TopIndex'}"
      >
        <v-img 
          max-height="150"
          max-width="150"
          src="https://res.cloudinary.com/dzlhvpfmo/image/upload/v1651544232/boi%E3%83%88%E3%83%AC/logo_j6nywc.webp"
        />
      </router-link>
      <div
      class="ml-auto"
      >
         <v-btn
         v-if="isNotLoggedIn"
         class="mr-5 font-weight-bold"
         text
         :to="{ name: 'LoginForm'}"
         >
          ログイン
        </v-btn>
  
        <v-btn
        v-if="isNotLoggedIn"
        class="mr-5 font-weight-bold"
         :to="{ name: 'SignUpForm'}"
        text
        >
          新規登録
        </v-btn>
         <v-btn
        v-if="isLoggedIn"
        class="mr-5 font-weight-bold"
         :to="{ name: 'SignUpForm'}"
         style="text-transform: none"
        text
        >
          MyPage
        </v-btn>
         <v-btn
        v-if="isLoggedIn"
        class="mr-5 font-weight-bold"
        @click="logout"
        text
        >
          ログアウト
        </v-btn>
        <v-btn
        class="mr-5 font-weight-bold"
        color="error"
        rounded
        :to="{ name: 'HowToIndex'}"
        >
        <v-icon
        dense
        >{{ icons.light }}</v-icon>
          BOIトレとは？
        </v-btn>
      <v-app-bar-nav-icon
        class="mr-5"
        @click="drawer = true"
      />
      </div>
    </v-app-bar>

    <v-navigation-drawer
      v-model="drawer"
      absolute
      temporary
      right
      fixed
      style="position:fixed;"
    >
      <v-list
        nav
        dense
      >
        <v-list-item-group
          v-model="group"
          active-class="red--text text--accent-4"
        >
          <router-link
            :to="{ name: 'TopIndex'}"
          >
            <v-list-item>
              <v-list-item-icon>
                <v-icon>{{ icons.home }}</v-icon>
              </v-list-item-icon>
              <v-list-item-title>HOME</v-list-item-title>
            </v-list-item>
          </router-link>

          <router-link
            :to="{ name: 'Terms'}"
          >
            <v-list-item
              class="mt-9"
            >
              <v-list-item-icon>
                <v-icon>{{ icons.note }}</v-icon>
              </v-list-item-icon>
              <v-list-item-title>利用規約</v-list-item-title>
            </v-list-item>
          </router-link>

          <router-link
            :to="{ name: 'PrivacyPolicy'}"
          >
            <v-list-item>
              <v-list-item-icon>
                <v-icon>{{ icons.shield }}</v-icon>
              </v-list-item-icon>
              <v-list-item-title>プライバシーポリシー</v-list-item-title>
            </v-list-item>
          </router-link>

          <router-link
            :to="{ name: 'Contact'}"
          >
            <v-list-item>
              <v-list-item-icon>
                <v-icon>{{ icons.help }}</v-icon>
              </v-list-item-icon>
              <v-list-item-title>お問い合わせ</v-list-item-title>
            </v-list-item>
          </router-link>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
  </div>
</template>
<script>
const  TheFlashMessage  = () => import('components/shared/TheFlashMessage')
import { mdiHome } from '@mdi/js'
import { mdiAccount } from '@mdi/js'
import { mdiLogin } from '@mdi/js'
import { mdiLogout } from '@mdi/js'
import { mdiLightbulbOnOutline } from '@mdi/js'
import { mdiFileSign } from '@mdi/js'
import { mdiNoteTextOutline } from '@mdi/js'
import { mdiShieldSunOutline } from '@mdi/js'
import { mdiHelpCircleOutline } from '@mdi/js'
import { mapGetters } from "vuex"

export default {
  name: "TheHeader",
  components: {
    TheFlashMessage
  },
  data() {
    return {
      drawer: false,
      group: null,
      icons: {
        home: mdiHome,
        account: mdiAccount,
        login: mdiLogin,
        logout: mdiLogout,
        light: mdiLightbulbOnOutline,
        file: mdiFileSign,
        note: mdiNoteTextOutline,
        shield: mdiShieldSunOutline,
        help: mdiHelpCircleOutline
      },
    }
  },
  computed: {
    ...mapGetters(["login/uid", "login/token", "login/client", "login/name"]),
    isLoggedIn() {
      this.name = this['login/name']
      return this['login/token'] !== null
    },
    isNotLoggedIn() {
      return this['login/token'] == null
    },
  },
  methods: {
    async logout () {
      try {
        await this.$axios.delete('/auth/sign_out', {
          headers: {
            uid: this['login/uid'],
            "access-token": this['login/token'],
            client: this['login/client']
          },
        })
        this.$store.dispatch(
          "message/showMessage",
          {
            message: "ログアウトしました",
            type: "error",
            status: true,
          },
        this.$router.push({ name: 'TopIndex' })
        ),
        this.drawer = false
        this.$store.commit('login/logoutUser')
        this.$store.commit('practice/resetResult')
      } 
      catch (error) {
        console.log({ error })
      }
    }
  }
}
</script>
<style scoped>
.v-image:hover {
  opacity: 0.8;
}
.v-application a {
  text-decoration: none;
}
</style>
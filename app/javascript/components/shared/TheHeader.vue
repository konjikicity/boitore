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
      <v-app-bar-nav-icon
        class="ml-auto mr-5"
        @click="drawer = true"
      />
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
            v-if="isLoggedIn"
            :to="{ name: 'MyPageIndex'}"
          >
            <v-list-item>
              <v-list-item-icon>
                <v-icon>{{ icons.account }}</v-icon>
              </v-list-item-icon>
              <v-list-item-title>MyPage</v-list-item-title>
            </v-list-item>
          </router-link>

          <router-link
            v-if="isNotLoggedIn"
            :to="{ name: 'LoginForm'}"
          >
            <v-list-item>
              <v-list-item-icon>
                <v-icon>{{ icons.login }}</v-icon>
              </v-list-item-icon>
              <v-list-item-title>ログイン</v-list-item-title>
            </v-list-item>
          </router-link>

          <router-link
            v-if="isNotLoggedIn"
            :to="{ name: 'SignUpForm'}"
          >
            <v-list-item>
              <v-list-item-icon>
                <v-icon>{{ icons.file }}</v-icon>
              </v-list-item-icon>
              <v-list-item-title>新規登録</v-list-item-title>
            </v-list-item>
          </router-link>

          <router-link
            v-if="isLoggedIn"
            :to="{ name: 'TopIndex'}"
            @click.native="logout"
          >
            <v-list-item>
              <v-list-item-icon>
                <v-icon>{{ icons.logout }}</v-icon>
              </v-list-item-icon>
              <v-list-item-title>ログアウト</v-list-item-title>
            </v-list-item>
          </router-link>

          <router-link
            :to="{ name: 'HowToIndex'}"
          >
            <v-list-item>
              <v-list-item-icon>
                <v-icon>{{ icons.light }}</v-icon>
              </v-list-item-icon>
              <v-list-item-title>BOIトレとは？</v-list-item-title>
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
const  TheFlashMessage  = () => import('components/shared/TheFlashMessage');
import { mdiHome } from '@mdi/js';
import { mdiAccount } from '@mdi/js';
import { mdiLogin } from '@mdi/js';
import { mdiLogout } from '@mdi/js';
import { mdiLightbulbOnOutline } from '@mdi/js';
import { mdiFileSign } from '@mdi/js';
import { mdiNoteTextOutline } from '@mdi/js';
import { mdiShieldSunOutline } from '@mdi/js';
import { mdiHelpCircleOutline } from '@mdi/js';

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
      }
    }
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters['login/token'] !== null;
    },
    isNotLoggedIn() {
      return this.$store.getters['login/token'] == null;
    }
  },
  methods: {

    async logout () {
      try {
        const res = await this.$axios.delete('/auth/sign_out', {
          headers: {
            uid: this.$store.getters['login/uid'],
            "access-token": this.$store.getters['login/token'],
            client: this.$store.getters['login/client']
          },
        })
        this.$store.dispatch(
          "message/showMessage",
          {
            message: "ログアウトしました",
            type: "error",
            status: true,
          },
          
        ),
        this.drawer = false
        this.$store.commit('login/logoutUser')
        this.$store.commit('practice/resetResult')
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
.v-image:hover {
  opacity: 0.8;
}
.v-application a {
  text-decoration: none;
}
</style>
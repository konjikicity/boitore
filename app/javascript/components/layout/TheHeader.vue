<template>
<header>
  <v-app-bar
    color="grey darken-3"
    height="70"
    dark app
  >
    <router-link
      :to="{ name: 'TopIndex'}"
    >
      <v-img 
        max-height="150"
        max-width="150"
        :src="srcLogo"
      />
    </router-link>
    <v-app-bar-nav-icon @click="drawer = true"
    class="ml-auto mr-5"
    ></v-app-bar-nav-icon>
  </v-app-bar>

   <v-navigation-drawer
      v-model="drawer"
      absolute
      temporary
      right
    >
      <v-list
        nav
        dense
      >
        <v-list-item-group
          v-model="group"
          active-class="deep-purple--text text--accent-4"
        >      
        
        <router-link
      :to="{ name: 'TopIndex'}"
    >
      <v-list-item>
        <v-list-item-icon>
          <v-icon>mdi-home</v-icon>
        </v-list-item-icon>
      <v-list-item-title>HOME</v-list-item-title>
     </v-list-item>
     </router-link>

           <router-link
      :to="{ name: 'MyPageIndex'}"
    >
      <v-list-item>
        <v-list-item-icon>
          <v-icon>mdi-account</v-icon>
        </v-list-item-icon>
      <v-list-item-title>MyPage</v-list-item-title>
     </v-list-item>
     </router-link>

          <router-link
      :to="{ name: 'LoginForm'}"
    >
      <v-list-item>
        <v-list-item-icon>
          <v-icon>mdi-login</v-icon>
        </v-list-item-icon>
      <v-list-item-title>ログイン</v-list-item-title>
     </v-list-item>
     </router-link>

      <router-link
      :to="{ name: 'TopIndex'}"
      @click.native="logout"
    >
      <v-list-item>
        <v-list-item-icon>
          <v-icon>mdi-logout</v-icon>
        </v-list-item-icon>
      <v-list-item-title>ログアウト</v-list-item-title>
     </v-list-item>
     </router-link>

     <router-link
      :to="{ name: 'SignUpForm'}"
    >
      <v-list-item>
        <v-list-item-icon>
          <v-icon>mdi-file-sign</v-icon>
        </v-list-item-icon>
      <v-list-item-title>新規登録</v-list-item-title>
     </v-list-item>
     </router-link>

        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
    </header>
</template>

<script>
import axios from 'axios'

export default {
  name: "TheHeader",
  data() {
    return {
      srcLogo: require("logo.png"),
      drawer: false,
      group: null,
    }
  },
  methods: {

    async logout () {
      try {
        const res = await axios.delete('http://localhost:3000/auth/sign_out', {
          headers: {
            uid: window.localStorage.getItem('uid'),
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
          }
        })

        console.log("ログアウトしました")
        window.localStorage.removeItem('access-token')
        window.localStorage.removeItem('client')
        window.localStorage.removeItem('uid')
        window.localStorage.removeItem('name')

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
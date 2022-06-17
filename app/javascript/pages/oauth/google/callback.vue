<template>
  <div />
</template>

<script>
export default {
  name: "GoogleCallBack",
  data(){
    return {
      uid: false,
      "access-token": null,
      client: null,
      expiry: null,
    }
  },
  created() {
    this.fetchQuery();
    this.fetchUsers();
  },
  methods: {
    fetchQuery() {
      this.uid = this.$route.query.uid,
      this["access-token"] = this.$route.query.auth_token,
      this.client = this.$route.query.client_id,
      this.expiry = this.$route.query.expiry
    },
    async fetchUsers() {
      try {
        const res = await this.$axios.get('auth/validate_token', {
          headers: {
            uid: this.uid,
            "access-token": this["access-token"],
            client: this.client,
            expiry: this.expiry
          },
        })
        this.$store.commit('login/loginUser', { token: res.headers["access-token"], client: res.headers.client,
          uid: res.data.data.uid, name: res.data.data.name,id: res.data.data.id, email: res.data.data.email,
          image: res.data.data.image, nickname: res.data.data.nickname
        })
        this.$store.dispatch(
          "message/showMessage",
          {
            message: "ログインしました",
            type: "success",
            status: true,
          },
        )
        this.$router.push({ name: 'ModeIndex' })     
      }
      catch(error) {
        console.log(error)
      }
    },
  }
}
</script>
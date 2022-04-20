<template>
  <v-container 
    fill-height 
    fluid
  >
    <v-row
      justify="center"
    >
      <v-card
        width="800px"
        class="mx-auto mt-5"
      >
        <v-card-title>
          <h1 class="display-1">
            MyPage
          </h1>
        </v-card-title>
        <div>
          <p>こんにちは、<span class="name">{{ name }}</span>さん</p>
          <p class="email">
            現在、 {{ email }} でログイン中です
          </p>    
        </div>
      </v-card>
    </v-row>
  </v-container>
</template>
<script>
import Message from '../../components/layout/Message'
export default {
  name: 'MyPageIndex',
  data(){
    return {
      name: window.localStorage.getItem('name'),
      email: window.localStorage.getItem('uid')
    }
  }
}
</script>
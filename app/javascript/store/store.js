import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    token: null
  }, 
  getters: {
    token: state => state.token
  },
  mutations: {
    updateToken(state, token) { 
      state.token = token;
    }
  },
})
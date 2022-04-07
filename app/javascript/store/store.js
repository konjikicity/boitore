import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    token: null,
    message: "",
    type: "",
    status: false,
  }, 
  getters: {
    token: state => state.token,
    message: state => state.message,
    type: state => state.type,
    status: state => state.status,
  },
  mutations: {
    updateToken(state, token) { 
      state.token = token;
    },
    setMessage(state, message) {
      state.message = message
    },
    setType(state, type) {
      state.type = type
    },
    setStatus(state, bool) {
      state.status = bool
    },
  },
  actions: {
    showMessage({ commit }, { message, type, status }) {
      commit("setMessage", message)
      commit("setType", type)
      commit("setStatus", status)
      setTimeout(() => {
        commit("setStatus", !status)
      }, 2000)
    },
  }
})
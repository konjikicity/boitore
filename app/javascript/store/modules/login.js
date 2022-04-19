export default {
  namespaced: true,
  state: {
    token: null,
  }, 
  getters: {
    token: state => state.token,
  },
  mutations: {
    updateToken(state, token) { 
      state.token = token;
    },
  }
}
export default {
  namespaced: true,
  state: {
    message: "",
    type: "",
    status: false,
  }, 
  getters: {
    message: state => state.message,
    type: state => state.type,
    status: state => state.status,
  },
  mutations: {
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
}
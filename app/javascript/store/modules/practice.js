export default {
  namespaced: true,
  state: {
    normalVoice: "",
    boinVoice: "",
    normalRecognition: "",
    boinRecognition:""
  }, 
  getters: {
    normalVoice: state => state.normalVoice,
    boinVoice: state => state.boinVoice,
    normalRecognition: state => state.normalRecognition,
    boinRecognition: state => state.boinRecognition
  },
  mutations: {
    setNormalVoice(state, normalVoice) {
      state.normalVoice = normalVoice
    },
    setBoinVoice(state, boinVoice) {
      state.boinVoice = boinVoice 
    },
    setNormalRecognition(state, normalRecognition) {
      state.normalRecognition = normalRecognition
    },
    setBoinRecognition(state, boinRecognition) {
      state.boinRecognition = boinRecognition
    }
  }
}
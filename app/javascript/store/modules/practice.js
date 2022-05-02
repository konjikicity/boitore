export default {
  namespaced: true,
  state: {
    normalSentence: null,
    boinSentence: null,
    normalVoice: null,
    boinVoice: null,
    normalRecognition: null,
    boinRecognition: null,
    normalForm: null,
    boinForm: null
  }, 
  getters: {
    normalSentence: state => state.normalSentence,
    boinSentence: state => state.boinSentence,
    normalVoice: state => state.normalVoice,
    boinVoice: state => state.boinVoice,
    normalRecognition: state => state.normalRecognition,
    boinRecognition: state => state.boinRecognition,
    normalForm: state => state.normalForm,
    boinForm: state => state.boinForm,
  },
  mutations: {
    setNormalSentence(state, normalSentence) {
      state.normalSentence = normalSentence
    },
    setBoinSentence(state, boinSentence) {
      state.boinSentence = boinSentence
    },
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
    },
    setNormalForm(state, normalForm) {
      state.normalForm = normalForm
    },
    setBoinForm(state, boinForm) {
      state.boinForm = boinForm
    },
    resetResult(state){
      state.normalSentence = null,
      state.boinSentence = null,
      state.normalVoice = null,
      state.boinVoice = null,
      state.normalRecognition = null,
      state.boinRecognition = null,
      state.normalForm = null,
      state.boinForm = null
    }
  }
}
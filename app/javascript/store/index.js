import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'
import { login, message, practice } from './modules';
Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    login,
    message,
    practice
  },
  plugins: [createPersistedState(
    { 
      // ストレージの種類を指定する。デフォルトではローカルストレージ
      storage: window.sessionStorage
    }
  )]
});
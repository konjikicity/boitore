import Vue from 'vue'
import Vuex from 'vuex'
import { login, message } from './modules';
Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    login,
    message
  },
});
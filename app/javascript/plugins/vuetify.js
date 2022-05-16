import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import minifyTheme from 'minify-css-string'

Vue.use(Vuetify)

export default new Vuetify({
  theme: {
    options: { themeCache: {
      get: key => localStorage.getItem(key),
      set: (key, value) => localStorage.setItem(key, value),
    },
    minifyTheme }
  },
  icons: {
    iconfont: 'mdiSvg',
  }
})
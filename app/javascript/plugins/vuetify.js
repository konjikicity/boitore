import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import minifyTheme from 'minify-css-string'
import '@mdi/font/css/materialdesignicons.css'

Vue.use(Vuetify)

export default new Vuetify({
  theme: {
    options: { minifyTheme }
  },
  icons: {
    iconfont: 'mdi',
  }
})
const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader');
const vue = require('./loaders/vue')
const webpack = require('webpack')
const dotenv = require('dotenv')
const dotenvFiles = [
  `.env.${process.env.NODE_ENV}`,
]
dotenvFiles.forEach((dotenvFile) => {
  dotenv.config({ path: dotenvFile, silent: true })
})

environment.plugins.prepend('Environment',
  new webpack.EnvironmentPlugin(
    JSON.parse(JSON.stringify(process.env))
  )
)
const customConfig = require('./custom')
environment.config.merge(customConfig)
environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
module.exports = environment

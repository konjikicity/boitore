const VuetifyLoaderPlugin = require('vuetify-loader/lib/plugin')

module.exports = {
  plugins: [
    new VuetifyLoaderPlugin()
  ],
}

module.exports = {
  module: {
    rules: [
      {
        test: /\.sass$/,
        use: [
          'vue-style-loader',
          'css-loader',
          {
            // Requires sass-loader@^9.0.0
            options: {
              // This is the path to your variables
              additionalData: "@import '../stylesheets/variables.scss'"
            },
          },
        ],
      },
      {
        test: /\.scss$/,
        use: [
          'vue-style-loader',
          'css-loader',
          {
            // Requires sass-loader@^9.0.0
            options: {
              // This is the path to your variables
              additionalData: "@import '../stylesheets/variables.scss';"
            },
          },
        ],
      },
    ],
  },
}
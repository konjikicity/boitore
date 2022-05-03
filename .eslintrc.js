module.exports = {
  "extends": [
    "eslint:recommended",
    "plugin:vue/recommended",
  ],
  "env": {
    "browser": true,
  },
  "globals": {
    "Vue": true
  },
  "rules": {
    "indent": ["error", 2],
    "vue/html-indent": ["error", 2],
    "vue/this-in-template": "off",
    "no-undef": "off",
    "no-dupe-keys": "off"
  }
};
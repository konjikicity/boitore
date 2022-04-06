"use strict";

module.exports = {
  "extends": ["plugin:vue/recommended"],
  "env": {
    "browser": true
  },
  "globals": {
    "Vue": true
  },
  "rules": {
    "indent": ["error", 2],
    "vue/html-indent": ["error", 2],
    "vue/this-in-template": "off"
  }
};
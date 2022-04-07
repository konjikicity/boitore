"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _veeValidate = require("vee-validate");

var _rules = require("vee-validate/dist/rules");

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(source, true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(source).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

(0, _veeValidate.setInteractionMode)('eager');
var _default = {
  name: 'SignUpForm',
  components: {
    ValidationProvider: _veeValidate.ValidationProvider,
    ValidationObserver: _veeValidate.ValidationObserver
  }
};
exports["default"] = _default;
(0, _veeValidate.extend)("required", _objectSpread({}, _rules.required, {
  message: "入力してください"
}));
(0, _veeValidate.extend)('confirmed', _objectSpread({}, _rules.confirmed, {
  message: "パスワードと一致しません。"
}));
(0, _veeValidate.extend)('email', _objectSpread({}, _rules.email, {
  message: '形式が正しくありません。'
}));
(0, _veeValidate.extend)('max', _objectSpread({}, _rules.max, {
  message: '{length}文字以内で入力してください。'
}));
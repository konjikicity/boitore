import { ValidationProvider, ValidationObserver, extend } from "vee-validate";
import { required, confirmed, email, max } from 'vee-validate/dist/rules'

export default {
  name: 'SignUpForm',
  components: {
    ValidationProvider,
    ValidationObserver,

  },
};


extend("required", {
  ...required,
  message: "{_field_}を入力してください"
});

extend('confirmed', {
  ...confirmed,
  message: "パスワードと一致しません。"
});

extend('email', {
  ...email,
  message: '形式が正しくありません。'
});

extend('max', {
  ...max,
  message: '{length}文字以内で入力してください。'
});
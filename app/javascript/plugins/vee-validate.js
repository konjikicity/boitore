import { ValidationProvider, ValidationObserver, setInteractionMode, extend } from "vee-validate";
import { required } from 'vee-validate/dist/rules'
setInteractionMode('eager')

export default {
  components: {
    ValidationProvider,
    ValidationObserver,
   
  },
};


extend("required", {
  ...required,
  message: "{_field_}は必須項目です"
});
// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.
import Vue from "vue";
import Router from "vue-router";

import TopIndex from "../pages/top/index";
import SelectIndex from "../pages/select/index";
import NormalPractice from "../pages/practice/normal-practice";
import BoinPractice from "../pages/practice/boin-practice";
import HowToIndex from "../pages/how-to/index";
import ModeIndex from "../pages/mode/index";
import SharedTerms from "../pages/shared/terms";
import SharedPrivacy from "../pages/shared/privacy-policy";
import SharedContact from "../pages/shared/contact";
import LoginForm from "../pages/login/login-form";
import SignUpForm from "../pages/login/signup-form";
import MyPageIndex from "../pages/my-page/index";

Vue.use(Router)


const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      component: TopIndex,
      name: "TopIndex"

    }, 
    {
      path:"/modes",
      component: ModeIndex,
      name: "ModeIndex"
    },
    {
      path: "/modes/:id/selects",
      component: SelectIndex,
      name: "SelectIndex"
    },
    {
      path: "/selects/:id/normal-practice",
      component: NormalPractice,
      name: "NormalPractice"
    },
    {
      path: "/selects/:id/boin-practice",
      component: BoinPractice,
      name: "BoinPractice"
    }
    ,
    {
      path:"/how-to",
      component: HowToIndex,
      name: "HowToIndex"
    },
    {
      path:"/terms",
      component: SharedTerms,
      name: "SharedTerms"
    },
    {
      path:"/privacy",
      component: SharedPrivacy,
      name: "SharedPrivacy"
    },
    {
      path: "/contact",
      component: SharedContact,
      name: "SharedContact"
    },
    {
      path: '/login',
      component: LoginForm,
      name: "LoginForm"      
    },
    {
      path: '/signup',
      component: SignUpForm,
      name: "SignUpForm"
    },
    {
      path:'/MyPage',
      component: MyPageIndex,
      name: "MyPageIndex"
    }
  ]
})

export default router
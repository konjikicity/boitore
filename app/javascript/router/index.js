// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.
import Vue from "vue";
import Router from "vue-router";

import TopIndex from "../pages/top/index";
import SelectIndex from "../pages/select/index";
import NormalPractice from "../pages/practice/normal-practice";
import BoinPractice from "../pages/practice/boin-practice";
import ResultIndex from "../pages/result/index";

Vue.use(Router)

const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      component: TopIndex,
      name: "TopIndex",

    },
    {
      path: "/select",
      component: SelectIndex,
      name: "SelectIndex",
      props: true
    },
    {
      path: "/select/:id/normal-practice",
      component: NormalPractice,
      name: "NormalPractice",
      props: true
    },
    {
      path: "/select/:id/normal-practice/boin-practice",
      component: BoinPractice,
      name: "BoinPractice",
    },
    {
      path: "/result",
      component: ResultIndex,
      name: "ResultIndex"
    }

  ],
})

export default router
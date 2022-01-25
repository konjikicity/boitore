// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.
import Vue from "vue";
import Router from "vue-router";

import TopIndex from "../pages/top/index";
import SelectIndex from "../pages/select/index";

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
    },
  ],
})

export default router
import Vue from 'vue'
import Staff from '../app/AppStaff.vue'

import router from '../app/router'
import store from '../app/store'
import '../app/sockets/index'


import { Quasar } from 'quasar'
import params from '../app/quasar/params'
Vue.use(Quasar, params);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(Staff),
    router,
    store
  }).$mount();
  document.body.appendChild(app.$el)
});
import Vue from 'vue'
import Client from '../app/AppClient.vue'

import router from '../app/router'
import store from '../app/store'
import '../app/sockets/index'


import { Quasar } from 'quasar'
import params from '../app/quasar/params'
Vue.use(Quasar, params);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(Client),
    router,
    store
  }).$mount();
  document.body.appendChild(app.$el)
});
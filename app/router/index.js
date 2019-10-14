import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter);
import Client from '../javascript/app/client'

export default new VueRouter({
  mode: 'history',
  hashbang: false,
  routes: [
    { path: '/client', component: Client }
  ]
})
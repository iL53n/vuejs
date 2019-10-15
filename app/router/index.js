import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter);
import Clients from '../javascript/app/components/dashboards/dashboard_clients'
import Organizations from '../javascript/app/components/dashboards/dashboard_organizations'
import Staffs from '../javascript/app/components/dashboards/dashboard_staffs'
// import Organizations from '../javascript/app/components/dashboards/show_organization'


export default new VueRouter({
  mode: 'history',
  hashbang: false,
  routes: [
    { path: '/staff', redirect: '/organizations' },
    { path: '/organizations', component: Organizations },
    { path: '/clients', component: Clients },
    { path: '/staffs', component: Staffs},
    // { path: '/equipments', component: Equipments },
    // { path: 'organizations/:id', component: Organization }
  ]
})
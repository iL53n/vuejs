import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter);
import Clients from '../javascript/app/components/dashboards/dashboard_clients'
import EditClient from '../javascript/app/components/forms/edit_client'
import Organizations from '../javascript/app/components/dashboards/dashboard_organizations'
import Staffs from '../javascript/app/components/dashboards/dashboard_staffs'
import EditStaff from '../javascript/app/components/forms/edit_staff'
// import Organizations from '../javascript/app/components/dashboards/show_organization'


export default new VueRouter({
  mode: 'history',
  hashbang: false,
  routes: [
    { path: '/staff', redirect: '/staffs' },
    { path: '/organizations', component: Organizations },
    { path: '/clients', component: Clients,
      children: [
        { path: ':id/edit', component: EditClient, name: 'editClient' },
      ],
    },
    { path: '/staffs', component: Staffs,
      children: [
        { path: ':id/edit', component: EditStaff, name: 'editStaff' },
      ],
    },
  ]
})
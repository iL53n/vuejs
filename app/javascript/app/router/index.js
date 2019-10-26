import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter);
// const Clients = () => import(/* webpackChunkName: "DashboardClients" */ '../javascript/app/components/dashboards/DashboardClients');
// const Organizations = () => import(/* webpackChunkName: "DashboardOrganizations" */ '../javascript/app/components/dashboards/DashboardOrganizations');
// const Equipments = () => import(/* webpackChunkName: "DashboardEquipments" */ '../javascript/app/components/dashboards/DashboardEquipment');
// const Staffs = () => import(/* webpackChunkName: "DashboardStaffs" */ '../javascript/app/components/dashboards/DashboardStaffs');
import Clients from '../components/dashboards/DashboardClients'
import CreateClient from '../components/forms/clients/CreateClient'
import EditClient from '../components/forms/clients/EditClient'
import Organizations from '../components/dashboards/DashboardOrganizations'
import CreateOrganization from '../components/forms/organizations/CreateOrganization'
import EditOrganization from '../components/forms/organizations/EditOrganization'
import Equipments from '../components/dashboards/DashboardEquipment'
import CreateEquipment from '../components/forms/equipments/CreateEquipment'
import EditEquipment from '../components/forms/equipments/EditEquipment'
import Staffs from '../components/dashboards/DashboardStaffs'
import CreateStaff from '../components/forms/staffs/CreateStaff'
import EditStaff from '../components/forms/staffs/EditStaff'

export default new VueRouter({
  mode: 'history',
  hashbang: false,
  routes: [
    { path: '/', redirect: '/organizations' },
    { path: '/organizations', component: Organizations,
      children: [
        { path: ':id/edit', component: EditOrganization, name: 'editOrganization' },
        { path: 'create', component: CreateOrganization, name: 'createOrganization' },
      ],
    },
    { path: '/clients', component: Clients,
      children: [
        { path: ':id/edit', component: EditClient, name: 'editClient' },
        { path: 'create', component: CreateClient, name: 'createClient' },
      ],
    },
    { path: '/equipments', component: Equipments,
      children: [
        { path: ':id/edit', component: EditEquipment, name: 'editEquipment' },
        { path: 'create', component: CreateEquipment, name: 'createEquipment' },
      ],
    },
    { path: '/staffs', component: Staffs,
      children: [
        { path: ':id/edit', component: EditStaff, name: 'editStaff' },
        { path: 'create', component: CreateStaff, name: 'createStaff' },
      ],
    },
  ]
})
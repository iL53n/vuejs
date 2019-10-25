import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter);
import Clients from '../javascript/app/components/dashboards/dashboard_clients'
import CreateClient from '../javascript/app/components/forms/clients/create_client'
import EditClient from '../javascript/app/components/forms/clients/edit_client'
import Organizations from '../javascript/app/components/dashboards/dashboard_organizations'
import CreateOrganization from '../javascript/app/components/forms/organizations/create_organization'
import EditOrganization from '../javascript/app/components/forms/organizations/edit_organization'
import Equipments from '../javascript/app/components/dashboards/dashboard_equipment'
import CreateEquipment from '../javascript/app/components/forms/equipments/create_equipment'
import EditEquipment from '../javascript/app/components/forms/equipments/edit_equipment'
import Staffs from '../javascript/app/components/dashboards/dashboard_staffs'
import CreateStaff from '../javascript/app/components/forms/staffs/create_staff'
import EditStaff from '../javascript/app/components/forms/staffs/edit_staff'

export default new VueRouter({
  mode: 'history',
  hashbang: false,
  routes: [
    { path: '/staff', redirect: '/staffs' },
    { path: '/organizations', component: Organizations,
      children: [
        { path: ':id/edit', component: EditOrganization, name: 'editOrganization' },
        { path: '/create', component: CreateOrganization, name: 'createOrganization' },
      ],
    },
    { path: '/clients', component: Clients,
      children: [
        { path: ':id/edit', component: EditClient, name: 'editClient' },
        { path: '/create', component: CreateClient, name: 'createClient' },
      ],
    },
    { path: '/equipments', component: Equipments,
      children: [
        { path: ':id/edit', component: EditEquipment, name: 'editEquipment' },
        { path: '/create', component: CreateEquipment, name: 'createEquipment' },
      ],
    },
    { path: '/staffs', component: Staffs,
      children: [
        { path: ':id/edit', component: EditStaff, name: 'editStaff' },
        { path: '/create', component: CreateStaff, name: 'createStaff' },
      ],
    },
  ]
})
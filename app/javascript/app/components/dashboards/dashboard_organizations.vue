<template lang="pug">
  div
    div(v-if="loading")
      q-page-container(align="middle")
        q-spinner(color="primary" size="7em" :thickness="10")
    div(v-else)
      div(v-if="error")
        p Error!
      div(v-else)
        q-page-sticky(expand position="top")
          q-toolbar(class="bg-secondary text-white")
            q-toolbar-title(align="middle")
              | Организации
        q-pa-md
          q-table(name="organizations", :title="title", :data="data", :columns="columns", row-key="id" no-data-label="Нет информации об организациях!")
            template(v-slot:body-cell-delete="props")
              q-td(:props="props")
                q-btn(push color="white" text-color="primary" label="Удалить"  @click="deleteOrganization(props.row.id)" method="delete")

          CreateOrganization(@add-organization="fetchOrganizations")
</template>

<script>
  import { backendGet } from '../../api'
  import { backendDelete } from '../../api'
  import CreateOrganization from '../forms/create_organization'

  export default {
    data () {
      return {
        columns: [
          { name: 'id', align: 'center', label: 'ID', field: 'id', sortable: true },
          { name: 'title', align: 'center', label: 'Наименование', field: 'title', sortable: true },
          { name: 'form_of_owership', label: 'Форма собственности', field: 'form_of_owership', sortable: true },
          { name: 'tax_number', label: 'ИНН', field: 'tax_number', sortable: true },
          { name: 'reg_number', label: 'ОГРН', field: 'reg_number', sortable: true },
          { name: 'delete', field: 'delete' }
        ],
        data: [],
        title: '',
        loading: true,
      }
      error: {}
    },
    created() {
      this.fetchOrganizations();
    },
    methods: {
      fetchOrganizations() {
        backendGet('/staff/organizations')
            .then((response) => {
              this.data = response.data.organizations
            })
            .catch((error) => {
              console.log(error);
              this.error = true
            })
            .finally(() => {
              this.loading = false
            });
      },
      deleteOrganization(id) {
        backendDelete('/staff/organizations/', id)
          .then((response) => {
            this.fetchOrganizations();
          })
          .catch((error) => {
            console.log(error);
            this.error = true
          });
      },
    },
    components: {
      CreateOrganization
    }
  }
</script>
<template lang="pug">
  div
    div(v-if="organizationsList.loading")
      q-page-container(align="middle")
        q-spinner(color="primary" size="7em" :thickness="10")
    div(v-else)
      div(v-if="error")
        p Error!
      div(v-else)
        organization-filter
        q-page-sticky(expand position="top")
          q-toolbar(class="bg-secondary text-white")
            q-toolbar-title(align="middle")
              | Организации
        .q-pa-md
          q-table(
            ref="table"
            name="organizations"
            @request="onRequest"
            :title="organizationsList.title"
            :data="organizationsList.data"
            :columns="organizationsList.columns"
            :pagination.sync="organizationsList.pagination"
            :rows-per-page-options="[10, 25, 100]"
            binary-state-sort
            row-key="id"
            no-data-label="Нет информации об организациях!")
            template(v-slot:body-cell-clients="props")
              q-td
                | {{ props.row.clients.map(client => client.fullname).join(", ") }}
            template(v-slot:body-cell-action="props")
              q-td(align="right")
                q-btn(push color="white" text-color="primary" label="Редактировать" @click="editOrganization(props.row)")
                q-btn(push color="white" text-color="negative" label="Удалить"  @click="deleteOrganization(props.row)" method="delete")
          q-page-sticky(expand position="bottom-left")
            q-btn(push round color="primary" size="20px" @click="createOrganization()") +

          router-view(@edit-organization="fetchOrganizations('')" @create-organization="fetchOrganizations('')")
</template>

<script>
  import { backendGetWithParams } from '../../api'
  import { backendDelete } from '../../api'
  import CreateOrganization from '../forms/organizations/CreateOrganization'
  import EditOrganization from '../forms/organizations/EditOrganization'
  import OrganizationFilter from '../forms/organizations/OrganizationFilter'
  import { Notify } from 'quasar'

  export default {
    data () {
      return {
        organizationsList: {
          columns: [
            { name: 'id', align: 'left', label: 'ID', field: 'id', sortable: true },
            { name: 'form_of_owership', align: 'center', label: 'Форма собственности', field: 'form_of_owership', sortable: true },
            { name: 'title', align: 'left', label: 'Наименование', field: 'title', sortable: true },
            { name: 'clients', align: 'center', label: 'Клиент(-ы)', field: '', sortable: true },
            { name: 'tax_number', align: 'center', label: 'ИНН', field: 'tax_number', sortable: true },
            { name: 'reg_number', align: 'center', label: 'ОГРН', field: 'reg_number', sortable: true },
            { name: 'action', align: 'center', field: ['edit', 'delete'] }
          ],
          data: [],
          pagination: {},
          //title: '',
          loading: true,
          errors: {},
        }
      }
    },
    computed: {
      filter() {
        return this.$store.state.orgMod.filter
      }
    },
    watch: {
      filter() {
        this.refresh()
      }
    },
    created() {
      this.onRequest({
        pagination: this.organizationsList.pagination,
        filter: this.filter
      })
    },
    methods: {
      onRequest(props) {
        let { page, rowsPerPage, sortBy, descending } = props.pagination;
        this.fetchOrganizations(page, rowsPerPage, sortBy, descending, this.filter)
      },
      refresh() {
        this.$refs.table.requestServerInteraction()
      },
      fetchOrganizations(page, rowsPerPage, sort, desc, filter, scopes) {
        backendGetWithParams('/staff/organizations', { page, rowsPerPage, sort, desc, filter, scopes })
            .then((response) => {
              this.organizationsList.data = response.data.organizations
            })
            .catch((error) => {
              console.log(error);
              this.organizationsList.errors = true
            })
            .finally(() => {
              this.organizationsList.loading = false
            });
      },
      deleteOrganization(obj) {
        backendDelete('/staff/organizations/', obj.id)
            .then((response) => {
              this.fetchOrganizations('');
              Notify.create({
                message: "Организация '" + obj.title + "' удалена!",
                color: 'negative'
              })
            })
            .catch((error) => {
              console.log(error);
              this.organizationsList.errors = true
            });
      },
      createOrganization() {
        this.$router.push({ name: 'createOrganization'});
      },
      editOrganization(row) {
        this.$router.push({ name: 'editOrganization', params: { id: row.id }});
      },
    },
    components: {
      CreateOrganization,
      EditOrganization,
      OrganizationFilter,
      Notify
    },
    subscriptions: {
      OrganizationsChannel: {
        received(data) {
          this.refresh()
        }
      }
    }
  }
</script>
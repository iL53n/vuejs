<template lang="pug">
  q-pa-md
    q-table(name="organizations", :title="title", :data="data", :columns="columns", row-key="id")

</template>

<script>
  import { backendGet } from '../api/index'

  export default {
    data () {
      return {
        columns: [
          { name: 'id', align: 'center', label: 'ID', field: 'id', sortable: true },
          { name: 'title', align: 'center', label: 'Title', field: 'title', sortable: true },
          { name: 'form_of_owership', label: 'Form of owership', field: 'form_of_owership', sortable: true },
          { name: 'tax_number', label: 'Tax number', field: 'tax_number', sortable: true },
          { name: 'reg_number', label: 'Reg number', field: 'reg_number', sortable: true }
        ],
        data: [],
        title: "",
        loading: true
      }
    },
    created() {
      this.fetchOrganizations();
    },
    methods: {
      fetchOrganizations() {
        let vm = this;
        backendGet('/staff/organizations')
            .then((response) => {
              vm.data = response.data.organizations
            })
            .catch((error) => {
              console.log(error);
              this.error = true
            })
            .finally(() => {
              vm.loading = false
            });
      }
    },
    components: {
    }
  }
</script>
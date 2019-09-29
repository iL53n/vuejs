<template lang="pug">
    div
        table
            h3 {{ message }}
            tr
                th ID
                th Full name
                th Phone
                th Email
            tr(v-for="client in clientList")
                td {{ client.id }}
                td {{ client.fullname }}
                td {{ client.phone }}
                td {{ client.email }}
        Createclient
</template>

<script>
  import { backendGet } from '../api/index'
  import Createclient from './create_client'

  export default {
    data () {
      return {
        clientList: [],
        message: 'All clients'
      }
    },
    created() {
      this.fetchClients()
    },
    methods: {
      fetchClients() {
        let vm = this;
        backendGet('/staff/clients')
            .then(function (response) {
              vm.clientList = response.data.clients
            })
            .catch(function (error) {
              console.log(error);
            })
            .finally(function () {
            });
      }
    },
    components: {
      Createclient
    }
  }
</script>

<style lang="scss">
    table {
        list-style-type: none;
        margin: 20px;
        font-family: "Helvetica Neue", Arial, sans-serif;
        border-spacing: 2px;
    }

    th {
        padding: 10px;
        color: white;
        background-color: royalblue;
    }

    td {
        padding: 10px;
        background-color: #e5e5e5;
    }
</style>